pipeline {
    agent none
    stages {
        stage('build1') {
            agent { label 'agent1t2' }
            steps {
                dir('lambda_s3/') {
                    sh "terraform init"
                    sh "terraform apply --auto-approve"
                    
    }
               
            }
        }
     stage('build2') {
            agent { label 'agent2t2' }
            steps {
                sh "terraform init"
                sh "terraform apply --auto-approve"
               
            }
        }
    }
}
