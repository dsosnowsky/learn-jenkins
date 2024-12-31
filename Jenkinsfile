pipeline {
    agent any

    parameters {
        string(name: 'VERSION', defaultValue: 'latest', description: 'Build version')
    }

    stages {
        stage('Build image') {
            steps {
                echo "$VERSION"
            }
        }
    }
}
