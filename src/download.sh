git clone git@github.com:mmuschalik/crudeoilpeak.git
cd crudeoilpeak
mkdir -p data
cd data

LATEST=$(find ./nsw*.csv -type f -printf "%t - %p\n" | sort -n | tail -1 | awk '{print $7}')
CURRENT=nsw

curl http://nemlog.com.au/api/stns/nsw/csv >> $CURRENT
python merge_result.py $LATEST $CURRENT
rm nsw

git add --all
git commit -a -m "new run..."
git push