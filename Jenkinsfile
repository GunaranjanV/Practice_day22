pipeline{
	agent any

	tools {
		jdk 'java11'
		maven 'maven'
	}
	stages{
		stage('Git checkout'){
			steps{
				git branch: 'practice', url:'https://github.com/GunaranjanV/Practice_day22.git'
			}
		}
		stage('Compile'){
			steps{
				sh 'mvn compile'
			}
		}
		stage('Maven build'){
			steps{
				sh 'mvn clean install'
			}
		}
		stage('Compile'){
			steps{
				sh 'mvn compile'
			}
		}						
        stage('Docker image creation'){
			steps{
				sh 'docker build -t guna/CI:1 .'
			}
	    }
		stage('Docker containarization'){
			steps{
				sh '''
					docker stop c1 || true
					docker rm c1 || true
					docker run -it -d --name website -p 9000:8080 guna/CI:1
					'''
			}
		}
		
	}
}
