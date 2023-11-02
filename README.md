# terraform_learning

Following the series outlined by [gruntwork.io](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca#.b6sun4nkn).

**Steps:**

1. Deployed a single web server cluster on AWS using EC2 through terraform declarative state files written in HCL
2. Deployed a web server cluster with Auto-Scaling across multiple subnets and ALB to distribute traffic evenly across instances
3. Extending to save state files on S3 (rather than locally), isolating state files through workspaces and then by file layout (staging, production). Deploying a RDS db instance to connect to server.
4. Use terraform modules to avoid duplication of configurations when changing between states
