#!/bin/bash

#######################################################################
# Name: tos.sh                                                        #
# Description: Script for task over SSH.                              #
# Author: Rustam Ojukas                                               #
# Github: https://github.com/rustamojukas/TOS-project                 #
#######################################################################

# clear terminal
clear

# wait 1 sec.
sleep 1

# Script welcome
echo -e " \033[36;1m-------------------------------\033[0m"
echo -e " \033[36;1mHello, user! I am tos.sh\033[0m       "
echo -e " \033[36;1mTOS - Script for task over SSH\033[0m "
echo -e " \033[36;1m-------------------------------\033[0m"
echo ""

# wait 1 sec.
sleep 1

# Data
echo " Please fill data"
echo ""

# Host name
echo -en " \033[31;1m*\033[0mhost name: "
read host_name
while [[ -z $host_name ]]
    do
    echo -en " \033[31;1m*\033[0mPleas enter host name: "
    read host_name
done

# Port number
echo -en " \033[31;1m*\033[0mport number [Default port number: 22]: "
read port_number
if [[ -z $port_number ]]
    then
    port_number=22
fi

# User name
echo -en " \033[31;1m*\033[0muser name: "
read user_name

while [[ -z $user_name ]]
    do
    echo -en " \033[31;1m*\033[0mPleas enter user name: "
    read user_name
done

# Identity
echo ""
echo " What You prefer use for identity, password or identity key?"
echo " If You prefer use password press 'p'"
echo " If You prefer use identity key press 'i'"
echo ""
read -p " Please enter 'p' or 'i': " identity_prefer

while [[ -z $user_name ]]
    do
    read -p " Please enter 'p' or 'i': " identity_prefer
done

until [[ "$identity_prefer" == "p" ]] || [[ "$identity_prefer" == "i" ]]
    do
    read -p " Please enter 'p' or 'i': " identity_prefer
done

# Choice 'p' - with password
if [[ "$identity_prefer" == "p" ]]
    then

    # Task for ssh
    echo -en " \033[31;1m*\033[0menter task(for ex. apt-get update): "
    read task

    while [[ -z $task ]]
        do
        echo -en " \033[31;1m*\033[0mPleas enter task text: "
        read task
    done

    # wait 1 sec.
    sleep 1

    # Trying connect to host
    echo ""
    echo -e " \033[32;1mTrying connect to $host_name...\033[0m"
    ssh $user_name@$host_name -p $port_number "$task"

fi

# Choice 'i' - with identity key
if [[ "$identity_prefer" == "i" ]]
    then
    echo -en " \033[31;1m*\033[0mpath to identity_key: "
    read identity_key
    while [[ -z $identity_key ]]
        do
        echo -en " \033[31;1m*\033[0mPleas enter path to identity_key: "
        read identity_key
    done

    # Task for ssh
    echo -en " \033[31;1m*\033[0menter task(for ex. apt-get update): "
    read task

    while [[ -z $task ]]
        do
        echo -en " \033[31;1m*\033[0mPleas enter task text: "
        read task
    done

    # wait 1 sec.
    sleep 1

    # Trying connect to host
    echo ""
    echo -e " \033[32;1mTrying connect to $host_name...\033[0m"
    ssh $user_name@$host_name -p $port_number -i $identity_key "$task"
fi

# wait 1 sec.
sleep 1

# Script done
echo ""
echo " ----------------------------"
echo -e " \033[32;1mScript done\033[0m"
echo " ----------------------------"
echo ""