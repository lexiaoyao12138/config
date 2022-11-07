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

#packernvim
#git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 # ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# 安装oh-my-zsh
echo "安装oh-my-zsh"
url=$(curl -fsSL https://ohmyzsh/ | egrep -o "<p class=\"code\">(.*)</p>" | head -1)
url=${url#*>}
url=${url%%<*}

$(url)

# 链接zsh配置文件
echo "链接zsh配置文件"
ln -sf $path/zshrc $HOME/.zshrc

# zsh-syntax
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# lsb
# https://github.com/Peltoche/lsd/releases

# zxoide

# omz plugs
# syntax 高亮
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
