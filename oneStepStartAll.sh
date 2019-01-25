if [ $# -ne 5 ];then
    echo $0 localIp nodeNum p2pPort httpPort wsPort
    exit 2
fi

localIp=$1
nodeNum=$2
p2pPort=$3
httpPort=$4
wsPort=$5
./createGenesisNode.sh ${localIp}
sleep 3s
./start.sh $nodeNum $p2pPort $httpPort $wsPort
