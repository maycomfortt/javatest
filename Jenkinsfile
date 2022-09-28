pipeline {
   agent any
     tools { 
      maven 'marven-3.8.6' 
      jdk 'JDK' 
    }
   environment {
     // You must set the following environment variables
     // ORGANIZATION_NAME
     // YOUR_DOCKERHUB_USERNAME (it doesn't matter if you don't have one)

     SERVICE_NAME = "javatest"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'GitHub', url: "https://github.com/${ORGANIZATION_NAME}/${SERVICE_NAME}"
         }
      }
      stage('Build') {
         steps {
            sh '''mvn clean package'''
         }
      }

      stage('Build and Push Image') {
         steps {
           sh 'docker image build -t ${REPOSITORY_TAG} .'
         //   sh 'docker logout'
         //   sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
         //   sh 'docker tag jenkins/jenkins:lts-jdk11 $dockerhub_USR/${REPOSITORY_TAG}'
         //   sh 'docker push $dockerhub_USR/${REPOSITORY_TAG}'
         }
      }

      // stage('Deploy to Cluster') {
      //     steps {
      //               sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl apply -f -'
      //     }
      // }
   }
}
