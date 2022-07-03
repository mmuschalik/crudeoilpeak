STATE=$1
LATEST=$(ls -1 ${STATE}_2022*.csv | sort -r | grep -v /$ | head -1)

curl http://nemlog.com.au/api/stns/${STATE}/csv >> ${STATE}
python ../src/merge_result.py $LATEST ${STATE}
rm ${STATE}

git add --all
git commit -a -m "new run..."
git push