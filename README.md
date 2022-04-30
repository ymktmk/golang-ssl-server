# GoをHTTPSサーバーにする

```
docker rmi -f golang-ssl-server
```

```
docker build -t golang-ssl-server .
```

```
docker run -it golang-ssl-server bash
```

```
docker tag golang-ssl-server:latest 009554248005.dkr.ecr.ap-northeast-1.amazonaws.com/
golang-ssl-server:v1
```

```
docker push 009554248005.dkr.ecr.ap-northeast-1.amazonaws.com/golang-ssl-server:v1
```

```
cd terraform
```

```
terraform apply
```

https://www.ymktmk.ga

http://www.ymktmk.ga

<!-- いける -->
http://54.65.66.161
<!-- いけない -->
https://54.65.66.161

ssh -i ./golang-ssl-server ec2-user@54.65.66.161
docker system prune