portStart=$1
portEnd=$2
while $portStart <= $portEnd
do
    ps x | grep $portStart | awk '{print $1}' | xargs kill >./datadir/${portStart}null 2>&1
    portStart='expr $portStart+1'
done

