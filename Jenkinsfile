pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning the repo'
                git branch: 'main', url: 'https://github.com/kundanadileepm/InsureMe.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Packaging the code'
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                sh 'docker build -t kundanadileepm/insureme-app:latest .'
            }
        }
        stage('Docker Login & Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh 'docker tag kundanadileepm/insureme-app:latest kundanadileepm/insureme-app:latest'
                    sh 'docker push kundanadileepm/insureme-app:latest'
                    }
                }
            }
        stage('Configure and Deploy to the test-server') {
            steps {
                    ansiblePlaybook(
                        playbook: 'ansible-playbook.yml',
                        inventory: 'ansible/inventory.ini',
                        credentialsId: 'ansible-key',
                        disableHostKeyChecking: true,
                        become: true,
                        becomeUser: 'root',
                        installation: 'ansible'
                    )
                }
            }
        }
    }
