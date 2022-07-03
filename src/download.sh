set -e

git clone git@github.com:mmuschalik/crudeoilpeak.git
cd crudeoilpeak
mkdir -p data
cd data

../src/download_state.sh nsw
../src/download_state.sh qld

git add --all
git commit -a -m "new run..."
git push