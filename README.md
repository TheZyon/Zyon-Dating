

# Zyon Dating - the best present for your best friend 

## Soon on AWS!!

## Dockerization of this app

1. BE: packaged with <code> mvn clean package </code>, then used the respective Dockerfile,
    you find it at https://hub.docker.com/repository/docker/zyonb/zd-be/general
2. FE: packaged with <code>ng build</code>, then used the relative Dockerfile,
    you find it at https://hub.docker.com/repository/docker/zyonb/zd-fe/general
3. DB: used a custom script that is executed on building of the db image, in order to create the db tables
    you find it at https://hub.docker.com/repository/docker/zyonb/zd-db/general



