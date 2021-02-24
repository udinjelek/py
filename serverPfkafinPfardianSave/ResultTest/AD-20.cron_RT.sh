#!/bin/bash

wrkdir=/home/pfardian/DATA/script/SWM/
datdir=/home/pfardian/DATA/script/SWM/sqs
rsldir=/home/pfardian/DATA/script/SWM/SQS_RESULT/RT
app_path=/home/pfardian/DATA/script/SWM

#cd $wrkdir
FILE=`basename $0`

#echo -n "Input date (e.g. yyyymmdd): "
#read DAY

#rm ${wrkdir}/AD20-processed_rt.log.txt

PROCESS() {
cd $rsldir

nawk '\
{\
        tmb=$2;\
        getline;getline;getline;getline;\
        tmb=tmb" "$0;\
        lindex_1=0;\
        while(lindex_1<100){\
                if($1=="OBJECT"){\
                        lindex=0;\
                        n=split(tmb,spl," ");\
                        for (i=1;i<=n;i++){\
                                if(spl[i]~/[0-9]/&&spl[i]!~/[A-Z]/){\
                                        printf ",%d", spl[i];\
                                }else{\
                                        if(i==1){\
                                                printf "%s", spl[i];\
                                        }else{\
                                                printf ",%s", spl[i];\
                                        }\
                                }\
                        }\

                        getline;getline;\
                        printf (",%s", $1);\
                        while(lindex<=50){\
                                getline;\
                                lindex++;\
                                if($1~/[0-9]/&&$1!~/[A-Z]/){\
                                        n=split($0,spl," ");\
                                        for (i=1;i<=n;i++){\
                                                printf ",%d", spl[i];\
                                        }\
                                }\
                        }\
                        printf "\n\n";\
                }\
                getline;\
                lindex_1++;\
        }\
}' $1 > ${rsldir}/raw-AD-20_rt.${DAY}.xls

cat ${rsldir}/raw-AD-20_rt.${DAY}.xls >> ${rsldir}/AD-20.MSS_rt.${DAY}

}

FTP(){
#cat ${rsldir}/result_AD-20.ALL.${DAY} >> ${rsldir}/AD-20.MSS.${DAY}
cat ${rsldir}/AD-20.MSS_rt.${DAY2} > ${rsldir}/test_AD20-sqs_rt.txt
cat ${rsldir}/AD-20.MSS_rt.${DAY1} >> ${rsldir}/test_AD20-sqs_rt.txt
cat ${rsldir}/AD-20.MSS_rt.${DAY} >> ${rsldir}/test_AD20-sqs_rt.txt
cat ${rsldir}/AD-20.MSS_rt.mgt2.${DAY1} >> ${rsldir}/test_AD20-sqs_rt.txt
cat ${rsldir}/AD-20.MSS_rt.mgt2.${DAY2} >> ${rsldir}/test_AD20-sqs_rt.txt
ftp -n 10.23.67.52 <<!
user admin_xl01 sql2006!
ascii
prompt
lcd ${rsldir}
cd /ericsson/core2
mput test_AD20-sqs_rt.txt
bye
!
}

logfile=${wrkdir}/AD20-processed_rt.log.txt

if [ ! -f "${logfile}" ]
then touch $logfile
fi

DAY=`perl -e 'use POSIX; print strftime("%Y%m%d",localtime(time-0))'`
DAY1=`perl -e 'use POSIX; print strftime("%Y%m%d",localtime(time-86400))'`
DAY2=`perl -e 'use POSIX; print strftime("%Y%m%d",localtime(time-172800))'`
#head -1 ${rsldir}/HeaderADSQS.txt > ${rsldir}/AD-20.MSS_rt.${DAY}

rm ${wrkdir}/zp20.txt
echo "`date '+%Y%m%d %H'`" > ${wrkdir}/zp20.txt
gt=`cat ${wrkdir}/zp20.txt | awk -F" " '{print $2}'`
t=`expr $gt - 1`

#for MSS in MSSM1; do
for MSS in `cat ${app_path}/listMSS.dat`; do
  #ls ${datdir}/${MSS}/AD-20_${DAY}*.log > ${rsldir}/DataList_rt.lst
  find ${datdir}/${MSS}/. -name "AD-20_${DAY}*.log" -exec basename {} \; > ${rsldir}/DataList_rt.lst
    cd $rsldir
  for DATA in `cat DataList_rt.lst`; do
    file=$DATA
    #file1=${file}.1.tmp
    #file2=${file}.2.tmp
    #file3=${file}.3.tmp

    check=`grep "${file}.${MSS}" $logfile`
    if [ -z "$check" ]
    then chmod u+w $logfile
      VLINE=`cat ${datdir}/${MSS}/$file | wc -l`
     # if [ ${VLINE} -eq "230" ]; then
        PROCESS ${datdir}/${MSS}/$DATA
     # fi
    echo "`date '+%Y%m%d %H:%M'` ${file}.${MSS}" >> $logfile
    chmod u-w $logfile
    else echo "Already processed, skipping"
    fi
  done
#    rm ${rsldir}/*.tmp
done
FTP
#more ${rsldir}/result_sqs.all.mss.${DAY}
#done
