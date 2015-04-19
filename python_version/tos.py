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

# settings
host = '192.168.56.10'
user = 'test'
#passwd = 'asdf'
private_key = '/home/rustam/.ssh/vbox'
port = 22

tos = paramiko.SSHClient()
tos.set_missing_host_key_policy(paramiko.AutoAddPolicy())
tos.connect(hostname=host, username=user, port=port, key_filename=private_key)
stdin, stdout, stderr = tos.exec_command('mkdir tos')
stdout_data = stdout.readlines()
stderr_data = stderr.readlines()
tos.close()

# if exist show stdout info
if stdout_data:
    for line in stdout_data:
        print(line)

# if exist show stderr info
if stderr_data:
    for line in stderr_data:
        print(line)