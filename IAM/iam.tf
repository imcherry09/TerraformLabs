resource "aws_iam_user" "adminuser1" {
  name = "adminuser1"

}

resource "aws_iam_user" "adminuser2" {
  name = "adminuser2"

}

resource "aws_iam_group" "adminGroup" {
  name = "adminGroup"

}

resource "aws_iam_group_membership" "groupMembership" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.adminuser1.name,
    aws_iam_user.adminuser2.name,
  ]

  group = aws_iam_group.adminGroup.name
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  groups     = [aws_iam_group.group.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}