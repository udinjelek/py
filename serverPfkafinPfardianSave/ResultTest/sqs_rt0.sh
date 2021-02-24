#!/bin/sh
wrkdir=/home/pfardian/DATA/script/SWM/RT
cd ${wrkdir}
./AD-20.cron_RT.sh
./AD-21.cron_RT.sh
./AD-22.cron_rt.sh
./AD-23.cron_rt.sh
./AD-24.cron_rt.sh
./AD-25.cron_rt.sh
./AD-26.cron_rt.sh
./AD-27.cron_rt.sh
./AD-28.cron_rt.sh
./AD-41.cron_rt.sh
./AD-37.cron_rt.sh
./AD-38.cron_rt.sh
./AD-91.cron_rt.sh
echo sqs_rt0.sh FINISHED `date`
