git clone https://github.com/ID404/web-album.git
cd web-album

chmod -R 755 ./html/images
chown -R 101:101 ./html/images


照片相册文件放在 ./html/images 文件夹下
docker compose up -d

