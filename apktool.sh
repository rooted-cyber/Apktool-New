Decompile () {
	clear
 	printf "\n \033[93m Copy .apk in $HOME/Apktool-New\n"
 	cd ~/Apktool-New
 	apktool d *.apk
 	printf "\n \033[93m [√] Success Decompile\n"
 	style
 	}
 
 Recompile () {
	clear
	printf "\n\n \033[93m Recompile .apk please wait....\n"
	cd ~/Apktool-New
	folder
	}
	
	folder () {
		
		echo -e -n "\033[92m Enter decompiled folder name :- "
		read f
		if [ ! -z $f ];then
		apktool b $f --output new.apk
		echo
		sleep 2
		printf "\033[92m [√] Successfully Recompiled your apk\n\n"
		printf "\033[96m [-] Now signer your apk......\n\n"
		apksigner -p 12345 keystore new.apk new-signer.apk
		cp -f new-signer.apk /sdcard/Apktool
		clear
		printf "\n\033[92m Successfully signer your apk in /sdcard/Apktool\n"
		style
		fi
		
		}
		
start_apktool () {
	style
	echo
	printf "	\033[91m [ 1 ]\033[92m Decompile apk\n"
	printf "	\033[91m [ 2 ]\033[92m Recompile apk\n\n\033[96m"
	printf %s "Select >> "
	read ab
	case $ab in
	1|01) Decompile ;;
	2|02) Recompile ;;
	esac
	}
	style () {
		figlet Apktool|toilet -f term -F gay
		}
not_setup () {
	start_apktool
	}
setup () {
	clear
	style
	apt update
	apt upgrade
	apt install toilet
	apt install figlet
	apt install wget
	apt install apksigner
	termux-setup-storage
	mkdir /sdcard/Apktool
	wget https://github.com/rooted-cyber/upload-apktool/raw/master/apktool_2.3.4_all.deb
	dpkg -i apktool*
	clear
	cp -f app $PREFIX/bin
	chmod 777 $PREFIX/bin/app
	printf "\n\n \033[92m Now you can use this command :- app"
	echo
	printf "\033[96m Press enter to start apktool menu"
	read
	start_apktool
	}
clear
echo -e -n "\033[92m	 Dow you want to setup\033[91m (\033[96m y/n\033[91m) "
read apk
case $apk in
 y|Y) setup ;;
 n|N) not_setup ;;
 esac
