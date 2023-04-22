



## Dockerization of this app

1. BE: packaged with <code> mvn clean package </code>, then used the respective Dockerfile
2. FE: packaged with <code>ng build</code>, then used the relative Dockerfile
3. DB: used a custom script that is executed on building of the db image, in order to create the db tables

