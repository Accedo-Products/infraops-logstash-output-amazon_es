def region = "us-west-1"
def file = "logstash-output-amazon_es-2.0.1.zip"


node('chef') {
    
    git url: 'git@github.com:Accedo-Products/infraops-logstash-output-amazon_es.git'
    
    tool name: 'Default', type: 'git'

    step([$class: 'WsCleanup'])

    stage('checkout repo') {
        checkout scm
    }

    stage('Build docker image') {
        sh "docker build -t logstash-output ."
    }
    
    stage('Build offline package with docker') {
        sh "docker run -i -t -v ${PWD}:/var/build_dir logstash-output"
    }
    
    stage('Upload to s3') {
        withAWS(region: "$region") {
            s3Upload(file: $file, bucket:'accedo-infra-tools', path:"logstash/$file")
        }
    }
}