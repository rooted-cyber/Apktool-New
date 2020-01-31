#!/data/data/com.termux/files/usr/bin/sh
ap
ins () {
	clear
	cd ~
	pkg install git
	git clone https://github.com/rooted-cyber/Apktool-New
	cd Apktool-New
	bash apktool.sh
	}
	no () {
		toilet -f mono12 -F metal Thanx
		}
ap () {
	cd ~
if [ -e Apktool-New ];then
cd ~/Apktool-New
bash apktool.sh
else
ins_else
fi
}
ins_else () {
printf "\n\n\033[91m [กั] Apktool-New is not installed .\n"
printf "\n \033[92m Install it ? \033[96m(\033[97mY/N\033[96m)  "
read a
case $a in
y|Y)ins ;;
n|N)no ;;
*)ap ;;
esac
}