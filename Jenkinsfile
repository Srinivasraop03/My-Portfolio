pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'srinivasraop03'
        DOCKERHUB_REPO = 'my-portfolio'
        DOCKER_CRED = 'dockerhub-cred'
    }

    parameters {
        booleanParam(name: 'FORCE_BUILD', defaultValue: false, description: 'Force build even if no changes')
    }

    options {
        skipDefaultCheckout()  // Prevent automatic checkout
        buildDiscarder(logRotator(numToKeepStr: '10'))  // Keep last 10 builds
        disableConcurrentBuilds()
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
                    docker pull ${DOCKERHUB_USER}/${DOCKERHUB_REPO}:latest
                    docker rm -f portfolio-app || true
                    docker run -d -p 80:80 --name portfolio-app ${DOCKERHUB_USER}/${DOCKERHUB_REPO}:latest
                """
            }
        }
    }

    post {
        always {
            echo "Build finished. Check the app at http://54.226.105.204/"
        }
    }
}
