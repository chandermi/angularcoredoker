#!groovy

pipeline {
  agent none
   environment {
        ENV_NAME = "${env.BRANCH_NAME}"
  }
  stages {
   
    stage('Docker Clean') {
      agent any
      steps {
        bat 'docker volume prune --force'
      }
    }
   
    stage('Docker Build Linux') {
      agent any
      steps {
		bat 'docker run --publish 8000:8080 --detach --name c_a core_angular'+env.BRANCH_NAME
		bat 'mkdir -p C:/output/build-'+${env.BRANCH_NAME}
		bat 'docker cp c_a:/app c:/output/build-${env.BRANCH_NAME}'
		bat 'docker stop c_a'
    	bat 'docker rm c_a'
		bat 'powershell Compress-Archive -LiteralPath "C:/output/build-${env.BRANCH_NAME}" -DestinationPath "C:/output/build-${env.BRANCH_NAME}-${env.BUILD_NUMBER}.zip" -Force'
		bat 'rmdir "C:/output/build-${env.BRANCH_NAME}" /S /Q'
      }
    }
		
  }
}
