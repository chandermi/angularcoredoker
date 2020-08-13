#!groovy

pipeline {
  agent none
   
  stages {
   
    stage('Docker Build') {
      agent any
      steps {
	    bat 'docker build --tag core_angular'+env.BUILD_NUMBER+' .'
		bat 'docker run --detach --name c_a'+env.BUILD_NUMBER+' core_angular'+env.BUILD_NUMBER
		bat 'mkdir "C:/output/build-'+env.BUILD_NUMBER+'"'
		bat 'docker cp c_a'+env.BUILD_NUMBER+':/app "c:/output/build-'+env.BUILD_NUMBER+'"'
		bat 'docker stop c_a'+env.BUILD_NUMBER
    	bat 'docker rm c_a'+env.BUILD_NUMBER
		bat 'docker rmi core_angular'+env.BUILD_NUMBER
		bat 'powershell Compress-Archive -LiteralPath "C:/output/build-'+env.BUILD_NUMBER+'" -DestinationPath "C:/output/build_'+env.BUILD_NUMBER+'_'+env.BRANCH_NAME+'.zip" -Force'
      }
    }
	
		
  }
}
