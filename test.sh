ftExeFile="ft"
for file_a  in ./*
do  
    temp_file=`basename $file_a`
    if [[ $temp_file =~ ft ]]
    then
        echo $temp_file
    fi   
done
