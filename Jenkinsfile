pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                echo 'Compiling...'
                sh "./mvnw.cmd clean compile -e"
            }
        }
        stage('Test') {
                echo 'Testing...'
                sh "./mvnw.cmd clean test -e"            
        }
        stage('Package') {
                echo 'Packaging...'
                sh "./mvnw.cmd clean package -e"            
        }        
        
    }    
}
