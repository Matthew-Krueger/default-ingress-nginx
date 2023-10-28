pipeline {
    agent {
        kubernetes {
            label 'kaniko-builder'
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: kaniko-builder
spec:
  containers:
  - name: jnlp
    image: jenkins/inbound-agent:4.6-1
  - name: kaniko
    image: gcr.io/kaniko-project/executor:latest
    args: ["--dockerfile=Dockerfile", "--context=\${WORKSPACE}", "--destination=team-foust-registry/default-nginx:latest"]
  """
        }
    }

    environment {
        KANIKO_SECRET = credentials('your-dockerhub-credentials')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                container('kaniko') {
                    sh """
                    /kaniko/executor \
                    --dockerfile=Dockerfile \
                    --context=\$PWD \
                    --destination=team-foust-registry/default-nginx:latest
                    """
                }
            }
        }
    }
}
