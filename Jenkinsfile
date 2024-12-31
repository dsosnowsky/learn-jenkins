pipeline {
    agent any

    parameters {
        string(name: 'VERSION', defaultValue: 'latest', description: 'Version of the docker build')
    }

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t dsosnowsky/apache:${params.VERSION} .'
            }
        }
    }
}
