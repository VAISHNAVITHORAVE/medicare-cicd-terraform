pipeline {
    agent any

    environment {
        EC2_USER = "ubuntu"
        EC2_IP = "65.2.3.102"
        APP_DIR  = "/var/www/html"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Fetching MediCare source code from GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Installing dependencies and building Vite React app...'
                bat 'npm install'
                bat 'npm run build'
            }
        }

        stage('Test & Validate') {
            steps {
                echo 'Running TypeScript type-checking and verifying build artifacts...'
                bat 'npx tsc --noEmit'
                bat 'if not exist dist\\index.html exit 1'
                echo 'Build validation passed successfully!'
            }
        }

        stage('Deploy to EC2') {
            steps {
                echo 'Deploying compiled dist/ folder to AWS EC2 Nginx server...'
                sshagent(credentials: ['medicare-ec2-key']) {
                    bat """
                        ssh -o StrictHostKeyChecking=no %EC2_USER%@%EC2_IP% "rm -rf %APP_DIR%/*"
                        scp -o StrictHostKeyChecking=no -r dist/* %EC2_USER%@%EC2_IP%:%APP_DIR%/
                        ssh -o StrictHostKeyChecking=no %EC2_USER%@%EC2_IP% "sudo systemctl restart nginx"
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'MediCare CI/CD Pipeline completed and deployed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check console logs for details.'
        }
    }
}
