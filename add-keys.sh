# Configs: sl01736v.ops.vdab.be sl01745v.ops.vdab.be sl01747v.ops.vdab.be
# Eurekas: sl01748v.ops.vdab.be sl01749v.ops.vdab.be sl01750v.ops.vdab.be
# Gateways: sl01740v.ops.vdab.be sl01743v.ops.vdab.be sl01744v.ops.vdab.be
# Elastics:

for var in "$@"
do
	echo Deploying key to "$var"
	ssh-copy-id -i ~/.ssh/id_rsa.pub mcouck@$var
done