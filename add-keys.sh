# Eurekas: sl01748v.ops.vdab.be sl01749v.ops.vdab.be sl01750v.ops.vdab.be
# Configs: sl01736v.ops.vdab.be sl01745v.ops.vdab.be sl01747v.ops.vdab.be
# Gateways: sl01740v.ops.vdab.be sl01743v.ops.vdab.be sl01744v.ops.vdab.be
# Elastics: sl01757v.ops.vdab.be sl01758v.ops.vdab.be sl01759v.ops.vdab.be
# Query service: sl01737v.ops.vdab.be

# keytool -genkey -alias vdab -storetype jks -keyalg RSA -keysize 2048 -ext SAN=dns:sl01748v.ops.vdab.be,dns:sl01749v.ops.vdab.be,dns:sl01750v.ops.vdab.be,dns:sl01736v.ops.vdab.be,dns:sl01745v.ops.vdab.be,dns:sl01747v.ops.vdab.be,dns:sl01740v.ops.vdab.be,dns:sl01743v.ops.vdab.be,dns:sl01744v.ops.vdab.be,dns:sl01757v.ops.vdab.be,dns:sl01758v.ops.vdab.be,dns:sl01759v.ops.vdab.be,dns:localhost,dns:sl01737v.ops.vdab.be,ip:127.0.0.1 -keystore "vdab.jks" -validity 3650
# keytool -importkeystore -srckeystore vdab.jks -destkeystore vdab.p12 -srcstoretype JKS - deststoretype PKCS12 -deststorepass 3DHpdKDFVafErV7X

for var in "$@"
do
	echo Deploying key to "$var"
	ssh-copy-id -i ~/.ssh/id_rsa.pub mcouck@$var
done