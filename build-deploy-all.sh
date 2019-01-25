USER=mcouck

# Eurekas: sl01748v.ops.vdab.be sl01749v.ops.vdab.be sl01750v.ops.vdab.be
# sudo yum install java-1.8.0-openjdk.x86_64

APP=${PWD##*/}
for SERVER in "$@"
do
    ssh ${USER}@${SERVER} 'sudo rm /opt/eureka-server/nohup.out'
    scp target/${APP}-1.0.0.jar ${USER}@${SERVER}:/opt/${APP}
    ssh ${USER}@${SERVER} 'cd /opt/eureka-server; java -javaagent:/opt/elastic-apm-agent-1.1.0.jar -Delastic.apm.server_urls=http://sl01757v.ops.vdab.be:8200 -Delastic.apm.service_name=eureka -Delastic.apm.application_packages=com.netflix -Dspring.profiles.active=sand-box -jar eureka-server-1.0.0.jar >> nohup.out &' &
done