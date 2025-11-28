pipeline{
    agent any
    stages{
        stage('server ip'){
            steps{
                sh '''
                echo "server ip : $(hostname -I)"
                '''
            }
        }
        stage('uptime'){
            steps{
                sh '''
                echo "uptime is : $(uptime)"
            '''
            }
        }
    }
}
