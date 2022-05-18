#!/bin/bash

# 전체 백업

# vm02의 위치
DEST=/backup

# 백업을 수행할 디렉터리
backup_source="/root/origin"

# 백업을 할 압축 파일명
bfilename=`date +"%Y%m%d_data.tar.gz"`
bfilename="/backup/${bfilename}"


# tar를 이용하여 백업을 수행
tar zcvpf ${bfilename} ${backup_source}

cd /backup

FTP_HOST=20.249.22.99
USERNAME=azureuser
PASSWORD=@qwe123456789

/usr/bin/sftp ${USERNAME}@${FTP_HOST} << EOF
cd ${DEST}
mput *
exit

EOF

~           

#!/bin/bash


DEST="/backup"

DIR=`date +"%Y%m"`


cd "${DEST}"


BACKUP_SOURCE="/root/origin"

if [ ! -d ${DIR} ];then
        mkdir ${DIR}
fi

cd "${DIR}"

BACKUP_FILE_NAME=`date +"%Y%m%d_data.tar.gz"`
BACKUP_FILE_NAME="/backup/${DIR}/${BACKUP_FILE_NAME}"


tar zcvpf ${BACKUP_FILE_NAME} ${BACKUP_SOURCE}
