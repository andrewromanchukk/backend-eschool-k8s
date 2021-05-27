pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/andrewromanchukk/backend-eschool-k8s.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("igneous-sum-312016/hellowhale:${env.BUILD_ID}", "--build-arg DB_HOST=$DB_HOST", "--build-arg DB_PASSWORD=$DB_PASSWORD", "--build-arg DB_USER=$DB_USER" )
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/eschool_backend', 'gcr:gcr_eschool') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
//     stage('Deploy App') {
//       steps {
//         script {
//           kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mykubeconfig")
//         }
//       }
//     }

   }

}
