output "ci-cd-tools-jenkins-public-ip" {
  description = "Public IP of CI-CD tools instance jenkins"
  value = module.jenkins.public_ip
}

output "jenkins_agent" {
  description = "public IP of jenkins agent"
  value = module.jenkins_agent.public_ip
}

output "jenkins-url" {
  description = "URL to access Jenkins"
  value       = "http://jenkins.hemanthkumar.online:8080"
}