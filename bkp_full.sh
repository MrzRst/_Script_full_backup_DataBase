#!/bin/bash
#Shell Script to Full backup Mysql DataBase 
#Author mrz.rst
#Date 2019-10-13
user=`echo $USER`
DB_NAME='wordpress' #DataBase Name
BKP_DEST=$HOME/backup/ #Path for Backup
MYSQL_HOST='localhost' 
BKP_DATE="$(date +"%d-%m-%Y-%H:%M%S-%a")";
[ ! -d $BKP_DEST ] && mkdir $BKP_DEST 
MYSQLDUMP="$(which mysqldump)"
cd $BKP_DEST
$MYSQLDUMP --defaults-extra-file=~/.my.cnf  -h $MYSQL_HOST $DB_NAME  >  $DB_NAME.$BKP_DATE 
if [ $? = 0 ] ; then 
   echo "$BKP_DEST$DB_NAME.$BKP_DATE is created  " 
fi 
