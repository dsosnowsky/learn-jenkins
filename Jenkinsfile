pipeline {
    agent any

    environment {
        VERSION = "1.1"
    }

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t dsosnowsky/apache:$VERSION .'
            }
        }
    }
}
