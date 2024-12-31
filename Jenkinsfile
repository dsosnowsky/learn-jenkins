pipeline {
    agent any

    stages {
        stage('Build image') {
            sh 'docker build -t dsosnowsky/apache .'
        }
    }
}
