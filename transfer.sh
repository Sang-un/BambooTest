#!/bin/bash

cd /backup

DIR=`date +%Y%m`
if [ ! -d ${DIR} ];then
        mkdir ${DIR}
fi

mv ${DIR}*.gz ${DIR}


DEST=/backup

# tar를 이용하여 백업을 수행
tar zcvpf ${DIR}.tar.gz ${DIR}

FTP_HOST=20.249.22.99
USERNAME=azureuser
PASSWORD=@qwe123456789

/usr/bin/sftp ${USERNAME}@${FTP_HOST} << EOF
cd ${DEST}
mput *
exit

EOF

