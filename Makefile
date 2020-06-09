sqlfile=../obiba-home/opal/seed/data/CNSIM1.sql
network=obiba-demo

all: refresh mysqlrestore

refresh:
	./refresh.sh

mysql:
	sudo docker run -it --network $(network)_default --rm mysql:5 mysql -hmysqldata -uopal -ppassword opal

mysqldump:
	sudo docker run --network $(network)_default --rm mysql:5 mysqldump -hmysqldata -uopal -ppassword opal

mysqlrestore:
	sudo docker run -i --network $(network)_default --rm mysql:5 mysql -hmysqldata -uopal -ppassword opal < $(sqlfile)

r:
	sudo docker exec -i -t $(network)_rserver_1 /bin/bash
