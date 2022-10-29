#!/bin/bash
sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from Richard's Terraform created website</h1>" | sudo tee /var/www/html/index.html