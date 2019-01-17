# 查询一个分支 是从哪个分支checkout出来的
git reflog --date=local | grep fix_login_20181109

# 查看写了多少行泰马
# 查看git上个人代码量

git log --author="username" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
# 统计每个人的增删行数

git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
# 查看仓库提交者排名前 5

git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r | head -n 5
# 贡献者统计：

git log --pretty='%aN' | sort -u | wc -l
# 提交数统计：

git log --oneline | wc -l

# 统计代码总行数：
find . -name "*.m" -or -name "*.h" -or -name "*.xib" -or -name "*.c" |xargs grep -v "^$"|wc -l

### 一些例子：
git log --until=1.minute.ago
#### // 一分钟之前的所有
log git log --since=1.day.ago
#### //一天之内的
log git log --since=1.hour.ago
#### //一个小时之内的
log git log --since=`.month.ago --until=2.weeks.ago `
#### 一个月之前到半个月之前的log git


## 完美输出日志
git log develop  HEAD --pretty=format:%s


## git COMMIT 的时候 描述规范
feat：新功能（feature）
fix：修补bug
docs：文档（documentation）
style： 格式（不影响代码运行的变动）
refactor：重构（即不是新增功能，也不是修改bug的代码变动）
test：增加测试
chore：构建过程或辅助工具的变动


## 更换远程 地址
git remote set-url origin https://github.com/Master1916/LearnVueJs.git

git remote set-url origin https://gitee.com/foreverything_admin/marketplace.git
## 权限导致git文件变更
diff --git a/Android.mk b/Android.mk
old mode 100644
new mode 100755
原来是filemode的变化，文件chmod后其文件某些位是改变了的，如果严格的比较原文件和chmod后的文件，两者是有区别的，但是源代码通常只关心文本内容，因此chmod产生的变化应该忽略，所以设置一下：
切到源码的根目录下，

git config --add core.filemode false
