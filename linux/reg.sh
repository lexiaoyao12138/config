# 获取当前路径
path=$(pwd)

# 常用软件
AppList=(git curl wget aria2 screenfetch sl egrep ripgrep gcc g++ make cmake unzip)

echo "下载常用软件..."
for app in ${AppList[@]}
do
	if ! type ${app} >/dev/null; then
    echo "${app} is not installed!"
		$(sudo pacman -S ${app})
  else
    echo "${app} is already installed."
	fi
done

#packnvim


# 安装oh-my-zsh
echo "安装oh-my-zsh"
url=$(curl -fsSL https://ohmyzsh/ | egrep -o "<p class=\"code\">(.*)</p>" | head -1)
url=${url#*>}
url=${url%%<*}

$(url)

# 链接zsh配置文件
echo "链接zsh配置文件"
ln -sf $path/zshrc $HOME/.zshrc

# omz plugs
# syntax 高亮
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
