pipeline {
    agent any
     environment{
        DOCKER_USERNAME=credentials('DOCKER_USERNAME')
        DOCKER_PASSWORD=credentials('DOCKER_PASSWORD')
        AWS_ACCESS_KEY=credentials('AWS_ACCESS_KEY')
        AWS_SECRET_KEY=credentials('AWS_SECRET_KEY')
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
                sh 'ansible-playbook playbook-initial.yaml'
            }
        }
        stage('Run Test for Frontend'){
            steps{
                sh 'sudo chmod +x ./script/test.sh'
                sh './script/test.sh'
            }
        }
        stage('Install docker, build docker images and clean docker images using Ansible'){
            steps{
                sh 'ansible-playbook playbook-docker.yaml -e USERNAME=${DOCKER_USERNAME} -e PASSWORD=${DOCKER_PASSWORD}'
            }
        }
        stage('Configure AWS'){
            steps{
                sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY && aws configure set aws_secret_access_key $AWS_SECRET_KEY && aws configure set region "eu-west-2" && aws configure set output "json"'
            }
        }
        stage('Kubernetes'){
            steps{
                sh 'aws eks --region eu-west-2 update-kubeconfig --name DemoCluster' 
                sh 'sudo chmod +x ./script/kubernetes.sh'
                sh './script/kubernetes.sh'
            }
        }
    }
}