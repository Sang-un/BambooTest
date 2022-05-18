#!/bin/bash

# 현재 날짜
now=`date +%Y%m%d`


# 구해야할 년도의 1일
start_date="`date +%Y`0101"


# 지금부터 1일까지의 날짜 차이 변수
diff=0


# 지금 년도의 1월 1일까지의 날짜 차이 구하기
while [ ${now} != ${start_date} ];
do
        now="`date +%Y%m%d -d -${diff}day`"
        diff=$(expr ${diff} + 1)
done

diff=-$(expr ${diff} - 1)


# 마지막 날짜
end_date="`date +%Y`1231"
# 파일의 이름을 diff 변수를 사용하여 1월 1일로 만들기
filename="`date +%Y%m%d -d -${diff}day`"


# backup 디렉터리로 이동
site="/backup"
cd "${site}"


# 이번 년도의 1월 1일 ~ 12월 31일 파일 만들기
while [ ${end_date} != ${filename} ];
do
        filename="`date +%Y%m%d -d ${diff}day`"
        touch "${filename}_data.tar.gz"
        diff=$(expr ${diff} + 1)
done



echo ${filename}