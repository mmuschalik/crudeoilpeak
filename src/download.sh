set -e

git clone git@github.com:mmuschalik/crudeoilpeak.git
cd crudeoilpeak
mkdir -p data
cd data

../src/download_state.sh nsw
../src/download_state.sh qld


LATEST=$(ls -1 nsw_202*.csv | sort -r | grep -v /$ | head -1)
CURRENT=nsw

curl http://nemlog.com.au/api/stns/nsw/csv >> $CURRENT
python ../src/merge_result.py $LATEST $CURRENT
rm nsw

git add --all
git commit -a -m "new run..."
git push