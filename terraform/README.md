<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                               | Version |
| ------------------------------------------------------------------ | ------- |
| <a name="requirement_proxmox"></a> [proxmox](#requirement_proxmox) | >=2.8.0 |

## Providers

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="provider_local"></a> [local](#provider_local)          | 2.1.0   |
| <a name="provider_proxmox"></a> [proxmox](#provider_proxmox)    | 2.9.6   |
| <a name="provider_template"></a> [template](#provider_template) | 2.2.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                        | Type        |
| --------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [local_file.k8s_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)                   | resource    |
| [local_file.var_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)                   | resource    |
| [proxmox_vm_qemu.proxmox_vm_master](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/vm_qemu)  | resource    |
| [proxmox_vm_qemu.proxmox_vm_workers](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/vm_qemu) | resource    |
| [template_file.k8s](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)               | data source |

## Inputs

| Name                                                                                       | Description                                   | Type     | Default         | Required |
| ------------------------------------------------------------------------------------------ | --------------------------------------------- | -------- | --------------- | :------: |
| <a name="input_gateway"></a> [gateway](#input_gateway)                                     | n/a                                           | `string` | `"192.168.3.1"` |    no    |
| <a name="input_master_ips"></a> [master_ips](#input_master_ips)                            | List of ip addresses for master nodes         | `any`    | n/a             |   yes    |
| <a name="input_networkrange"></a> [networkrange](#input_networkrange)                      | n/a                                           | `number` | `24`            |    no    |
| <a name="input_num_k3s_masters"></a> [num_k3s_masters](#input_num_k3s_masters)             | n/a                                           | `number` | `1`             |    no    |
| <a name="input_num_k3s_masters_mem"></a> [num_k3s_masters_mem](#input_num_k3s_masters_mem) | n/a                                           | `string` | `"4096"`        |    no    |
| <a name="input_num_k3s_nodes"></a> [num_k3s_nodes](#input_num_k3s_nodes)                   | n/a                                           | `number` | `2`             |    no    |
| <a name="input_num_k3s_nodes_mem"></a> [num_k3s_nodes_mem](#input_num_k3s_nodes_mem)       | n/a                                           | `string` | `"4096"`        |    no    |
| <a name="input_pm_host"></a> [pm_host](#input_pm_host)                                     | The hostname or IP of the proxmox server      | `string` | n/a             |   yes    |
| <a name="input_pm_node_name"></a> [pm_node_name](#input_pm_node_name)                      | name of the proxmox node to create the VMs on | `string` | `"pve"`         |    no    |
| <a name="input_pm_password"></a> [pm_password](#input_pm_password)                         | The password for the proxmox user             | `string` | n/a             |   yes    |
| <a name="input_pm_tls_insecure"></a> [pm_tls_insecure](#input_pm_tls_insecure)             | Set to true to ignore certificate errors      | `bool`   | `false`         |    no    |
| <a name="input_pm_user"></a> [pm_user](#input_pm_user)                                     | The username for the proxmox user             | `string` | `"root@pam"`    |    no    |
| <a name="input_ssh_private_key"></a> [ssh_private_key](#input_ssh_private_key)             | n/a                                           | `any`    | n/a             |   yes    |
| <a name="input_template_vm_name"></a> [template_vm_name](#input_template_vm_name)          | n/a                                           | `any`    | n/a             |   yes    |
| <a name="input_worker_ips"></a> [worker_ips](#input_worker_ips)                            | List of ip addresses for worker nodes         | `any`    | n/a             |   yes    |

## Outputs

| Name                                                              | Description |
| ----------------------------------------------------------------- | ----------- |
| <a name="output_Master-IPS"></a> [Master-IPS](#output_Master-IPS) | n/a         |
| <a name="output_worker-IPS"></a> [worker-IPS](#output_worker-IPS) | n/a         |

<!-- END_TF_DOCS -->
