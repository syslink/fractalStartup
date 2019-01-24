localIp=$1
p2pPort=10000
httpPort=10001
wsPort=10002

ftExeFile="ft"
for file_a  in ./*
do  
    temp_file=`basename $file_a`
    if [[ $temp_file =~ ft ]]
    then
        ftExeFile=$temp_file
        break
    fi   
done

mkdir -p ./datadir
ps x | grep $p2pPort | awk '{print $1}' | xargs kill >./datadir/${p2pPort}null 2>&1
sleep 3s
echo $ftExeFile
./$ftExeFile --datadir ./datadir/$p2pPort --http_host 0.0.0.0 --p2p_listenaddr :$p2pPort --http_port $httpPort --ws_port $wsPort --http_api="keystore,miner,dpos,account,txpool,p2p,ft" --miner_start > ./datadir/$p2pPort.log 2>&1 &
echo 'start up genesis node over'
ps x | grep $p2pPort | grep $ftExeFile
sleep 3
cat ./datadir/$p2pPort.log | sed -n '/UDP listener up/p' | awk -F "=" '{print $2}' | sed "s/\[::\]/$localIp/g" > nodes.txt 2>&1 &
echo 'write node info over'
