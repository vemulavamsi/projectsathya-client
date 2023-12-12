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
                    sh 'docker container ls -a -f name=My-practice-website-client -q | xargs -r docker container rm'

                    // Run Docker container
                    sh "docker run --name My-practice-website-client -p 4200:80 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
                    // You may add additional Docker run options or environment variables as needed
                    // sh "docker run -itd  -p 4200:80 --name My-practice-website-client  ng serve --host 0.0.0.0"
                }
            }
        }
    }
}
// pipeline {
//     agent any

//     environment {
//         AWS_ACCESS_KEY_ID     = 'AKIA5WBTPYA3JCQDSGME'
//         AWS_SECRET_ACCESS_KEY = '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'
//         AWS_REGION = 'us-east-1'
//         LOG_GROUP_NAME = 'practice'
//         LOG_STREAM_NAME = "${BUILD_NAME}-${BUILD_NUMBER}"
//     }

//     stages {
//         stage('Push Docker image to ECR') {
//             steps {
//                 script {
//                     sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 940705824822.dkr.ecr.us-east-1.amazonaws.com"
//                     sh "docker build -t ambikabclient ."
//                     sh "docker tag ambikabclient:latest 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
//                     sh "docker push 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
//                 }
//             }
//         }

//         stage('Pull Docker image from ECR') {
//     steps {
//         script {
//             sh "docker pull 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
//             sh 'docker container ls -a -f name=My-practice-website-client -q | xargs -r docker container rm'
//             sh "docker run --name My-practice-website-client -p 4200:80 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
//            // sh "docker run -itd  -p 4200:80 --name My-practice-website-client  ng serve --host 0.0.0.0"
//         }
//     }
// }

//     }
// }
