pipeline {
    agent any

    parameters {
        string(name: 'VERSION', defaultValue: 'latest', description: 'Version of the docker build')
    }

    stages {
        stage('Build image') {
            steps {
                sh '''
                VERSION=${params.VERSION}
                sh 'echo "${VERSION}"'
                '''
            }
        }
    }
}
