pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Satishganiyada/python-application'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'docker build -t python:v1 .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'docker run --rm python:v1 pytest'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'docker compose up -d'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker login -u satish2323 -p Satish@216"
                    sh "docker push python:v1"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}