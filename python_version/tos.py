#!/usr/bin/python3

#######################################################################
# Name: tos.sh                                                        #
# Description: Script for task over SSH. Required paramiko library    #
# http://www.paramiko.org/                                            #
# Author: Rustam Ojukas                                               #
# Github: https://github.com/rustamojukas/TOS-project                 #
#######################################################################

# imports
import paramiko


host = '192.168.56.10'
user = 'test'
passwd = 'asdf'
port = 22

tos = paramiko.SSHClient()
tos.set_missing_host_key_policy(paramiko.AutoAddPolicy())
tos.connect(hostname=host, username=user, password=passwd, port=port)
stdin, stdout, stderr = tos.exec_command('ls -la')
data = stdout.readlines()
tos.close()

for line in data:
    print(line)
