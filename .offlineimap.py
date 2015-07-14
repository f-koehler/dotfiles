#!/bin/python
from subprocess import check_output

def mailpasswd(account):
    return check_output("pass mail/"+account, shell=True).rstrip()
