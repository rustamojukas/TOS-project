#!/bin/bash -x

#######################################################################
# Name: tos.sh                                                        #
# Description: Script for task over SSH.                              #
# Author: Rustam Ojukas                                               #
# Github: https://github.com/rustamojukas/TOS-project                 #
#######################################################################

# Script welcome
echo " -------------------------------"
echo " Hello, user! I am tos.sh       "
echo " TOS - Script for task over SSH "
echo " -------------------------------"
echo ""

# wait 1 sec.
sleep 1

# kusime tuleva skripti nimi
echo " Please fill data"
echo ""
echo -en " \033[31;1m*\033[0mhost name: "
read host_name

# test
echo $host_name