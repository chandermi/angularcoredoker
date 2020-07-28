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
   
    stage('Docker Build') {
      agent any
      steps {
        bat 'docker build -t core_angular .'
      }
    }
  }
}