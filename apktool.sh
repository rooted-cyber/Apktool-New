Decompile () {
	clear
 	printf "\n \033[93m Copy .apk in $HOME/Apktool-New\n"
 	read
 	cd ~/Apktool-New
 	if [ -e *.apk ];then
 	echo
 	else
 	printf "\n\n \033[91m [×] Sorry , Not found any .apk in ~/Apktool-New , Try again\n\n"
 	printf "Press enter to retry"
 	read
 	Decompile
 	fi
 	cd ~/Apktool-New
 	apktool d *.apk
 	printf "\n \033[93m [√] Success Decompile\n"
 	echo
 	echo
 	echo -e " \033[92m Now decomoiled .apk copying....\n\n"
 	sleep 1
 	cd ~/Apktool-New
 	ls *.apk
 	echo
 	echo -e -n "\033[93m Enter .apk name "
 	read aa
 	if [ $aa ];then
 	cd ~/Apktool-New
 	cp -Rf $aa /sdcard/Apktool-New
 	style
 	fi
 	}
 
 Recompile () {
	clear
	printf "\n\n \033[93m Recompile .apk please wait....\n\n"
	cd ~/Apktool-New
	folder
	}
	
	folder () {
		
		echo -e -n "\033[92m Enter decompiled folder name :- "
		read f
		if [ ! -z $f ];then
		cd ~/Apktool-New
		rm -Rf $f
		cp -f /sdcard/Apktool-New/$f ~/Apktool-New
		apktool b $f --output new.apk
		echo
		sleep 2
		printf "\033[92m [√] Successfully Recompiled your apk\n\n"
		fi
		cd $PREFIX/bin
		if [ -e apksigner ];then
		echo
		else
		pkg install apksigner
		clear
		fi
		printf "\033[96m [-] Now signer your apk......\n\n"
		cd ~/Apktool-New
		apksigner -p 12345 keystore new.apk new-signer.apk
		cp -f new-signer.apk /sdcard/Apktool-New
		clear
		printf "\n\033[92m Successfully signer your apk in /sdcard/Apktool\n"
		style
		
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
	mkdir /sdcard/Apktool-New
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
	cd $PREFIX/bin
	if [ -e app ];then
	echo
	else
	start_setup
	fi
	start_setup () {
		
clear
echo -e -n "\033[92m  Setup Requirements\033[91m (\033[96m y/n\033[91m) "
read apk
case $apk in
 y|Y) setup ;;
 n|N)exit ;;
 esac
 }
start_apktool