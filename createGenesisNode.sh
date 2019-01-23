localIp=$1
p2pPort=10000
httpPort=10001
wsPort=10002
ps x | grep $p2pPort | awk '{print $1}' | xargs kill >./datadir/null 2>&1
./ft.linux_64 --datadir ./datadir/$p2pPort --http_host 0.0.0.0 --p2p_listenaddr :$p2pPort --http_port $httpPort --ws_port $wsPort --http_api=keystore --http_api=miner --http_api=dpos --http_api=account --http_api=txpool --http_api=p2p --http_api=zip --miner_start
tail -f ./datadir/$p2pPort.log | sed -n '/UDP listener up/p' | awk -F "=" '{print $2}' | sed 's/[::]/${localIp}/g' > nodes.txt
