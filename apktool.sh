Decompile () {
	clear
 	printf "\n \033[93m Copy .apk in /sdcard/Apktool-New\n"
 	read
 	cd ~/sdcard/Apktool-New
 	if [ -e *.apk ];then
 	echo
 	else
 	printf "\n\n \033[91m [?] Sorry , Not found any .apk in sdcard/Apktool-New , Try again\n\n"
 	printf "Press enter to retry"
 	read
 	Decompile
 	fi
 	cd /sdcard/Apktool-New
 	cp -f *.apk ~/Apktool-New
 	cd ~/Apktool-New
 	apktool d *.apk
 	printf "\n \033[93m [?š] Success Decompile\n"
 	echo
 	echo
 	echo -e " \033[92m Now decomoiled .apk copying....\n\n"
 	sleep 1
 	cd ~/Apktool-New
 	ls
 	echo
 	echo -e -n "\033[93m Enter .apk name :- "
 	read aa
 	if [ $aa ];then
 	cd ~/Apktool-New
 	cp -Rf $aa /sdcard/Apktool-New
 	fi
 	cd /sdcard/Apktool-New
 	if [ -e $aa ];then
 	style
 	else
 	copy
 	fi
 	}
 copy () {
 	clear
 		cd ~/Apktool-New
 	ls
 	echo
 	echo -e -n "\033[93m Enter .apk name "
 	read aa
 	if [ $aa ];then
 	cd ~/Apktool-New
 	cp -Rf $aa /sdcard/Apktool-New
 	fi
 	cd /sdcard/Apktool-New
 	if [ -e $aa ];then
 	style
 	else
 	copy
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
		echo
		fi
		cd ~/Apktool-New
		if [ -e $f ];then
		rm -Rf $f
		cp -rf /sdcard/Apktool-New/$f ~/Apktool-New
		apktool b $f --output new.apk
		else
		printf "\n\n \033[91m [?] Sorry , Not found $f folder !!\n\n"
		printf "Try again !!\n\n"
		read
		folder
		fi
		echo
		cd ~/Apktool-New
		if [ -e new.apk ];then
		printf "\n\n\033[92m [?š] Successfully Recompiled your apk\n\n"
		else
		printf "\n\033[91m [?] Not recompiled , any error \n Plaese !! try again\n"
		read
		folder
		fi
		cd $PREFIX/bin
		if [ -e apksigner ];then
		echo
		else
		pkg install apksigner
		clear
		fi
		printf "\n\033[96m [-] Now signer your apk......\n\n"
		cd ~/Apktool-New
		apksigner -p 12345 keystore new.apk new-signer.apk
		cp -f new-signer.apk /sdcard/Apktool-New
		clear
		printf "\n\033[92m Successfully signer your apk in /sdcard/Apktool\n"
		style
		
		}
		sign_apk () {
			echo
			printf "\n \033[93m First copy .apk in /sdcard/Apktool-New\n\n"
			echo -e -n "\033[92m Enter .apk name :- "
			read ap
			if [ $ap ];then
			echo
			fi
			if [ -e $ap ];then
			cd /sdcard/Apktool-New
			apksigner -p 12345 keystore $ap new-signer.apk
			else
			printf "\n\n \033[91m [?] Sorry , Not found .Apk in /sdcard/Apktool-New\n\n"
			printf "\n Try again !!\n"
			read
			sign_apk
			fi
			cd /sdcard/Apktool-New
			if [ -e new-signer.apk ];then
			printf "\n\n\033[92m Successfully signed apk\n\n"
			else
			printf "\n\n\033[91m [?] Sorry , Not signed .apk , \n\n"
			printf "Try again !!\n"
			read
			sign_apk
			fi
			}
		
start_apktool () {
	style
	echo
	printf "	\033[91m [ 1 ]\033[92m Decompile apk\n"
	printf "	\033[91m [ 2 ]\033[92m Recompile apk\n"
	printf "	\033[91m [ 3 ]\033[92m Singed Apk\n"
	printf "	\033[91m [ 4 ]\033[92m Exit\n\n\n"
	echo -e -n "\033[96m Apktool >> "
	read ab
	case $ab in
	1|01) Decompile ;;
	2|02) Recompile ;;
	3)sign_apk ;;
	4)exit ;;
	*)app ;;
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
	cd ~/Apktool-New
	wget https://github.com/rooted-cyber/upload-apktool/raw/master/apktool_2.3.4_all.deb
	dpkg -i apktool*
	clear
	cp -f app $PREFIX/bin
	chmod 777 $PREFIX/bin/app
	printf "\n\n \033[92m [¡Ô] Now you can use this command :- app\m"
	echo
	printf "\033[96m [¡Ô] Press enter to start apktool menu"
	read
	start_apktool
	}
start_setup () {
		
clear
echo -e -n "\033[92m  Setup Requirements\033[91m (\033[96m y/n\033[91m) "
read apk
case $apk in
 y|Y)setup ;;
 n|N)exit ;;
 *)start_setup ;;
 esac
 }
cd $PREFIX/bin
        if [ -e app ];then
        start_apktool
        else
        start_setup
        fi
