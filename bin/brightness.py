#!/usr/bin/env python3

import os
import sys

BACKLIGHT = "/sys/class/backlight/intel_backlight/brightness"
MAX_BACKLIGHT = "/sys/class/backlight/intel_backlight/max_brightness"


def die(msg):
    print(msg, file=sys.stderr)
    os._exit(1)

def ensure_root():
    if os.geteuid() != 0:
        die("Need to be root.")

def get_max_backlight():
    with open(MAX_BACKLIGHT) as f:
        return int(f.read().strip())

def get_backlight():
    with open(BACKLIGHT) as f:
        return int(f.read().strip())

def set_backlight(i):
    ensure_root()
    with open(BACKLIGHT, "w") as f:
        f.write(str(i))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("{}".format(get_backlight()))
    elif len(sys.argv) == 2:
        change = int(sys.argv[1])
        if change < -100 or change > 100:
            die("Value out of range.")
        max_ = get_max_backlight()
        cur_ = get_backlight()
        step = (change * max_) / 100.0
        new = int(cur_ + step)
        new = max(new, 0)
        new = min(new, max_)
        print("new: {}".format(new))
        set_backlight(new)
    else:
        print("Usage: {} [+|-]n".format(sys.argv[0]))
