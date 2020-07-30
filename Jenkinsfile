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
	    echo 'Building Branch: "${ENV_NAME}"' + env.BRANCH_NAME
		bat 'docker build -t core_angular .'
		bat 'docker run --publish 8000:8080 --detach --name c_a core_angular'
		bat 'docker cp c_a:/app c:/output/build'
		bat 'docker stop c_a'
    	bat 'docker rm c_a'
		bat 'powershell Compress-Archive -LiteralPath ${env.BUILDPATH} -DestinationPath ${env.BINARIESPATH}/build${EXECUTOR_NUMBER}.zip -Force'
		bat 'del /f ${env.BUILDPATH}'
      }
    }
		
  }
}
