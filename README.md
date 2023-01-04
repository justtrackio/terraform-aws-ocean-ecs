# terraform-aws-ocean-ecs
Terraform module which creates an spotinst ocean ecs cluster

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.45.0 |
| <a name="requirement_spotinst"></a> [spotinst](#requirement\_spotinst) | >= 1.87.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.45.0 |
| <a name="provider_aws.owner"></a> [aws.owner](#provider\_aws.owner) | >= 4.45.0 |
| <a name="provider_spotinst"></a> [spotinst](#provider\_spotinst) | >= 1.87.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sg"></a> [sg](#module\_sg) | cloudposse/security-group/aws | 1.0.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_iam_instance_profile.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.amazon_ec2_container_service_for_ec2_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route53_vpc_association_authorization.auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_vpc_association_authorization) | resource |
| [aws_route53_zone_association.assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone_association) | resource |
| [aws_service_discovery_private_dns_namespace.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [spotinst_ocean_ecs.default](https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/ocean_ecs) | resource |
| [tls_private_key.ecs](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.service_discovery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_ssm_parameter.image_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_autoscaler_auto_headroom_percentage"></a> [autoscaler\_auto\_headroom\_percentage](#input\_autoscaler\_auto\_headroom\_percentage) | The auto-headroom percentage. Set a number between 0-200 to control the headroom % of the cluster. Relevant when isAutoConfig=true | `number` | `10` | no |
| <a name="input_autoscaler_headroom_cpu_per_unit"></a> [autoscaler\_headroom\_cpu\_per\_unit](#input\_autoscaler\_headroom\_cpu\_per\_unit) | Optionally configure the number of CPUs to allocate the headroom. CPUs are denoted in millicores, where 1000 millicores = 1 vCPU | `number` | `null` | no |
| <a name="input_autoscaler_headroom_memory_per_unit"></a> [autoscaler\_headroom\_memory\_per\_unit](#input\_autoscaler\_headroom\_memory\_per\_unit) | Optionally configure the amount of memory (MB) to allocate the headroom | `number` | `null` | no |
| <a name="input_autoscaler_headroom_num_of_units"></a> [autoscaler\_headroom\_num\_of\_units](#input\_autoscaler\_headroom\_num\_of\_units) | The number of units to retain as headroom, where each unit has the defined headroom CPU and memory | `number` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The region the cluster will run in | `string` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_create_key_pair"></a> [create\_key\_pair](#input\_create\_key\_pair) | Whether to create the key pair to attach the instances | `string` | `true` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_initial_vpc_id"></a> [initial\_vpc\_id](#input\_initial\_vpc\_id) | The VPC ID used for service discovery namespace creation when you are not the owner if var.vpc\_id. You can later on authorize the vpc to hosted zone association and tell the vpc owner to assign your hosted zone to the vpc. | `string` | `null` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | The key pair to attach the instances | `string` | `"ecs"` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The upper limit of instances the cluster can scale up to | `number` | `null` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The lower limit of instances the cluster can scale down to | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_service_discovery_private_dns_name"></a> [service\_discovery\_private\_dns\_name](#input\_service\_discovery\_private\_dns\_name) | The name of the namespace | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A comma-separated list of subnet identifiers for the Ocean cluster. Subnet IDs should be configured with auto assign public ip | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID | `string` | `null` | no |
| <a name="input_whitelist"></a> [whitelist](#input\_whitelist) | Instance types allowed in the Ocean cluster, Cannot be configured if blacklist is configured | `list(string)` | <pre>[<br>  "c4.large",<br>  "c4.xlarge",<br>  "c4.2xlarge",<br>  "c4.4xlarge",<br>  "c5.large",<br>  "c5.xlarge",<br>  "c5.2xlarge",<br>  "c5.4xlarge",<br>  "c5a.large",<br>  "c5a.xlarge",<br>  "c5a.2xlarge",<br>  "c5a.4xlarge",<br>  "c5ad.large",<br>  "c5ad.xlarge",<br>  "c5ad.2xlarge",<br>  "c5ad.4xlarge",<br>  "c5d.large",<br>  "c5d.xlarge",<br>  "c5d.2xlarge",<br>  "c5d.4xlarge",<br>  "c5n.large",<br>  "c5n.xlarge",<br>  "c5n.2xlarge",<br>  "c5n.4xlarge",<br>  "c6a.large",<br>  "c6i.large",<br>  "c6a.xlarge",<br>  "c6i.xlarge",<br>  "c6a.2xlarge",<br>  "c6i.2xlarge",<br>  "c6a.4xlarge",<br>  "c6i.4xlarge",<br>  "g4dn.xlarge",<br>  "g4dn.2xlarge",<br>  "i3.large",<br>  "i3.xlarge",<br>  "i3en.large",<br>  "i3en.xlarge",<br>  "i4i.large",<br>  "i4i.xlarge",<br>  "inf1.xlarge",<br>  "inf1.2xlarge",<br>  "m4.large",<br>  "m4.xlarge",<br>  "m4.2xlarge",<br>  "m5.large",<br>  "m5.xlarge",<br>  "m5.2xlarge",<br>  "m5a.large",<br>  "m5a.xlarge",<br>  "m5a.2xlarge",<br>  "m5ad.large",<br>  "m5ad.xlarge",<br>  "m5ad.2xlarge",<br>  "m5d.large",<br>  "m5d.xlarge",<br>  "m5d.2xlarge",<br>  "m5dn.large",<br>  "m5dn.xlarge",<br>  "m5dn.2xlarge",<br>  "m5n.large",<br>  "m5n.xlarge",<br>  "m5n.2xlarge",<br>  "m6i.large",<br>  "m6i.xlarge",<br>  "m6i.2xlarge",<br>  "m6a.large",<br>  "m6a.xlarge",<br>  "m6a.2xlarge",<br>  "r4.large",<br>  "r4.xlarge",<br>  "r5.large",<br>  "r5.xlarge",<br>  "r5a.large",<br>  "r5a.xlarge",<br>  "r5ad.large",<br>  "r5ad.xlarge",<br>  "r5b.large",<br>  "r5b.xlarge",<br>  "r5d.large",<br>  "r5d.xlarge",<br>  "r5dn.large",<br>  "r5dn.xlarge",<br>  "r5n.large",<br>  "r5n.xlarge",<br>  "r6i.large",<br>  "r6i.xlarge",<br>  "r6a.large",<br>  "r6a.xlarge",<br>  "z1d.large",<br>  "z1d.xlarge"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | Arn of the ecs cluster |
| <a name="output_ecs_cluster_id"></a> [ecs\_cluster\_id](#output\_ecs\_cluster\_id) | Id of the ecs cluster |
| <a name="output_key_pair_private_key"></a> [key\_pair\_private\_key](#output\_key\_pair\_private\_key) | private key for allowing to connect to the amazon linux 2 instances |
| <a name="output_key_pair_public_key"></a> [key\_pair\_public\_key](#output\_key\_pair\_public\_key) | public key used on the amazon linux 2 instances |
| <a name="output_service_discovery_dns_namespace_id"></a> [service\_discovery\_dns\_namespace\_id](#output\_service\_discovery\_dns\_namespace\_id) | ID of the discovery namespace |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
