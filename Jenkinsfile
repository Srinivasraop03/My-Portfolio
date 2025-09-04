pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-portfolio"
        DOCKER_REGISTRY = "srinivasraop03"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Srinivasraop03/My-Portfolio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'srinivasraop03', passwordVariable: 'Srivv@1992')]) {
                    script {
                        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                            docker.image("${IMAGE_NAME}:latest").push()
                        }
                    }
                }
            }
        }

        stage('Deploy via Ansible') {
            steps {
                ansiblePlaybook credentialsId: 'ssh-credentials', playbook: 'ansible/deploy.yml'
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Pipeline Failed!"
        }
    }
}
