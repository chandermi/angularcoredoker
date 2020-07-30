#!groovy

pipeline {
  agent none
  environment {
    
        CurrentTime = new Date()
        DB_ENGINE    = 'sqlite'
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
        bat 'docker stop c_a'
		bat 'docker build -t core_angular .'
		bat 'docker run --publish 8000:8080 --detach --name c_a$CurrentTime core_angular'
		bat 'docker cp bb:/app c:/output/build_$CurrentTime'
      }
    }
		
  }
}
