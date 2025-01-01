pipeline {
    agent any

    environment {
        DOCKER_HUB = credentials('docker-hub-test')
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
                docker login -u dsosnowsky -p ${DOCKER_HUB}
                docker push dsosnowskytest/apache:${VERSION}
                '''
            }
           
        }
    }
}
