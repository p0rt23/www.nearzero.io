node {
    def domain, domainEscaped
    def restart
    def imageTag

    if (env.BRANCH_NAME == 'main') {
        domain   = 'www.nearzero.io'
        restart  = 'always'
        imageTag = 'latest'
    }
    else {
        domain  = 'www2.nearzero.io'
        restart = 'no'
        imageTag = 'develop'
    }
    domainEscaped = domain.replace('.', '-')

    stage('Build') {
        checkout scm
        sh "docker build -t p0rt23/www.nearzero.io:${imageTag} ."
    }

    stage('Deploy') {
        try {
            sh "docker stop ${domain}"
            sh "docker rm ${domain}"
        }
        catch (Exception e) { 
            
        }
        
        sh """
            docker run \
                -d \
                --restart=${restart} \
                --name=${domain} \
                --network='traefik' \
                --label='traefik.enable=true' \
                --label='traefik.http.routers.${domainEscaped}.rule=Host(`${domain}`)' \
                p0rt23/www.nearzero.io:${imageTag}
        """
    }
}
