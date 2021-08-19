image_version=`date +%Y%m%d%H%M`;
echo $image_version;
# cd projecttestdocker
git pull --rebase origin main;
#docker stop projecttestdocker;
#docker rm projecttestdocker;
docker build -t projecttestdocker:$image_version .;
docker images;
docker run -p 3000:3000 -d --name projecttestdocker projecttestdocker:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs projecttestdocker;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)