USER=mcouck

# Eurekas: sl01748v.ops.vdab.be sl01749v.ops.vdab.be sl01750v.ops.vdab.be
# yum install java-1.8.0-openjdk.x86_64

APP=${PWD##*/}
for SERVER in "$@"
do
    echo Deploying to "$SERVER", killing app "$APP"
    ssh $USER@$SERVER 'ps -ef | grep java'
    ssh $USER@$SERVER 'sudo pkill -9 -f java'

    # Deploy the certificate
    ssh $USER@$SERVER 'sudo touch /etc/ssl/certs/vdab.jks; sudo chmod 777 /etc/ssl/certs/vdab.jks'
    scp src/main/resources/trash/vdab.jks $USER@$SERVER:/etc/ssl/certs
    ssh $USER@$SERVER 'sudo chmod 777 /etc/ssl/certs/vdab.jks'

    # Deploy the application
    ssh $USER@$SERVER 'sudo mkdir -p /opt/eureka-server; sudo chmod 777 -R /opt/eureka-server'
    ssh $USER@$SERVER 'sudo chmod 777 -R /opt/eureka-server'
    scp target/$APP-1.0.0.jar $USER@$SERVER:/opt/$APP
    ssh $USER@$SERVER 'sudo chmod 777 /opt/eureka-server/*; ls -lh /opt/eureka-server'
    ssh $USER@$SERVER 'cd /opt/eureka-server; java -jar -Dspring.profiles.active=sand-box eureka-server-1.0.0.jar >> nohup &' &
done