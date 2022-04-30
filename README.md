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

https://aws.code-run.ga
<!-- いける -->
http://aws.code-run.ga
http://54.65.66.161

ssh -i ./golang-ssl-server ec2-user@54.65.66.161
docker system prune


sudo yum update
sudo yum -y install wget
wget https://bootstrap.pypa.io/get-pip.py
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python get-pip.py

wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto


sudo wget -r --no-parent -A 'epel-release-*.rpm' https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/
sudo rpm -Uvh dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-*.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable epel*
sudo yum install -y certbot python2-certbot-apache


cd /opt
sudo yum -y install git
sudo git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt/letsencrypt-auto-source
./letsencrypt-auto certonly -a standalone -d aws.code-run.ga


<!-- これで -->
sudo yum -y install certbot
sudo certbot --apache certonly
vi /etc/httpd/conf/httpd.conf

