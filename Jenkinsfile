#!groovy

pipeline {
  agent none
  stages {
   
    stage('Docker Clean') {
      agent any
      steps {
        bat 'docker volume prune'
      }
    }
   
    stage('Docker Build Linux') {
      agent any
      steps {
        bat 'docker build -t core_angular .'
      }
    }
	
	stage('Docker Build Windows') {
      agent any
      steps {
        bat 'docker build --pull -t core_angular:nanoserver -f Dockerfile.nanoserver-x64 .'
      }
    }
  }
}