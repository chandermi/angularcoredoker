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
	
	 stage('SonarQube') {
      agent any
      steps {
	    bat 'dotnet tool install –global dotnet-sonarscanner'
		bat 'dotnet sonarscanner begin /d:sonar.login=admin /d:sonar.password=admin /k:”secretpwd”'
		bat 'dotnet build'
		bat 'dotnet sonarscanner end /d:sonar.login=admin /d:sonar.password=admin'
      }
    }
		
  }
}
