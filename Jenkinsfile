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
                dir('terraform/') {
                    unstash 'myzip'
                    sh "terraform init -input=false"
                    sh "terraform apply -target=aws_s3_bucket.lambda_bucket -target=random_pet.lambda_bucket_name -target=aws_s3_bucket_acl.bucket_acl -target=aws_s3_object.lambda_hello_world -auto-approve"
                    sh "terraform apply -target=aws_lambda_function.hello_world -target=aws_cloudwatch_log_group.hello_world -target=aws_iam_role.lambda_exec -target=aws_iam_role_policy_attachment.lambda_policy -auto-approve"
                   
                    
    }
               
            }
        }
     stage('Integrate API gateway with lambda') {
            agent { label 'agent2t2' }
            steps {
              dir('terraform/') {
                    unstash 'myzip'
                    sh "terraform init -input=false"
                    sh "terraform apply -target=aws_apigatewayv2_api.lambda -target=aws_apigatewayv2_stage.lambda -target=aws_apigatewayv2_integration.hello_world -target=aws_apigatewayv2_route.hello_world -target=aws_cloudwatch_log_group.api_gw -target=aws_lambda_permission.api_gw -auto-approve"
                    
    }
               
            }
        }
    }
}
