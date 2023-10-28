pipeline {
    agent {
        label 'jenkins-docker-agent'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Define Dockerfile path and image name
                    def dockerfile = 'Dockerfile'
                    def imageName = 'registry.digitalocean.com/team-foust-registry/default-ingres-nginx:latest'

                    // Run Kaniko to build the Docker image
                    sh """
                    docker run --rm -v /kaniko/.docker:/kaniko/.docker -v \${PWD}:/workspace gcr.io/kaniko-project/executor:latest --dockerfile=/workspace/${dockerfile} --destination=${imageName}
                    """
                }
            }
        }
    }
}
