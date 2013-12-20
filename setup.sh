ln -s /home/gurel/dot-files/.vim /home/gurel/
ln -s /home/gurel/dot-files/.vimrc /home/gurel/
ln -s /home/gurel/dot-files/.gitconfig /home/gurel/
ln -s /home/gurel/dot-files/.bashrc /home/gurel/
ln -s /home/gurel/dot-files/.bash_aliases /home/gurel/

echo "adding hosts"
curdir=`pwd`
su - -c "cd $curdir && cat hosts >> /etc/hosts"
