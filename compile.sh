#!/bin/bash

# 设置环境变量
ROOT_DIR="/"  # 根目录路径
OUTPUT_FILE="xidun_client_compile_image.tar"  # 输出的 tar 包文件名
EXCLUDES=("/proc" "/sys" "/dev" "/compileLinux" "/home" "/root" "rpcbind.tar.gz" "/serviceMonitor" "/tmp" "/var" "/srv" "/mnt")  # 需要排除的目录和文件列表

# 构建排除参数
EXCLUDE_PARAMS=""
for exclude in "${EXCLUDES[@]}"; do
  EXCLUDE_PARAMS+=" --exclude=$exclude"
done

# 打包根目录
tar --numeric-owner -cvpf "$OUTPUT_FILE" $EXCLUDE_PARAMS  "$ROOT_DIR"
#echo "$OUTPUT_FILE" $EXCLUDE_PARAMS "$ROOT_DIR"
