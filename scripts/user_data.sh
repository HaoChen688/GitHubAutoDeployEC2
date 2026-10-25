#!/bin/bash
set -euxo pipefail

# 更新系统
dnf update -y

# 安装 Nginx
dnf install -y nginx git

# 启动 Nginx
systemctl enable nginx
systemctl start nginx

# 部署一个示例页面
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head><title>Deployed by Terraform + GitHub Actions</title></head>
<body>
  <h1>Hello from EC2!</h1>
  <p>Repo: GitHubAutoDeployEC2</p>
  <p>Region: us-east-1</p>
  <p>Deployed at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")</p>
</body>
</html>
EOF

# 自定义应用部署区域，例如从仓库拉取应用
# git clone https://github.com/<ORG>/GitHubAutoDeployEC2.git /opt/app
# ...