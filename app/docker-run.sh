docker run -d \
        -p 80:80 \
        --mount type=bind,src=$(pwd)/src-php,target=/var/www/html/ \
        bdr/projet ;