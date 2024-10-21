#!/bin/bash
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash
dnf install gitlab-runner docker -y
systemctl enable docker.service --now &
gitlab-runner register --url https://gitlab.com --token $token --executor "docker" --docker-image alpine:latest -n
gitlab-runner run &