pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'srinivasraop03'
        DOCKERHUB_REPO = 'my-portfolio'
        DOCKER_CRED = 'dockerhub-cred'
    }


    stages {
        
        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Srinivasraop03/My-Portfolio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKERHUB_USER}/${DOCKERHUB_REPO}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CRED}") {
                        dockerImage.push()
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploy on EC2') {
            steps {
                sh """
                  docker rm -f portfolio-app || true
                  docker run -d -p 80:80 --name portfolio-app ${DOCKERHUB_USER}/${DOCKERHUB_REPO}:latest
                """
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed. Check logs."
        }
    }
}
