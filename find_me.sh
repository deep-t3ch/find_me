#!/bin/bash
#this program has been developed by Mohammed Abdo.Muntalib
#from youtube channel deept3ch

function help()
{
echo  "usage : find_me -p <path> -f <file_name> -d <dir_name>  "
echo -e "\t-p path"
echo -e "\t-f for find file"
echo -e "\t-d find dir"
echo -e "\t-n number of files and Directories"
}

if [ $# -lt 1 ];then	#if no argument
help
exit
fi
dir_number=0	#default directories numbers
file_number=0	#default files numbers
pa=`pwd`	#the default path
ooo=444		#default value for ooo
ppp=444		#default value for ppp

while getopts f:d:p:n opt;do
case $opt in
		p)pa=$OPTARG
		#no selected path for -p <empty>
		if [ $pa == "-d" ] || [ $pa == "-f" ] || [ $pa == "-n" ];then
		echo "path ERR : no selected path "
		exit
		fi

		if [ $pa != $2 ];then
		echo "ERR path must be first"
		exit
		fi
		;;
		f)f_name=$OPTARG
		#if path is first arg
		if [ $pa == $2 ] && [ $pa ];then

		#show all dir and files in cureent dir $pa
			for i in `ls -a $pa`
			do

				if test -f $pa/$i ;then

					if [ $i == $f_name ];then	#if there is a match 
						echo -e "$f_name found ^_^"
						#set the default value for ooo to 111 if found match
						ooo=111
					fi
				fi
			done
			#if there is no match (ooo=444) exec this coundition
			if test $ooo -eq 444 ;then 
			#if [ $ooo != 111 ];then
			echo "$f_name file not found :("
			fi
		else
		echo -e "you must Enter the path \nuse ./  for current path"
		fi

			;;	#break from this   f) case
		d)d_name=$OPTARG
		if [ $pa == $2 ] && [ $pa ];then
			for i in `ls -a $pa`
			do
				if test -d $pa/$i ;then
				if [ $d_name == $i ];then	#if there a match
					echo "$d_name dir found ^_^ "
					ppp=111		#set ppp to 111 if found match
				fi
				fi
			done
			if test $ppp -eq 444;then	#if there no match above exec this condtion
			echo "$d_name dir not found :("
			fi
		else
		echo "ERR :must Enter the path -p <path> first"
		fi
			;;
		n)
		if [ $pa == $2 ] && [ $pa ];then
			#tot=0
			for i in `ls -a $pa`
			do
			#tot=`expr $tot + 1`
			if test -f $pa/$i ;then
			#uncomment this if you want to show files
			#echo $i
			file_number=`expr $file_number + 1`
			#fi
			elif test -d $pa/$i;then
			#uncomment this if you want to show dir names
			#echo $i
			dir_number=`expr $dir_number + 1`
			fi
			done
			echo -e "$dir_number  Directories"
			echo -e "$file_number  Files"
			#echo "tot = $tot"
		fi
			;;
		*)help; exit 1 	;;	#exec help founction if wrong in arg and exit
	esac
done
