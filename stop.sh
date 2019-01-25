portStart=$1
portEnd=$2

for i in `seq $portStart $portEnd`
do
    ps x | grep $i | awk '{print $1}' | xargs kill >./datadir/${i}null 2>&1
done

