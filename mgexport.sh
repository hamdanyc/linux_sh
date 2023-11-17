echo "export news"
mongoexport --host=$HOST \
--port=27017 \
--username=abi \
--password=$PASSWORD \
--authenticationDatabase=admin \
--collection=media \
--db=news \
--out=/mnt/sda/pve/mongodb/newsdb.json

echo "ahli"
mongoexport --host=$HOST \
--port=27017 \
--username=rafoc \
--password=$PASSWORD \
--authenticationDatabase=admin \
--collection=ahli \
--db=rafoc \
--out=/mnt/sda/pve/mongodb/ahli.json

echo "minit"
mongoexport --host=$HOST \
--port=27017 \
--username=rafoc \
--password=$PASSWORD \
--authenticationDatabase=admin \
--collection=minit \
--db=rafoc \
--out=/mnt/sda/pve/mongodb/minit.json
