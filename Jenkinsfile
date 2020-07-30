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
	    bat 'docker build --tag core_angular .'
		bat 'docker run --detach --name c_a'+env.BUILD_NUMBER+' core_angular'
		bat 'mkdir -p "C:/output/build-'+env.BUILD_NUMBER+'"'
		bat 'docker cp c_a:/app "c:/output/build-'+env.BUILD_NUMBER+'"'
		bat 'docker stop c_a'+env.BUILD_NUMBER
    	bat 'docker rm c_a'+env.BUILD_NUMBER
		bat 'powershell Compress-Archive -LiteralPath "C:/output/build-'+env.BUILD_NUMBER+'" -DestinationPath "C:/output/build-'+env.BUILD_NUMBER+'.zip" -Force'
      }
    }
		
  }
}
