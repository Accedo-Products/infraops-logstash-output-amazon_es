def goBase = 'src/github.com/Accedo-Products'
def goProject = 'infraops-cloudtrail'
def goProjectDir = "$goBase/$goProject"
def service = "cloudtrail"
def region = "us-west-1"
def cluster_name = "ops"

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

    
}