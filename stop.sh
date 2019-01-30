if [ $# -ne 2 ];then
    echo $0 portStart portEnd  // include start and end port 
    exit 2
fi

portStart=$1
portEnd=$2

for i in `seq $portStart $portEnd`
do
    ps x | grep $i | awk '{print $1}' | xargs kill >./datadir/${i}null 2>&1
done

