localIp=$1
nodeNum=$2
p2pPort=$3
httpPort=$4
wsPort=$5
./createGenesisNode.sh ${localIp}
sleep 30s
./start.sh nodeNum p2pPort httpPort wsPort
