pipeline {
    agent {
        label 'jenkins-docker-agent'
    }

    stages {
        stage('Build Docker Image') {
            container('kaniko') {
                script {
                    // Run Kaniko to build the Docker image
                    sh """
                    /kaniko/executor --dockerfile `pwd`/Dockerfile \
                                     --context `pwd` \ 
                                     --destinationregistry.digitalocean.com/team-foust-registry/default-ingres-nginx:${BUILD_NUMBER}
                    """
                }
            }
        }
    }
}
