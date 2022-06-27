#git clone git@github.com:mmuschalik/crudeoilpeak.git
#cd crudeoilpeak/src

set -e

aws ecr get-login-password --region ap-southeast-2 --profile crudeoilpeak | docker login --username AWS --password-stdin 193174210882.dkr.ecr.ap-southeast-2.amazonaws.com

docker build -t nemlog .
docker tag nemlog:latest 193174210882.dkr.ecr.ap-southeast-2.amazonaws.com/nemlog:latest

docker push 193174210882.dkr.ecr.ap-southeast-2.amazonaws.com/nemlog:latest