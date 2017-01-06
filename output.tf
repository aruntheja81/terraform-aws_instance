output "instance_public_ip" {
  value = "${aws_instance.default.public_ip}"
}

output "instance_id" {
  value = "${aws_instance.default.id}"
}

output "instance_private_ip" {
  value = "${aws_instance.default.private_ip}"
}

output "instance_public_dns" {
  value = "${aws_instance.default.public_dns}"
}
