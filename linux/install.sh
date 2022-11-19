ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/curlrc $HOME/.curlrc

FILE=$HOME/.config
if [ -d "$FILE" ]; then
	ln -sf $HOME/config.yml $HOME/.config/lazygit/config.yml
else
	mkdir $FILE
if
