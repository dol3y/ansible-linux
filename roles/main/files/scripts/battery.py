#!/usr/bin/env python3

import os
import fnmatch

battery_path = os.path.join('/sys', 'class', 'power_supply')

def percentage_left(battery):
    status_file = os.path.join(battery_path, battery, 'capacity')
    with open(status_file, 'r') as fh:
        capacity = fh.read().rstrip()
    return int(capacity)

def batteries():
    batteries = [f for f in os.listdir(battery_path) if fnmatch.fnmatch(f, '*BAT*')]
    return batteries

def health_icon(capacity):
    status_icon = {"good": "",
                   "ok": "",
                   "bad": ""}

    if capacity >= 90:
        return status_icon['good']
    elif capacity >= 10:
        return status_icon['ok']
    else:
        return status_icon['bad']

def draw(icon, capacity):
    return ('%s %s%%' % (icon, capacity))

def main():
    tmux_battery_status = []
    for battery in batteries():
        capacity = percentage_left(battery)
        icon = health_icon(capacity)
        tmux_battery_status.append(draw(icon, capacity))

    print('%s ' % ' '.join(tmux_battery_status))

if __name__ == "__main__":
    main()
