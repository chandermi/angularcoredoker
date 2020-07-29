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
      }
    }
	
	stage('Docker run') {
      agent any
      steps {
        bat 'docker run --rm -it --name "core_container"  -p 8000:80 core_angular'
      }
    }
	
	stage('Docker Export') {
      agent any
      steps {
        bat 'docker export --output="build.tar" core_container'
      }
    }
	
  }
}
