pipeline{
	agent any

	tools {
		jdk 'java-11'
		maven 'maven'
	}

	stages{
		stage('Git checkout'){
			steps{
				git branch: 'Jenkins', url: 'https://github.com/GunaranjanV/Practice_day22.git'
			}
		}
		stage('Compile'){
			steps{
				sh 'mvn compile'
			}
		}		
		stage('Build'){
			steps{
				sh 'mvn clean install'
			}
		}
		
	}

}
