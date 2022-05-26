[master]
${k3s_master_ip}

[node]
${k3s_node_ip}

[k3s_cluster:children]
master
node

[k3s_cluster:vars]
ansible_ssh_private_key_file=${ssh_private_key_file}
ansible_ssh_user=${ssh_user_name}
