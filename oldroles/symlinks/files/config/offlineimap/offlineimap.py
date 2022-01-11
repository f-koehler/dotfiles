#!/usr/bin/env python2
from subprocess import check_output


def get_username(account):
    return check_output("pass " + account + "/username", shell=True).splitlines()[0]


def get_password(account):
    return check_output("pass " + account + "/password", shell=True).splitlines()[0]
