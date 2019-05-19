node {

    def domain
    def restart

    if (env.BRANCH_NAME == 'master') {
        domain  = 'www.nearzero.io'
        deploy  = 'deploy.sh'
        restart = 'always'
    }
    else {
        domain  = 'www2.nearzero.io'
        deploy  = 'deploy-dev.sh'
        restart = 'no'
    }

    stage('Build') {
        checkout scm
        sh "docker build --no-cache -t p0rt23/caddy ."
    }

    stage('Deploy') {
        try {
            sh "docker stop ${domain}"
            sh "docker rm ${domain}"
        }
        catch (Exception e) { 
            
        }
        
        sh "./${deploy}"

        sh """
            docker run \
                -d \
                --restart ${restart} \
                --name ${domain} \
                -e 'CADDYPATH=/opt/caddy/.caddy' \
                -v /home/docker/volumes/${domain}/:/opt/caddy/ \
                --network='traefik' \
                --label 'traefik.enable=true' \
                --label 'traefik.basic.frontend.rule=Host:${domain}' \
                p0rt23/caddy
        """
    }

}
