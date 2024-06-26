locals {
  is_auto_config           = var.autoscaler_headroom_cpu_per_unit == null && var.autoscaler_headroom_memory_per_unit == null && var.autoscaler_headroom_num_of_units == null
  auto_headroom_percentage = local.is_auto_config ? var.autoscaler_auto_headroom_percentage : null
}

resource "aws_ecs_cluster" "default" {
  name = module.this.id
  tags = module.this.tags
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "spotinst_ocean_ecs" "default" {
  name         = module.this.id
  cluster_name = module.this.id
  region       = module.this.aws_region
  max_size     = var.max_size
  min_size     = var.min_size
  subnet_ids   = var.subnet_ids
  whitelist    = var.whitelist

  user_data = <<EOF
[settings.ecs]
cluster = "${module.this.id}"
allow-privileged-containers = ${var.ecs_allow_privileged_containers}
enable-spot-instance-draining = ${var.ecs_enable_spot_instance_draining}

[settings.metrics]
send-metrics = ${var.metrics_send_metrics}
EOF

  security_group_ids   = [module.sg.id]
  image_id             = data.aws_ssm_parameter.image_id.value
  iam_instance_profile = aws_iam_instance_profile.default.id
  key_pair             = var.key_pair
  draining_timeout     = 300
  ebs_optimized        = true

  instance_metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  autoscaler {
    is_enabled               = true
    is_auto_config           = local.is_auto_config
    auto_headroom_percentage = local.auto_headroom_percentage

    headroom {
      cpu_per_unit    = var.autoscaler_headroom_cpu_per_unit
      memory_per_unit = var.autoscaler_headroom_memory_per_unit
      num_of_units    = var.autoscaler_headroom_num_of_units
    }

    down {
      max_scale_down_percentage = 10
    }

    resource_limits {
      max_vcpu       = 20000
      max_memory_gib = 100000
    }
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = "true"
      volume_type           = "gp3"
      volume_size           = 30
    }
  }

  dynamic "optimize_images" {
    for_each = module.this.environment != "prod" ? ["true"] : []
    content {
      perform_at              = "always"
      should_optimize_ecs_ami = true
    }
  }

  update_policy {
    should_roll      = var.ocean_update_policy_should_roll
    conditioned_roll = true
    auto_apply_tags  = true
    roll_config {
      batch_size_percentage = 10
    }
  }

  tags {
    key   = "Name"
    value = module.this.id
  }

  tags {
    key   = "Orchestrator"
    value = "ecs"
  }
}

resource "aws_service_discovery_private_dns_namespace" "main" {
  name = var.service_discovery_private_dns_name
  vpc  = var.initial_vpc_id

  tags = module.this.tags
}

resource "aws_route53_vpc_association_authorization" "auth" {
  vpc_id  = var.vpc_id
  zone_id = data.aws_route53_zone.service_discovery.zone_id
}

resource "aws_route53_zone_association" "assoc" {
  provider = aws.owner
  vpc_id   = aws_route53_vpc_association_authorization.auth.vpc_id
  zone_id  = aws_route53_vpc_association_authorization.auth.zone_id
}
