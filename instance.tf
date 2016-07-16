resource "aws_instance" "default" {
  tags {
    Name = "${var.role}-${var.project}"
    Environment = "${var.environment}"
    Project = "${var.project}"
    Role = "${var.role}"
    ForgeBucket = "telusdigital-forge"
    ForgeRegion = "eu-central-1"
  }

  # Set the size, type, speed, and the deletion policy on the instance's root block device
  root_block_device = {
    device_name = "/dev/sda"
    volume_type = "${var.instance_root_volume_type}"
    volume_size = "${var.instance_root_volume_size}"
    iops = "${var.instance_root_volume_provisioned_io}"
    delete_on_termination = "${var.instance_root_volume_delete_on_termination}"
  }

  # Launch instance with the specified size/type
  instance_type = "${var.instance_type}"

  # Launch the instance with the specified AMI
  ami = "${var.instance_ami}"

  # Launch the instance with the IAM instance profile, so it has access to it's needed AWS resources
  iam_instance_profile = "${var.instance_iam_instance_profile}"

  # Attach the instance to the list of security_group_ids. Split based on a comma to workaround Terraform not supporting lists.
  vpc_security_group_ids = ["${split(",", var.security_group_ids)}"]

  # Launch this instance into this subnet
  subnet_id = "${var.subnet_id}"

  # Feed the instance a cloud-init config or shell script, so post-instance configuration can run.
  user_data = "${var.user_data}"
}
