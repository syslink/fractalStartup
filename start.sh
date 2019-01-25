# when start 5 node, the command should be:
# ./start.sh 5 14000 14100 14200

# Explaination:
# ./start.sh start.sh nodeNum p2pPort httpPort wsPort 
  # nodeNum: the new node number
  # p2pPort: the begining p2p port, the first new node will use the value of p2pPort, the second new node is p2pPort+1, up to p2pPort + nodeNum - 1
  # httpPort: the begining http port, the first new node will use the value of httpPort, the second new node is httpPort+1, up to httpPort + nodeNum -1
  # wsPort: the begining ws port, the first new node will use the value of wsPort, the second new node is wsPort+1, up to wsPort + nodeNum + 1

mkdir -p ./datadir

nodeNum=$1
p2pPort=$2
httpPort=$3
wsPort=$4

ftExeFile="ft"
for file_a  in ./*
do  
    temp_file=`basename $file_a`
    if [[ $temp_file =~ ft ]]
    then
        $ftExeFile=$temp_file
        break
    fi   
done

while nodeNum > 0
do
    ps x | grep $p2pPort | awk '{print $1}' | xargs kill >./datadir/null 2>&1
    ./$ftExeFile  --genesis ./genesis.json --datadir ./datadir/$p2pPort --p2p_maxpeers 21 --http_host 0.0.0.0  --p2p_bootnodes ./nodes.txt --http_port $httpPort --ws_port $wsPort --log_level 4 --http_api="miner,dpos,account,txpool,p2p,ft,keystore"  --miner_coinbase testtest5 --miner_private 8ee847ae5974a13ce9df66083e453ea1e0f7995379ed027a98e827aa8b6bc211 --miner_start > ./datadir/$p2pPort.log 2>&1 &
    nodeNum='expr $nodeNum-1'
    p2pPort='expr $p2pPort+1'
    httpPort='expr $httpPort+1'
    wsPort='expr $wsPort+1'
done

