resource "proxmox_vm_qemu" "proxmox_vm_master" {
  count       = var.num_k3s_masters
  name        = "k3s-master-${count.index}"
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  os_type     = "cloud-init"
  agent       = 1
  memory      = var.num_k3s_masters_mem
  cores       = 4

  ipconfig0 = "ip=${var.master_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      disk,
      network
    ]
  }

}

resource "proxmox_vm_qemu" "proxmox_vm_workers" {
  count       = var.num_k3s_nodes
  name        = "k3s-worker-${count.index}"
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  os_type     = "cloud-init"
  agent       = 1
  memory      = var.num_k3s_nodes_mem
  cores       = 4

  ipconfig0 = "ip=${var.worker_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      disk,
      network
    ]
  }

}

data "template_file" "k8s" {
  template = file("./templates/ansible_k8s.tpl")
  vars = {
    k3s_master_ip        = "${join("\n", [for instance in proxmox_vm_qemu.proxmox_vm_master : instance.default_ipv4_address])}"
    k3s_node_ip          = "${join("\n", [for instance in proxmox_vm_qemu.proxmox_vm_workers : instance.default_ipv4_address])}"
    ssh_private_key_file = "${var.ssh_private_key}"
    ssh_user_name        = "${var.ssh_user_name}"
  }
}

resource "local_file" "k8s_file" {
  content  = data.template_file.k8s.rendered
  filename = "../inventory/aragorn/hosts.ini"
}

resource "local_file" "var_file" {
  source   = "../inventory/sample/group_vars/all.yml"
  filename = "../inventory/aragorn/group_vars/all.yml"
}
