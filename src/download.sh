git clone git@github.com:mmuschalik/crudeoilpeak.git
cd crudeoilpeak
mkdir -p data
curl http://nemlog.com.au/api/stns/nsw/csv >> data/nsw.csv
git add data/nsw.csv
git commit -a -m "new run..."
git push