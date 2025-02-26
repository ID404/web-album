# 一个简单的web相册

打开网页后自动随机播放相册文件夹内的图片

git clone https://github.com/ID404/web-album.git

cd web-album

照片相册文件放在 ./html/images 文件夹下

chmod -R 755 ./html/images

chown -R 101:101 ./html/images




docker compose up -d

打开浏览器就可以访问，右上角有全屏播放按钮，IOS设备将网页发送到桌面，通过桌面图标打开可以全屏播放。
