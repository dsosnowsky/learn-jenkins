pipeline {
    agent any

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t dsosnowsky/apache:${VERSION} .'
            }
        }

        stage ('Test image') {
            steps {
                sh '''
                    docker container run -d --name apache dsosnowsky/apache:${VERSION}
                    docker container exec apache apachectl configtest
                    docker container stop apache
                    docker container rm apache
                '''
            }
        }

        stage ('Push image') {
            sh '''
                docker login -u dsosnowsky -p ${PASSWORD}
                docker push dsosnowsky/apache:${VERSION}
            '''
        }
    }
}
