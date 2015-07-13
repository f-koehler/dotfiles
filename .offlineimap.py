#!/bin/python
from subprocess import check_output

def mailpasswd(account):
    return check_output("pass mail/"+account, shell=True).rstrip()

# def mailpasswd(account):
#     path = "/home/fabian/.mail-%s-passwd.gpg" % account
#     return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()
