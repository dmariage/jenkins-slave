# jenkins-slaves
Jenkin swarm slaves with docker installed and accessible to docker slave. 


## Running

To run a Docker container customizing the different tools with your credentials

    docker run \
    -e JENKINS_USERNAME=jenkins \
    -e JENKINS_PASSWORD=jenkins \
    -e JENKINS_MASTER=http://jenkins:8080 \
    damienma/jenkins-slave

### Optional Environment Variables

You can specify optional environment variables below when invoking docker run to customize the behavior of the swarm client.

| Parameter       | Default Value       | Description                                                                |
|-----------------|---------------------|----------------------------------------------------------------------------|
| SLAVE_EXECUTORS | number of cpu cores | This value specifies the number of concurrent jobs this worker can process |
| SLAVE_NAME      | swarm-client        | This value specifies the name of slave that will appear on Jenkins UI      |
| SLAVE_LABELS    | None                | This value specifies the labels you want to give for the launching slave   |

### Optional Volumes

You can map the slave work directory to share or reuse working directory when other slaves run on same host or to retrieve existing FS when container restart

| Volume                  | Description                                       |
|-------------------------|---------------------------------------------------|
| /var/jenkins_slave_home | slave work directory, the remote FS root          |