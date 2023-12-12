pipeline {
    agent any

    stages {
        stage('Push Docker image to ECR') {
            steps {
                script {
                    // Authenticate Docker with ECR
                    sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 940705824822.dkr.ecr.us-east-1.amazonaws.com"

                    // Build Docker image
                    sh "docker build -t ambikabclient ."

                    // Tag Docker image
                    sh "docker tag ambikabclient:latest 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"

                    // Push Docker image to ECR
                    sh "docker push 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
                }
            }
        }

        stage('Pull Docker image from ECR') {
            steps {
                script {
                    // Pull Docker image from ECR
                    sh "docker pull 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"

                    // Remove existing container if it exists
                    sh 'docker container ls -a -f name=My-practice-website-client -q | xargs -r docker container rm -f'

                    // Run Docker container
                    sh "docker run -itd --name My-practice-website-client -p 4200:80 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
                    // You may add additional Docker run options or environment variables as needed
                    // sh "docker run -itd  -p 4200:80 --name My-practice-website-client  ng serve --host 0.0.0.0"
                }
            }
        }
    }
}
