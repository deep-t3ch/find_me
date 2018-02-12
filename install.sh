#!/bin/bash
#this program has been developed by Mohammed Abdo.Multalib
#from youtube channel deept3ch

function help(){
	echo "usage : install.sh <--install | -i > ||  <--remove | -r> "
	echo "--install |-i   for install find_me.sh"
	echo "--remove  |-r   for remove find_me.sh"
}

function for_install(){
	for i in . .. ... . .. ... . .. ... ;do
	clear ;echo "installing$i";sleep 1
	done
}

function for_remove(){
	for i in . .. ... . .. ... . .. ... ;do
	clear ;echo "removing$i";sleep 1
	done
}
if [ $# != 1 ];then
echo "ARG ERR : must choose one arg"
help
exit
fi

echo "please Enter your current user password:"
`sudo ls /root >> /dev/null`

#clear

for i in $@
do
case $i in
--install |-i)
		#echo "instaling..."
		for_install
		#sleep 3
		if test -d $HOME/bin  && test -f $HOME/.bashrc ;then
		cp find_me.sh $HOME/bin/find_me.sh && echo alias find_me="find_me.sh" >> $HOME/.bashrc && sudo  cp find_me.1 /usr/share/man/man1/find_me.1 && sudo gzip /usr/share/man/man1/find_me.1 
			if [ $? == 0 ];then
			echo "find_me installed succeefully ^_^"
			echo -e "for more info run \nman find_me"			
			fi
		elif !(test -d $HOME/bin);then
			echo "createing bin dir..."
			sleep 2		
			mkdir $HOME/bin
			cp find_me.sh $HOME/bin/find_me.sh  && \
			echo alias find_me="find_me.sh" >> $HOME/.bashrc && \
			sudo  cp find_me.1 /usr/share/man/man1/find_me.1 && \
			sudo gzip /usr/share/man/man1/find_me.1
				if [ $? == 0 ];then
					echo "find_me installed succeefully ^_^ "
					echo -e "for more info run \nman find_me"
				fi
		elif !(test -f $HOME/.bashrc);then
			echo "createing bashrc file..."
			sleep 2
			touch $HOME/.bashrc
			
			cp find_me.sh $HOME/bin/find_me.sh  && \
			echo alias find_me="find_me.sh" >> $HOME/.bashrc && \
			sudo  cp find_me.1 /usr/share/man/man1/find_me.1 && \
			sudo gzip /usr/share/man/man1/find_me.1
				if [ $? == 0 ];then
					echo "find_me installed succeefully ^_^ "
					echo -e "for more info run \nman find_me"
				fi
		elif !(test -f /usr/share/man/man1/find_me.1.gz);then
			cp find_me.sh $HOME/bin/find_me.sh  && \
			echo alias find_me="find_me.sh" >> $HOME/.bashrc && \
			sudo  cp find_me.1 /usr/share/man/man1/find_me.1 && \
			sudo gzip /usr/share/man/man1/find_me.1
				if [ $? == 0 ];then 
					echo "find_me installed succeefully ^_^ "
					echo -e "for more info run \nman find_me"
				fi
		else
			echo "an error occurred through installing  :("
		fi
		;;
--remove |-r)
		#echo "removing..."
		#sleep 3
		for_remove
		if test -d $HOME/bin  && test -f $HOME/.bashrc && test -f /usr/share/man/man1/find_me.1.gz ;then
		rm -fr $HOME/bin/find_me.sh &&  \
		sudo rm -fr /usr/share/man/man1/find_me.1.gz 		
			if [ $? == 0 ];then
			echo "find_me removed succeflly"
			fi	
		else
			echo "find_me not installed before :("
			echo "please install first"
		fi
		;;
*)
		echo "$1  ARG not found :("
		help
		exit
		;;
esac
done
