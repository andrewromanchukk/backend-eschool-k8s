pipeline {

  agent any
  environment 
      {
        DB_HOST = ':jdbc:mysql://104.198.247.139:3306/eschool'
        DB_USER = 'eschool'
        DB_PASSWORD = '1234'
      }
  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/andrewromanchukk/backend-eschool-k8s.git', branch:'master'
      }
    }
    
      stage("Build image") {
            // environment {
            //     DB_HOST = credentials('DB_HOST')
            //     DB_USER = credentials('DB_USER')
            //     DB_PASSWORD = credentials('DB_PASSWORD')
            //   }
            steps {
                script {
                    myapp = docker.build("igneous-sum-312016/hellowhale:${BUILD_ID}", "--build-arg DB_HOST=$DB_HOST --build-arg DB_USER=$DB_USER --build-arg DB_PASSWORD=$DB_PASSWORD --no-cache .")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/hellowhale', 'gcr:gcr_eschool') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
  //   stage('Deploy App') {
  //     steps {
  //       script {
  //         kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mykubeconfig")
  //       }
  //     }
  //   }

  // }
  }
}