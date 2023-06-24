curl -s curl -s https://api.github.com/repos/extrawurst/gitui/releases/latest | grep -wo "https.*linux.*gz" | wget -qi - # get the latest builds of gitui (they are archives)
tar xzvf gitui-linux-musl.tar.gz # extract the gitui executable from the musl build archive
sudo chown root:root gitui # set ownership and group ownership of the gitui executable to root
sudo chmod u=rwx,g=rx,o=rx gitui # set the permission of the gitui executable to reflect the usual permissions in /usr/local/bin/ (-rwxr-xr-x)
sudo mv gitui /usr/local/bin/ # move the gitui executable to /usr/local/bin/
rm gitui-linux-aarch64.tar.gz gitui-linux-arm.tar.gz gitui-linux-armv7.tar.gz gitui-linux-musl.tar.gz # remove downloaded archives
