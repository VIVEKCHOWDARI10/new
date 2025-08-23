 #! /bin/bash

 echo "enter the password length "
 read length 
 sleep 1 
 echo " enter the count(no of passwords) "
 read count 
 sleep 1 
 echo "enter the file name "
 read name

 check_length(){
 if ! [[ $length =~ ^[0-9]+$ ]] || [[ $length -eq 0 ]]
 then 
echo "pls enter the valid length "
read length
check_length
 fi
  }
 check_count(){
	 if ! [[ $count =~ ^[0-9]+$ ]] || [[ $count -eq 0 ]]
	 then 
		 echo "pls enter the valid count "
		 read count
		 check_count 
	 fi 
 }
check_name()
{
	if [[ $name =~ ^[0-9]+$ ]]
	then 
		echo "pls enterthe valid name "
		read name 
		check_name
	 fi 
 }
for ((i=1;i<=$count ;i++))
do 
 password=$(openssl rand -base64 54 | tr -dc 'A-Za-z0-9@!#$%&*'|cut -c 1-${length} ) 
 echo "password ${i} = ${password} "
 echo "$password" >> "$name"
done 
 echo "check the $name for passwords "
