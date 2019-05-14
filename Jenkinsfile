node {

    def domain

    if (env.BRANCH_NAME == 'master') {
        domain = 'www.nearzero.io'
        deploy = 'deploy.sh'
    }
    else {
        domain = 'www2.nearzero.io'
        deploy = 'deploy-dev.sh'
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
                --restart always \
                --name ${domain} \
                -e 'CADDYPATH=/opt/caddy/.caddy' \
                -v /home/docker/volumes/${domain}/:/opt/caddy/ \
                --network='traefik' \
                --label 'traefik.enable=true' \
                --label 'traefik.docker.network=user-bridge' \
                --label 'traefik.basic.frontend.rule=Host:${domain}' \
                p0rt23/caddy
        """
    }

}
