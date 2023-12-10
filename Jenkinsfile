pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = 'AKIA5WBTPYA3JCQDSGME'
        AWS_SECRET_ACCESS_KEY = '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'
        AWS_REGION = 'us-east-1'
        LOG_GROUP_NAME = 'practice'
        LOG_STREAM_NAME = "${BUILD_NAME}-${BUILD_NUMBER}"
    }

    stages {
        // stage('Publish to CloudWatch Logs') {
        //     steps {
        //         script {
        //             sh "aws configure set region ${AWS_REGION}"
        //             sh "aws logs create-log-stream --log-group-name ${LOG_GROUP_NAME} --log-stream-name ${LOG_STREAM_NAME}"
        //             sh "echo 'Hello cloudies Logs are on the way ..........!'"
        //         }
        //     }
        // }

        stage('Push Docker image to ECR') {
            steps {
                script {
                    sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 940705824822.dkr.ecr.us-east-1.amazonaws.com"
                    sh "docker build -t ambikabclient ."
                    sh "docker tag ambikabclient:latest 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
                    sh "docker push 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
                }
            }
        }

        stage('Pull Docker image from ECR') {
    steps {
        script {
            sh "docker pull 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest"
            sh 'docker container ls -a -f name=My-practice-website-client -q | xargs -r docker container rm'
           // sh "docker run -itd --name My-practice-website-client -p 4200:80 940705824822.dkr.ecr.us-east-1.amazonaws.com/ambikabclient:latest ng serve --host 0.0.0.0"
           sh "docker run -itd  -p 4200:80 --name My-practice-website-client"
        }
    }
}

    }
}
