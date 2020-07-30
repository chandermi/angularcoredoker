#!groovy

pipeline {
  agent none
  environment {
 
  DATE_TAG = java.time.LocalDate.now()
  DATETIME_TAG = java.time.LocalDateTime.now()

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
		bat 'docker build -t core_angular .'
		bat 'docker run --publish 8000:8080 --detach --name c_a core_angular'
		bat 'docker cp c_a:/app c:/output/build'
		bat 'docker stop c_a'
    	bat 'docker rm c_a'
      }
    }
		
  }
}
