resource "aws_iam_instance_profile" "instance_profile" {
  name = local.instance_profile_role_name
  role = aws_iam_role.imagebuilder_role.name
}

resource "aws_iam_role_policy_attachment" "instance_role_managed_policy_attachment" {
  role       = aws_iam_role.imagebuilder_role.name
  count      = length(var.iam_policy_arn)
  policy_arn = var.iam_policy_arn[count.index]
}

resource "aws_iam_role" "imagebuilder_role" {
  name = local.imagebuilder_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "imagebuilder.amazonaws.com",
          "ec2.amazonaws.com"
        ]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "managed_policy_attachment" {
  role       = aws_iam_role.imagebuilder_role.name
  count      = length(var.iam_policy_arn)
  policy_arn = var.iam_policy_arn[count.index]
}
