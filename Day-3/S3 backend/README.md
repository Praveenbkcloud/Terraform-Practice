1. created a dummy infra in aws and stored the state file in s3 backend.

2. deleted the statefile in the s3 bucket and tried 'terraform apply' , terraform will be ready to create the infra due to the missing of the state file.

3. using s3 bucket versioning, state file is recovered. then while 'terraform apply' the original state of the infra is achieved.
