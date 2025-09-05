#!/bin/bash
chmod -R 755 ./html/images
chown -R 101:101 ./html/images


# Nginx 网页根目录下 images 文件夹的绝对路径
# 修改为你 Docker 容器内 Nginx 服务的 images 目录的实际挂载路径
# 或者 Docker 容器内 Nginx 配置的 images 目录路径
# 例如，如果你的 docker-compose.yml 里 volumes 是 - ./my_images_on_host:/usr/share/nginx/html/images
# 那么这里的路径应该是 /usr/share/nginx/html/images
current_dir=$(pwd)
IMAGE_DIR="${current_dir}/html/images"

# 图片列表文件的输出路径 (确保 Nginx 可以访问到这个文件)
# 这里我们把它放在 IMAGE_DIR 目录下，这样 JS 可以通过 /images/image_list.txt 访问
OUTPUT_FILE="${IMAGE_DIR}/image_list.txt"

# 确保 IMAGE_DIR 存在
if [ ! -d "$IMAGE_DIR" ]; then
  echo "错误: 图片目录 ${IMAGE_DIR} 不存在。"
  exit 1
fi

# 查找所有常见的图片格式，并只输出文件名
# -maxdepth 1 避免递归查找子目录（如果需要子目录图片，去掉此选项）
find "$IMAGE_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.bmp" \) -printf "%f\n" > "$OUTPUT_FILE"

# 可选：输出日志
echo "图片列表已更新: $(date)" >> /var/log/generate_image_list.log



docker restart web_album
