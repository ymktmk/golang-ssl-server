# ssh-keygen -t rsa -f golang-ssl-server -N ''
# ssh -i ./golang-ssl-server ec2-user@18.183.232.33
resource "aws_key_pair" "key_pair" {
    key_name   = "golang-ssl-server"
    public_key = file("./golang-ssl-server.pub")
}

# Elastic IPを InternetGatewayに紐付ける 
resource "aws_eip" "eip" {
    vpc = true
    depends_on                = [aws_internet_gateway.igw]
}