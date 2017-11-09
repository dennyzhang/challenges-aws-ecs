########## How To Use Docker Image ###############
##
##  Image Name: denny/aws-ecs-wordpress-study:latest
##  Git link: https://github.com/DennyZhang/aws-ecs-wordpress-study/blob/master/Dockerfile/nginx/Dockerfile
##  Build docker image:
##      time docker build --no-cache -f Dockerfile -t denny/aws-ecs-wordpress-study:latest --rm=true .
##  Test image:
##      docker run -p 8081:8081 --name nginx-test -d denny/aws-ecs-wordpress-study:latest
##      # bind /etc/hosts
##      curl -I -L http://jenkins.dennyzhang.com:8081
##      curl -I -L http://slack.dennyzhang.com:8081
##################################################
# Base Docker image: https://hub.docker.com/_/nginx/

FROM nginx

LABEL maintainer "Denny<contact@dennyzhang.com>"

ADD default.conf /etc/nginx/conf.d/default.conf

HEALTHCHECK --interval=5m --timeout=3s \
            CMD curl -I http://localhost:8081 | grep "HTTP/1.1 200 OK" || exit 1
