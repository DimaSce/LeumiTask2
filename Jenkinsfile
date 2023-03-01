pipeline {
    agent none
    stages {
        stage('build1') {
            agent { label 'agent1t2' }
            steps {
                sh "ls"
               
            }
        }
     stage('build2') {
            agent { label 'agent2t2' }
            steps {
                sh "ls"
               
            }
        }
    }
}
