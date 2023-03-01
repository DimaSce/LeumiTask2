pipeline {
    agent none
    stages {
        stage('build1') {
            agent { label 'agent1t2' }
            steps {
                dir('lambda_s3/') {
                    sh "chmod +x ./terraformw"
                    sh 'terraformw apply -auto-approve -no-color'
                    
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
