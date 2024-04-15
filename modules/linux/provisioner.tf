resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.vmlinux]
  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
  }

  connection {
    type        = "ssh"
    user        = var.admin-username
    private_key = file(var.priv_key)
    host        = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)
  }
}