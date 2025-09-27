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
            agent {
                docker {
                    image 'python:v1' // Uses the Docker image built in the previous stage
                    args '-v /tmp:/tmp' // Optional: Mount a volume if needed for test results or data
                }
            }
            steps {
                sh './run-tests.sh' // Executes a shell script containing your test commands inside the container
                // Or directly run test commands:
                // sh 'npm test' // For Node.js projects
                // sh 'mvn test' // For Java Maven projects
                // sh 'pytest' // For Python projects
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml' // Optional: Publish JUnit test results
                }
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