pipeline {
    agent any
    environment {
        DOCKERHUB_USER = "vaibhavgumalwad"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/VaibhavGumalwad/CasestudyDevops.git'
            }
        }
stage('Build & Push Docker Image') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', 
                                          usernameVariable: 'DOCKER_HUB_USERNAME', 
                                          passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            sh './scripts/build_and_push.sh'
        }
    }
}

        stage('Terraform Apply') {
            steps {
                dir('infra') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Ansible Deploy') {
            steps {
                sh 'ansible-playbook -i ansible/hosts.ini ansible/deploy.yml'
            }
        }
    }
}
