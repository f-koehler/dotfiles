#!/usr/bin/python3
import os
import os.path
import random
import re
import subprocess

if __name__ == "__main__":
    out = subprocess.check_output(["xrandr"]).decode().strip()
    m = re.search(r"current\s+(\d+)\s+x\s+(\d+),", out)

    if m is None:
        raise RuntimeError("Cannot extract resolution from xrandr output!")
    resolution = m.group(1)+"x"+m.group(2)

    wallpath = os.path.join(os.path.expanduser("~"), ".wallpaper")
    wallpapers = []
    for f in os.listdir(wallpath):
        path = os.path.join(wallpath, f)
        if os.path.isfile(path):
            wallpapers.append(path)

    if len(wallpapers) == 0:
        raise RuntimeError("No files in path \"%s\"!" % wallpath)

    matching_wallpapers = []
    for w in wallpapers:
        if os.path.basename(w).startswith(resolution):
            matching_wallpapers.append(w)

    if len(matching_wallpapers) == 0:
        raise RuntimeError("No matching wallpapers for resolution \"%s\" in path \"%s\"" % (resolution, wallpath))

    w = random.choice(matching_wallpapers)
    subprocess.check_output(["/usr/bin/feh", "--bg-center", "--no-xinerama", w])
