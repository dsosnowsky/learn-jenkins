pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t dsosnowskytest/apache:${VERSION} .'
            }
        }

        stage ('Test image') {
            steps {
                sh '''
                    docker logout
                    docker container run -d --name apache dsosnowskytest/apache:${VERSION}
                    docker container exec apache apachectl configtest
                    docker container stop apache
                    docker container rm apache
                '''
            }
        }

        stage ('Push image') {
            steps {
                sh '''
                echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin
                docker push dsosnowskytest/apache:${VERSION}
                '''
            }
           
        }
    }
}
