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
		bat 'docker build -t core_angular${DATETIME_TAG} .'
		bat 'docker run --publish 8000:8080 --detach --name c_a${DATETIME_TAG} core_angular${DATETIME_TAG}'
		bat 'docker cp c_a${DATETIME_TAG}:/app c:/output/build_${DATETIME_TAG}'
    	bat 'docker rm c_a${DATETIME_TAG}'
      }
    }
		
  }
}
