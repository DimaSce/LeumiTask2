pipeline {
    agent none
    stages {
        stage('zip file') {
            agent { label 'agent2t2' }
            steps {
                dir('lambda_s3/hello-world/') {
                    sh "zip hello-world.zip hello.js"
                    stash includes: 'hello-world.zip', name:'myzip'
                    //sh "terraform init"
                    //sh "terraform apply -auto-approve"
                    //sh "chmod +x ./terraformw"
                    //sh './terraformw apply -auto-approve -no-color'
                    
    }
               
            }
        }
        stage('build1') {
            agent { label 'agent1t2' }
            steps {
                dir('lambda_s3/') {
                    sh "ls"
                    sh "rm hello-world.zip"
                    unstash 'myzip' 
                    sh "ls"
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                    //sh "chmod +x ./terraformw"
                    //sh './terraformw apply -auto-approve -no-color'
                    
    }
               
            }
        }
     stage('build2') {
            agent { label 'agent2t2' }
            steps {
                
              dir('api_gateway/') {
                    sh "ls"
                    sh "terraform init"
                    sh "terraform apply -auto-approve"
                    //sh "chmod +x ./terraformw"
                    //sh './terraformw apply -auto-approve -no-color'
                    
    }
               
            }
        }
    }
}
