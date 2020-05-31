node {

    def domain
    def restart

    if (env.BRANCH_NAME == 'master') {
        domain  = 'www.nearzero.io'
        restart = 'always'
    }
    else {
        domain  = 'www2.nearzero.io'
        restart = 'no'
    }

    stage('Build') {
        checkout scm
        sh "docker build -t p0rt23/caddy ."
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
                -v /home/docker/backups/minecraft:/usr/share/caddy/minecraft/ \
                -v caddy-data-${domain}:/data \
                -v caddy-config-${domain}:/config \
                --network='traefik' \
                --label='traefik.enable=true' \
                --label='traefik.basic.frontend.rule=Host:${domain}' \
                p0rt23/caddy
        """
    }
}
