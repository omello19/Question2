pipeline {
    agent any

    environment {
        IMAGE_NAME = "square-calculator"
        CONTAINER_NAME = "square-container"
    }

    stages {
        stage('Checkout Code') {
            steps {
          
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Run Docker Container & Verify Output') {
            steps {
                script {
                 
                    sh "docker rm -f ${CONTAINER_NAME} || true"

               
                    def output = sh(script: "docker run --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest", returnStdout: true).trim()
                    echo "Container Output: ${output}"

                   if (output.contains("The square of 5 is 25")) {
                        echo "Verification SUCCESS: Output matches expected result!"
                    } else {
                        error("Verification FAILED: Unexpected output -> ${output}")
                    }
                }
            }
        }
    }

    post {
        always {
            sh "docker rm -f ${CONTAINER_NAME} || true"
        }
    }
}
