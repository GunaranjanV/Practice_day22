pipeline {
    agent any

    tools {
        jdk 'java11'
        maven 'maven'
    }

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'practice', url: 'https://github.com/GunaranjanV/Practice_day22.git'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Maven build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker image creation') {
            steps {
                sh 'docker build -t guna/CI:1 .'
            }
        }
		stage('Docker image scan') {
            steps {
                sh "trivy image --format table -o trivy-image-report.html guna/CI:1"
            }
        }

        stage('Docker containerization') {
            steps {
                sh '''
                    docker stop website || true
                    docker rm website || true
                    docker run -it -d --name website -p 9000:8080 guna/CI:1
                '''
            }
        }
    }
}
