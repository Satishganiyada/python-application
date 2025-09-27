pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "satish2323/python:v1"
        CONTAINER_NAME = "python-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Satishganiyada/python-application'
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t satish2323/python:v1 ."
            }
        }

        stage('Test Container') {
            steps {
                script {
                    echo 'Testing container...'
                    // Stop & remove old container if exists
                    sh """
                        docker ps -q --filter "name=${CONTAINER_NAME}" | grep -q . && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true
                    """
                    // Run a fresh container just to verify it works
                    sh "docker run --rm --name ${CONTAINER_NAME} ${DOCKER_IMAGE} echo 'Container started successfully!'"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying with Docker Compose...'
                sh 'docker compose up -d'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker login -u satish2323 -p Satish@216"
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! ✅'
        }
        failure {
            echo 'Pipeline failed ❌'
        }
    }
}
