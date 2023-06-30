STATE=$1
LATEST=$(ls -1 ${STATE}_202?*.csv | sort -r | grep -v /$ | head -1)

curl http://nemlog.com.au/api/stns/${STATE}/csv >> ${STATE}
python ../src/merge_result.py $LATEST ${STATE}
rm ${STATE}