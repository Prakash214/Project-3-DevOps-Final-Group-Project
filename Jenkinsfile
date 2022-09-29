pipeline {
    agent any
     environment{
        DOCKER_USERNAME=credentials('DOCKER_USERNAME')
        DOCKER_PASSWORD=credentials('DOCKER_PASSWORD')
    }
    stages{
        stage('Install Ansible'){
            steps{
                sh 'sudo chmod +x ./script/ansible.sh'
                sh './script/ansible.sh'
            }
        }
        stage('Install updates, aws cli, kubectl using Ansible'){
            steps{
                sh 'cd ansible && ansible-playbook playbook-initial.yaml'
            }
        }
        stage('Run Test for Frontend'){
            steps{
                sh 'sudo chmod +x ./script/test.sh'
                sh './script/test.sh'
            }
        }
        stage('Install docker, build docker images and clean docker images'){
            steps{
                sh 'cd ansible && ansible-playbook playbook-docker.yaml -e USERNAME=${DOCKER_USERNAME} -e PASSWORD=${DOCKER_PASSWORD}'
            }
        }
        stage('Kubernetes'){
            steps{
                sh ''
            }
        }
    }
}