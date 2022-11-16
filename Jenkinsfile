pipeline {
    agent any
    tools {
        maven '3.8.6'
    }

    stages {
        stage('Compile') {
            steps {
                echo 'Compiling...'
                sh "./mvnw clean compile -e"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh "./mvnw clean test -e"            
            }
        }
        stage('Package') {
            steps {
                echo 'Packaging...'
                sh "./mvnw clean package -e"            
            }
        }
        stage('sonar') {
           steps{
              withSonarQubeEnv(credentialsId:'sonartoken',installationName:'local-sonar') { 
                sh 'mvn sonar:sonar'
             }
          }
        } 
        stage('uploadNexus') {
           steps{
             [$class: 'NexusPublisherBuildStep',
                 nexusInstanceId: 'Nexus',
                 nexusRepositoryId: 'devops-usach-nexus',
                 packages: [[$class: 'MavenPackage',
                       mavenCoordinate: [artifactId: 'DevOpsUsach2020', groupId: 'com.devopsusach2020', packaging: 'jar', version: '0.0.1'],
                       mavenAssetList: [
                          [classifier: '', extension: 'jar', filePath: '${WORKSPACE}/build/DevOpsUsach2020-0.0.1.jar']
                       ] 
                   ]
                 ]
             ]
           }
        }       
        
    }    
}
