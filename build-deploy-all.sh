USER=mcouck

# Eurekas: sl01748v.ops.vdab.be sl01749v.ops.vdab.be sl01750v.ops.vdab.be
# sudo yum install java-1.8.0-openjdk.x86_64

APP=${PWD##*/}
for SERVER in "$@"
do
    # echo Deploying to "$SERVER", killing app "$APP"
    # ssh-copy-id -i ~/.ssh/id_rsa.pub mcouck@$SERVER
    # sleep 1

    ssh $USER@$SERVER 'sudo pkill -9 -f java'

    # Deploy the certificate
    scp C:/etc/ssl/certs/vdab.jks $USER@$SERVER:/etc/ssl/certs
    ssh $USER@$SERVER 'sudo chmod 777 /etc/ssl/certs/vdab.jks'

    # Deploy the application
    ssh $USER@$SERVER 'sudo mkdir -p /opt/eureka-server; sudo chmod 777 -R /opt/eureka-server/*; sudo rm /opt/eureka-server/nohup.out'
    scp target/$APP-1.0.0.jar $USER@$SERVER:/opt/$APP
    ssh $USER@$SERVER 'sudo chmod 777 /opt/eureka-server/*; '
    ssh $USER@$SERVER 'cd /opt/eureka-server; java -jar -Dspring.profiles.active=sand-box eureka-server-1.0.0.jar >> nohup.out &' &
done