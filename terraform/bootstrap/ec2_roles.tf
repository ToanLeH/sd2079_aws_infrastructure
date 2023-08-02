resource "aws_iam_role" "sd2079" {
  name               = "sd2079-${var.project}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.trust-policies-sd2079-assume-role.json
}

resource "aws_iam_role" "sd2079_2" {
  name               = "sd2079-${var.project}-0002"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.trust-policies-sd2079-assume-role.json
}

resource "aws_iam_role_policy" "sd2079" {
  name   = "sd2079-role-${var.project}-policy"
  role   = aws_iam_role.sd2079.id
  policy = data.aws_iam_policy_document.sd2079-role-policy.json
}

data "aws_iam_policy_document" "trust-policies-sd2079-assume-role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# We define what sd2079 role can do here Identity-base policies

data "aws_iam_policy_document" "sd2079-role-policy" {
  statement {
    actions = [
      "*"
    ]

    resources = [
      "arn:aws:s3:::terraform-boostrap-toanleh-devops"
    ]
  }
}
