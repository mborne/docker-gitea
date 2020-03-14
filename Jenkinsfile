pipeline {
    agent { label 'docker' }

    parameters {
        string(name: 'VERSION', defaultValue: '1.11.3', description: 'gitea version')
    }

    stages {
        stage('Build and push image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY_URL}", "${DOCKER_REGISTRY_CREDENTIAL_ID}") {
                        def app = docker.build('mborne/gitea',"--build-arg version=${params.VERSION} .")
                        app.push("${params.VERSION}")
                    }
                }
            }
        }
    }
}