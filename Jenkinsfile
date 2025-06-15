pipeline {
  agent any

  environment {
    IMAGE_NAME = 'myjava1'
  }

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
        sh 'docker tag $IMAGE_NAME $DOCKER_BFLASK_IMAGE'
      }
    }

    stage('Test') {
      steps {
        sh 'docker run $IMAGE_NAME'
      }
    }

    stage('Deploy') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: "${DOCKER_REGISTRY_CREDS}",
            passwordVariable: 'DOCKER_PASSWORD',
            usernameVariable: 'DOCKER_USERNAME'
          )
        ]) {
          sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin docker.io'
          sh 'docker push $DOCKER_BFLASK_IMAGE'
        }
      }
    }
  }

  post {
    always {
      sh 'docker logout'
    }
  }
}
