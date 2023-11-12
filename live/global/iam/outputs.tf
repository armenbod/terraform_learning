# output "user_arns" {
#   value       = module.users[*].user_arn
#   description = "The ARNs of the created IAM users"
# }

# output "all_users" {
#   value = aws_iam_user.example
# }


output "user_arns" {
  value       = values(module.users)[*].user_arn
  description = "The ARNs of the created IAM users"
}

output "upper_names" {
  value = [for name in var.user_names : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.user_names : upper(name) if length(name) < 5]
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "for_directive" {
  value = "%{ for name in var.names }${name}, %{ endfor }"
}

output "for_directive_index" {
  value = "%{ for i, name in var.names }(${i}) ${name}, %{ endfor }"
}

output "neo_cloudwatch_policy_arn" {
  value = one(concat(
    aws_iam_user_policy_attachment.full_access[*].policy_arn,
    aws_iam_user_policy_attachment.read_only[*].policy_arn
  ))
}

output "for_directive_index_if" {
  value = <<EOF
%{ for i, name in var.names }
  ${name}%{ if i < length(var.names) - 1 }, %{ endif }
%{ endfor }
EOF
}

output "for_directive_index_if_else_strip" {
  value = <<EOF
%{~ for i, name in var.names ~}
${name}%{ if i < length(var.names) - 1 }, %{ else }.%{ endif }
%{~ endfor ~}
EOF
}

