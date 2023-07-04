node {

    def domain, domainEscaped
    def restart

    if (env.BRANCH_NAME == 'master') {
        domain  = 'www.nearzero.io'
        restart = 'always'
    }
    else {
        domain  = 'www2.nearzero.io'
        restart = 'no'
    }
    domainEscaped = domain.replace('.', '-')

    stage('Build') {
        checkout scm
        sh "docker build -t p0rt23/www.nearzero.io ."
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
                -v /home/docker/backups/minecraft:/www/minecraft:ro \
                --network='traefik' \
                --label='traefik.enable=true' \
                --label='traefik.http.routers.${domainEscaped}.rule=Host(`${domain}`)' \
                p0rt23/www.nearzero.io
        """
    }
}
