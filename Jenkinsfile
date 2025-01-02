pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t ${DOCKER_HUB_CREDENTIALS_USR}/${IMAGE_NAME}:${VERSION} .'
            }
        }

        stage ('Test image') {
            steps {
                sh '''
                    docker container run -d --name ${IMAGE_NAME} ${DOCKER_HUB_CREDENTIALS_USR}/${IMAGE_NAME}:${VERSION}
                    docker container exec ${IMAGE_NAME} apachectl configtest
                    docker container stop ${IMAGE_NAME}
                    docker container rm ${IMAGE_NAME}
                '''
            }
        }

        stage ('Approval') {
            steps {
                timeout(30) {
                input message: '', ok: 'I\'m ready to push the image'
                }
            }
        }

        stage ('Push image') {
            steps {
                sh '''
                echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin
                docker push ${DOCKER_HUB_CREDENTIALS_USR}/${IMAGE_NAME}:${VERSION}
                '''
            }
           
        }

        stage ('Deploy') {
            steps {
                sshagent(credentials: ['dsosnowski-ssh']){
                    sh '''
                        ssh -o StrictHostKeyChecking=no dsosnowski@192.168.0.17
                        echo "Hello World"
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
