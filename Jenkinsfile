#!groovy

pipeline {
  agent none
   
  stages {
   
    stage('Docker Build') {
      agent any
      steps {
	    bat 'docker build --tag core_angular'+env.BUILD_NUMBER+' .'
      }
    }
	
    stage('Docker Run') {
      agent any
      steps {
 	   bat 'docker run --detach --name c_a'+env.BUILD_NUMBER+' core_angular'+env.BUILD_NUMBER

      }
    }
	
	stage('Make output directory') {
      agent any
      steps {
 	   	bat 'mkdir "C:/output/build-'+env.BUILD_NUMBER+'"'

      }
    }
	
	stage('Extract output') {
      agent any
      steps {
 	   	bat 'docker cp c_a'+env.BUILD_NUMBER+':/app "c:/output/build-'+env.BUILD_NUMBER+'"'

      }
    }
	
	stage('Release resources') {
      agent any
      steps {
 	   	bat 'docker stop c_a'+env.BUILD_NUMBER
    	bat 'docker rm c_a'+env.BUILD_NUMBER
		bat 'docker rmi core_angular'+env.BUILD_NUMBER

      }
    }
	
	stage('Zip Build') {
      agent any
      steps {
 	   	bat 'powershell Compress-Archive -LiteralPath "C:/output/build-'+env.BUILD_NUMBER+'" -DestinationPath "C:/output/build_'+env.BUILD_NUMBER+'_'+env.BRANCH_NAME+'.zip" -Force'

      }
    }
		
  }
}
