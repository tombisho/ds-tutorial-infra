sqlfile=../obiba-home/opal/seed/data/CNSIM1.sql
network=obiba-demo

all: refresh mysqlrestore datashield-alt

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

datashield-alt:
	Rscript install.R
	#opal rest -o https://opal-demo.obiba.org -u administrator -p password -m POST "/datashield/packages?name=tombisho%2FdsGeo&ref=master"
	opal rest -o https://opal-demo.obiba.org -u administrator -p password -m POST "/datashield/packages?name=isglobal-brge%2FdsOmics&ref=master"

clean-docker:
	sudo docker image prune -f
	#docker volume rm $(docker volume ls -f dangling=true -q)
