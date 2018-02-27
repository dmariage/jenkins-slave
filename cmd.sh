#!/bin/sh

# options at https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin

# jenkins swarm slave
JAR=`ls -1 $HOME/swarm-client-*.jar | tail -n 1`

PARAMS=""
if [ ! -z "$JENKINS_USERNAME" ]; then
  PARAMS="$PARAMS -username $JENKINS_USERNAME"
fi
if [ ! -z "$JENKINS_PASSWORD" ]; then
  PARAMS="$PARAMS -passwordEnvVariable JENKINS_PASSWORD"
fi

if [ ! -z "$SLAVE_EXECUTORS" ]; then
  PARAMS="$PARAMS -executors $SLAVE_EXECUTORS"
fi

if [ ! -z "$SLAVE_LABELS" ]; then
  echo $SLAVE_LABELS > $HOME/slaveLabels
  PARAMS="$PARAMS -labelsFile $HOME/slaveLabels"
fi

if [ ! -z "$SLAVE_NAME" ]; then
  PARAMS="$PARAMS -name $SLAVE_NAME"
fi

if [ ! -z "$JENKINS_MASTER" ]; then
  PARAMS="$PARAMS -master $JENKINS_MASTER"
fi

if [ ! -z "$JENKINS_SLAVE_MODE" ]; then
  PARAMS="$PARAMS -mode $JENKINS_SLAVE_MODE"
fi


java $JAVA_OPTS -jar $JAR $PARAMS -fsroot $WORK_DIR -showHostName $JENKINS_SLAVE_OTHER_PARAMS
