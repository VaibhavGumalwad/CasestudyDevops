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
stage('Build & Push Docker') {
      steps {
        script {
          withCredentials([usernamePassword(
            credentialsId: 'dockerhub',
            usernameVariable: 'DOCKER_USERNAME',
            passwordVariable: 'DOCKER_PASSWORD'
          )]) {
            sh '''
              echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
              docker build -t vaibhavgumalwad/myapp:$GIT_COMMIT .
              docker push vaibhavgumalwad/myapp:$GIT_COMMIT
            '''
          }
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
