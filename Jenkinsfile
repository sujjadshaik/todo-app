pipeline{
    agent any;
     tools{
       maven 'maven'
       jdk 'JDK'
   }
    stages{
        
        stage('Maven package'){
            steps{
                bat 'mvn -f app/pom.xml package'

            }
        }
     /*   stage('sonar analysis'){
            steps{
                withSonarQubeEnv('sonar'){
                    bat 'mvn -f app/pom.xml sonar:sonar'
                }
            }
        }
        stage('deploy to artifactor'){
            steps{
                rtUpload (
            serverId: 'ARTIFACTORY-SERVER',
            spec: '''{
                 "files": [
                             {
                                "pattern": "app/target/*.war",
                                "target": "art-doc-dev-loc/"
                            }
                        ]
            }''',
            )

            }
        }
        stage('download artifact'){
            steps{
                 rtDownload (
                 serverId: "ARTIFACTORY-SERVER",
                spec:"""{
                     "files": [
                                {
                                    "pattern": "art-doc-dev-loc/**",
                                    "target": "app/artifacts/"      
                                }
                            ]
              }"""
            )
            
            }
        }

        */
        stage('Docker build'){
            steps{
               
                    bat 'docker image prune -a --force'
                    bat 'docker-compose build'
                
                
            }
        }
        stage('Pushing images to docker hub'){
            steps{
                
                   bat "docker login -u linubajy -p linubajy1997"
                   bat "docker tag Demo1_app:latest linubajy/todo-app:v${env.BUILD_ID}"
                bat "docker push linubajy/todo-app:v${env.BUILD_ID}"

            }
        }
        /*
        stage('creating kubernetes cluster'){
            steps{
                   dir("C:/Users/Welcome/Desktop/New folder/learn-terraform-provision-aks-cluster"){
                   //bat "cd C:\Users\Welcome\Desktop\New folder\learn-terraform-provision-aks-cluster"
                   bat "terraform init"
                bat "terraform plan"
               }
            }
        }
        stage('deploying it to kubernetes'){
            steps{
                //bat 'chmod +x change-tag.sh'
                //bat """./change-tag.sh v${env.BUILD_ID}"""
                //bat 'cat k8s/api-deployment.yaml'
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kube-azure', namespace: '', serverUrl: 'https://content-jackal-k8s-656e8d92.hcp.westus2.azmk8s.io:443') {
                                // some block
                    bat 'kubectl apply -f k8s/database-deployment.yaml'
                    
                }
                sleep(120)
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kube-azure', namespace: '', serverUrl: 'https://content-jackal-k8s-656e8d92.hcp.westus2.azmk8s.io:443') {
                                // some block
                    bat 'kubectl apply -f k8s/api-deployment.yaml'
                    bat 'kubectl get pods'
                    bat 'kubectl get svc'
                    
                }

            }
        }
    */

    }
}
