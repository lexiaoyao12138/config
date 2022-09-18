# 获取当前路径
path=$(pwd)

# 修改源
echo "修改源"
ln -sf $path/sources.list /etc/apt/sources.list

# 常用软件
AppList=(git curl wget aria2 repgrep screenfetch sl egrep)

echo "下载常用软件..."
for app in ${AppList[@]}
do
	sudo apt install ${app}
done

# 安装oh-my-zsh
echo "安装oh-my-zsh"
url=$(curl -fsSL https://ohmyzsh/ | egrep -o "<p class=\"code\">(.*)</p>" | head -1)
url=${url#*>}
url=${url%%<*}

$(url)

# 链接zsh配置文件
echo "链接zsh配置文件"
ln -sf $path/zshrc $HOME/.zshrc
ln -sf $path/p10k.zsh $HOME/.p10k.zsh