# Java Web App Deployment with Jenkins + Kubernetes + DockerHub + GitHub

## Workflow
1. Developer pushes code to GitHub.
2. Jenkins pulls code, builds with Maven.
3. Docker image is built and pushed to DockerHub.
4. Kubernetes deployment is updated using `kubectl set image`.

## Requirements
- Jenkins with necessary plugins and credentials.
- DockerHub and GitHub integration.
- Kubernetes cluster managed via KOPS.
# java-k8s-project
