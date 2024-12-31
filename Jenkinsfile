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
                    docker container run -it dsosnowsky/apache:${VERSION}
                    apachectl configtest
                    exit
                '''
            }
        }
    }
}
