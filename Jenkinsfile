pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-joke-app:1.0 .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 jenkins-joke-app:1.0'
            }
        }
    }

    post {
        success {
            echo 'Docker Pipeline SUCCESS 🎉'
        }
        failure {
            echo 'Docker Pipeline FAILED ❌'
        }
    }
}