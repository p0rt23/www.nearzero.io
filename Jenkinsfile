node {

    stage('Build') {
        checkout scm
        sh "docker build --no-cache -t p0rt23/caddy ."
    }

    stage('Deploy') {
        try {
            sh "docker stop www.nearzero.io"
            sh "docker rm www.nearzero.io"
        }
        catch (Exception e) { 
            
        }
        
        sh "./deploy.sh"

        sh ''' 
            docker run \
                -d \
                --restart always \
                --name www.nearzero.io \
                -e "CADDYPATH=/opt/caddy/.caddy" \
                -v /home/docker/volumes/www.nearzero.io/:/opt/caddy/ \
                --network="user-bridge" \
                --label "traefik.enable=true" \
                --label "traefik.docker.network=user-bridge" \
                --label "traefik.basic.frontend.rule=Host:www.nearzero.io" \
                p0rt23/caddy
        '''
    }

}
