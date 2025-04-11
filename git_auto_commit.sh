#!/bin/bash

# 检查当前目录是否为 Git 仓库
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "当前目录不是一个 Git 仓库，请在 Git 仓库目录下运行此脚本。"
    exit 1
fi

# 添加所有更改
git add .

# 提交更改
git commit -m "自动提交: $(date +'%Y-%m-%d %H:%M:%S')"

# 获取当前分支名称
current_branch=$(git symbolic-ref --short HEAD)

# 推送到远程仓库
git push origin "$current_branch"

# 检查推送是否成功
if [ $? -eq 0 ]; then
    echo "成功推送到远程仓库。"
else
    echo "推送失败，请检查网络或仓库权限。"
fi    