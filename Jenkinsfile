pipeline {
    agent any
    stages {
        stage("build") {
            steps {
               echo "build the app ..."
               sh './mvnw package -Dcheckstyle.skip'
            }
        }
        stage("test") {
            steps {
               echo "test the app"
            }
        }
        stage("deploy") {
            steps {
               echo "deploy the app ..."
               sh 'docker build . -t  viswajith/petclinic'
               sh 'docker run -p 0.0.0.0:9999:9999  viswajith/petclinic'
            }
        }
    }
}
