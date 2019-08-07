# docker-terraform
A docker that runs terraform

Commands to build, tag a push docker image to Docker Hub.

```bash
docker build -t docker-terraform:0.0.1 .

docker tag docker-terraform:0.0.1 devlware/docker-terraform:0.0.1

docker push devlware/docker-terraform:0.0.1
```