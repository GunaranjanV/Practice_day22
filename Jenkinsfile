pipeline{
    agent{
        label {'prod'}
    }
    stages{
        stage('server ip'){
            steps{
                sh '''
                hostname -I
                echo "server ip : $(hostname -I)"
                '''
            }
        }
        stage('uptime'){
            steps{
                sh '''
                uptime
                echo "uptime is : $(uptime)"
            '''
            }
        }
    }
}
