# challenges-aws-ecs
<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

[![Build Status](https://travis-ci.org/DennyZhang/challenges-aws-ecs.svg?branch=master)](https://travis-ci.org/DennyZhang/challenges-aws-ecs) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/challenges-aws-ecs/issues) or star [the repo](https://github.com/DennyZhang/challenges-aws-ecs).

**Similar Challenges**: https://www.dennyzhang.com/battle

Case study using AWS ECS to setup personal wordpress

Live Demo: https://www.dennyzhang.com

# Requirements
Case study using AWS ECS to setup personal wordpress
1. Make the blog as available as you can
2. Make the blog loads as fast as you can
3. Make the blog cost as low as you can

<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-aws-ecs/master/images/aws_ecs_wordpress.png"/> </a>
<a href="https://www.dennyzhang.com"><img src="https://raw.githubusercontent.com/DennyZhang/challenges-aws-ecs/master/images/aws_ecs.png"/> </a>

# Improvements Opportunities
- TODO: Avoid host nginx.conf in git repo
- TODO: wordpress docker image: no need to check-in image

End Users -> nginx
```
   80 -> http(8081)
   443 -> https(8441)
```

nginx -> backend
```
   http://www.dennyzhang.com:8081 -> 8083
   https://www.dennyzhang.com:8441 -> 8443
   http://slack.dennyzhang.com:8081 -> 3000
   http://brain.dennyzhang.com:8081 -> 8082   
```
## Nginx proxy

```
http://jenkins.dennyzhang.com:8081
http://slack.dennyzhang.com:8081
http://brain.dennyzhang.com:8081
```

```
- TODO
http://www.dennyzhang.com:8081
https://www.dennyzhang.com:8081
```

<a href="https://www.dennyzhang.com"><img align="right" width="201" height="268" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/denny_201706.png"></a>

# TODO:
- TODO: avoid manually add xmlrpc_denny.php
- TODO: add nginx proxy server

# Use commands
```
docker pull denny/challenges-aws-ecs:wordpress_v2 && \
docker pull denny/challenges-aws-ecs:nginx && \
docker pull denny/devops-blog:latest
docker pull denny/devops-blog:nginx-proxy
```

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>
