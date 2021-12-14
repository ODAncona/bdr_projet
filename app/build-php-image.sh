docker kill brd/projet 2>/dev/null;
docker rm bdr-projet 2>/dev/null;
docker image rm bdr/projet 2>/dev/null;

docker build -t bdr/projet . ;./buil