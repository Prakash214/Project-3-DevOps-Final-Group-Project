pipeline {
    agent any
     environment{
    }
    stages{
        stage('Install Ansible'){
            steps{
                sh 'sudo chmod +x ./script/ansible.sh'
                sh './script/ansible.sh'
            }
        }
        stage('Install updates, docker and kubectl using Ansible'){
            steps{
                sh 'cd ansible && ansible-playbook playbook.yaml'
            }
        }
        stage('Run Test for Frontend'){
            steps{
                sh 'sudo chmod +x ./script/test.sh'
                sh './script/test.sh'
            }
        }
        stage('Build Docker Images'){
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