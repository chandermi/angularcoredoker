#!groovy

pipeline {
  agent none
  environment {
        VERSION = '1.0.0'
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
		bat 'docker build -t core_angular$VERSION .'
		bat 'docker run --publish 8000:8080 --detach --name c_a$VERSION core_angular$VERSION'
		bat 'docker cp c_a$VERSION:/app c:/output/build_$VERSION'
    	bat 'docker rm c_a$VERSION'
      }
    }
		
  }
}
