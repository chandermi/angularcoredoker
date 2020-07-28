#!groovy

pipeline {
  agent none
  stages {
   
    stage('Docker Build') {
      agent any
      steps {
        bat 'docker build -t core_angular .'
      }
    }
  }
}