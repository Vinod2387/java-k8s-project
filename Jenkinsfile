pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        GITHUB_TOKEN = credentials('github-token')
        KUBECONFIG = credentials('kubeconfig')
        IMAGE_NAME = "yourdockerhub/java-k8s-app"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/youruser/java-k8s-app.git', credentialsId: 'github-token'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        def image = docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                        image.push()
                        image.push("latest")
                    }
                }
            }
        }

        stage('Deploy to K8s') {
            steps {
                withEnv(["KUBECONFIG=${KUBECONFIG}"]) {
                    sh 'kubectl set image deployment/java-app java-app=yourdockerhub/java-k8s-app:${BUILD_NUMBER}'
                }
            }
        }
    }
}
