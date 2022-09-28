pipeline {
    agent any
     environment{
    }
    stages{
        stage('Install packages and dependencies'){
            steps{
                sh 'cd ansible && ansible-playbook -i inventory.yaml playbook.yaml'
            }
        }
        stage('Run Test for Frontend and Backend'){
            steps{
                sh 'sudo chmod +x ./script/test.sh'
                sh './script/test.sh'
            }
        }
        stage('Build Docker Images using Docker Compose'){
            steps{
                sh 'sudo chmod +x ./script/build.sh'
                sh './script/build.sh'
            }
        }
        stage('Kubernetes'){
            steps{
                sh ''
            }
        }
    }
}