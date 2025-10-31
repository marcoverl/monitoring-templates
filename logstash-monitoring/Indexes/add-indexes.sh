USER=elastic && PASSW=$(kubectl -n elastic-system get secret eck-elasticsearch-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
indexes=(distances rses replicas dids accounts)
for i in ${indexes[@]}
do 
#curl -u "$USER:$PASSW" -k https://localhost:9200/rucio_$i/?pretty
#curl -u "$USER:$PASSW" -X DELETE -k https://localhost:9200/rucio_$i/?pretty
curl -u "$USER:$PASSW" -X PUT -k https://localhost:9200/rucio_$i/?pretty -H "Content-Type: application/json" -d @${i}-template.json
done
