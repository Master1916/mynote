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
log git log --since=`.month.ago --until=2.weeks.ago
#### //一个月之前到半个月之前的log git
