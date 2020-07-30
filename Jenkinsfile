#!groovy

pipeline {
  agent none
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
		bat 'docker cp bb:/app c:/build'
		bat 'docker stop c_a'
      }
    }
		
  }
}
