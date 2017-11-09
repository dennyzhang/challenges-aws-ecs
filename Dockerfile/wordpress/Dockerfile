########## How To Use Docker Image ###############
##
##  Image Name: denny/aws-ecs-wordpress-study:latest
##  Git link: https://github.com/DennyZhang/aws-ecs-wordpress-study/blob/master/Dockerfile/wordpress/Dockerfile
##  Build docker image:
##      time docker build --no-cache -f Dockerfile -t denny/aws-ecs-wordpress-study:wordpress --rm=true .
##  Test image:
##      docker run -p 8081:8081 --name wordpress-test -d denny/aws-ecs-wordpress-study:wordpress
##      # bind /etc/hosts for jenkins.dennyzhang.com and slack.dennyzhang.com
##      curl -I -L http://jenkins.dennyzhang.com:8081
##      curl -I -L http://slack.dennyzhang.com:8081
##################################################
# Base Docker image: https://github.com/DennyZhang/aws-ecs-wordpress-study/blob/master/Dockerfile/wordpress/Dockerfile

FROM denny/aws-ecs-wordpress-study:wordpress_v1

LABEL maintainer "Denny<contact@dennyzhang.com>"

USER root
