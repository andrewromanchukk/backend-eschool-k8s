node {
    dockerfile {
        additionalBuildArgs "--build-arg DB_USER=${DB_USER}\
         --build-arg DB_HOST=${DB_HOST}\
          --build-arg DB_PASSWORD=${DB_PASSWORD}"
    }
    checkout scm
    stage('12345'){
        docker.withRegistry('https://eu.gcr.io/igneous-sum-312016/eschool_backend', 'gcr:gcr_eschool') {
        def customImage = docker.build("igneous-sum-312016/eschool_backend:${env.BUILD_NUMBER}")

        /* Push the container to the custom Registry */
        customImage.push()

                // customImage.push('latest')
    }
    }
    
}
