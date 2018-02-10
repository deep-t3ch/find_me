#!/bin/bash


function f_install()
{
cat < `echo $HOME`/.bashrc |grep my_project_last_version.sh 
}

function help()
{
echo  "usage : $0 -p <path> -f <file_name> -d <dir_name>  "
echo -e "\t-p path"
echo -e "\t-f for find file"
echo -e "\t-d find dir"
echo -e "\t-n number of files and Directories"
#echo -e "\t-file_num"

}
if [ $# -lt 1 ];then
help
exit
fi
dir_number=0
file_number=0
pa=`pwd`	#the defualt path if we dont put it in arg will be current path
ooo=444		#defualt value for ooo 	
ppp=444		#defualt value for ppp
while getopts f:d:p:n option
do
case $option in
		p)pa=$OPTARG
		#if no path in -p option
		if [ $pa == "-d" ] || [ $pa == "-f" ] || [ $pa == "-n" ];then
		echo "ERR : no path Enter "		
		exit 1
		fi
		;;
		f)f_name=$OPTARG	#set the arg name for o variable
			#show all dir and files in cureent dir $pa
			for i in `ls -lash $pa`
			do
			#if test -f $i;then	#just choose files for this dir
				if [ $f_name == $i ];then	#if found match 
					echo -e "$f_name found ^_^"
					#set the defualt value for ooo to 111 if found match
					ooo=111			
				fi
			#fi
			done
			#if not found match (ooo=444) exec this coundition
			if test $ooo -eq 444 ;then 
			#if [ $ooo != 111 ];then
			echo "$f_name file not found :("
			fi			
			;;	#break from this   f) case
		d)d_name=$OPTARG
			for i in `ls -lash $pa`
			do
			#if test -d $i ;then  #just choose dirs from current dir
				if [ $d_name == $i ];then	#found match for dir name
					echo "$d_name dir found ^_^ "
					ppp=111		#set ppp to 111 if found match
				fi
			#fi			
			done
			if test $ppp -eq 444;then	#if not match above exec this condtion
			echo "$d_name dir not found :("
			fi			
			;;
		n)
			for i in `ls -lash $pa`
			do
			if test -f $i;then
			file_number=`expr $file_number + 1`
			fi			
			if test -d $i;then
			echo $i
			dir_number=`expr $dir_number + 1`			
			fi
			done
			echo -e "$dir_number  Directories"
			echo -e "$file_number  Files"
			;;
		*)help; exit 1 	;;	#exec help founction if wrong in arg and exit
	esac
done
#if [ -n $f_name ];then
#if test -f $f_name ;then
#echo "$f_name not file found :("

#fi
#if [ -n $d_name ];then
#echo "$d_name dir  not found :("
#fi
#echo "ur pass is $pa"
#echo "$@"
#echo $1
#echo "this is two" $2
#echo $pa
