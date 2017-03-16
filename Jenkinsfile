node('swarm') {
    registry_url = "https://index.docker.io/v1/" // Docker Hub
    docker_creds_id = "damien-dockerhub-crendentials" // name of the Jenkins Credentials ID
    build_tag = "3.3" // default tag to push for to the registry
    gitRepositoryUrl = "https://github.com/dmariage/jenkins-slave.git"
    imageName = "damienma/jenkins-slave"
    
    //git gitRepositoryUrl
    checkout scm
    
    docker.withRegistry(registry_url, docker_creds_id) {
        
        stage('build') {
            taigaImage = docker.build("${imageName}:${env.BUILD_TAG}", '.')
        }
        
        stage('push') {
            taigaImage.push()
        }
        
        stage('push-latest') {
            taigaImage.push(build_tag)
        }
        
    }
    
}
