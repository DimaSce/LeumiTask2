pipeline {
    agent none
    stages {
        stage('zip file') {
            agent { label 'agent2t2' }
            steps {
                dir('hello-world/') {
                    sh "zip hello-world.zip hello.js"
                    stash includes: 'hello-world.zip', name:'myzip'
                            
    }
               
            }
        }
        stage('Create Lambda Function and S3') {
            agent { label 'agent1t2' }
            steps {
                dir('lambda_s3/') {
                    unstash 'myzip'
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                   
                    
    }
               
            }
        }
     stage('Integrate API gateway with lambda') {
            agent { label 'agent2t2' }
            steps {
              dir('api_gateway/') {
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                    
    }
               
            }
        }
    }
}
