pipeline{
	agent any

	tools {
		jdk 'jdk11'
		maven 'maven3'
	}
    environment {
        SCANNER_HOME= tool 'sonar-scanner'
    }

	stages{
		stage('Git checkout'){
			steps{
				git branch: 'Jenkins', url: 'https://github.com/GunaranjanV/Practice_day22.git'
			}
		}
		stage('Compile'){
			steps{
				sh 'mvn clean install'
			}
		}		
		stage('sonarqube analysis'){
			steps{
				sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.url=http://43.205.103.161:9000/ -Dsonar.login=squ_10a8016455f3cdff2784f48f51fdb877dd8ca878 -Dsonar-projectName=shopping-cart \
                -Dsonar.java.binaries-. \
                -Dsonar.projectKey=shopping-cart '''
			}
		}
		
	}

}
