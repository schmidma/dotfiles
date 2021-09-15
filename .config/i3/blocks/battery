#!/usr/bin/env python3
#
# A battery indicator blocklet script for i3blocks

from subprocess import check_output

status = check_output(['acpi'], universal_newlines=True)

if not status:
    # stands for no battery found
    fulltext = "<span color='red'><span font='FontAwesome'>\uf00d \uf240</span></span>"
    totalPercentLeft = 100
else:
    def color(percent):
        if percent < 10:
            return "#f8f8f8"
        if percent < 20:
            return "#FF3300"
        if percent < 30:
            return "#ab4642"
        if percent < 40:
            return "#dc9656"
        if percent < 50:
            return "#dc9656"
        if percent < 60:
            return "#a1b56c"
        if percent < 70:
            return "#a1b56c"
        if percent < 80:
            return "#a1b56c"
        return "#f8f8f8"

    fulltext = ""
    totalPercentLeft = 0
    for bat in status.split("\n")[:-1]:
        state = bat.split(": ")[1].split(", ")[0]
        commasplitstatus = bat.split(", ")
        percentleft = int(commasplitstatus[1].rstrip("%"))
        totalPercentLeft += percentleft

        # stands for charging
        FA_LIGHTNING = "<span color='yellow'><span font='FontAwesome'></span></span>"

        # stands for plugged in
        FA_PLUG = "<span font='FontAwesome'></span>"

        timeleft = ""
        time = commasplitstatus[-1].split()[0]
        time = ":".join(time.split(":")[0:2])
        timeleft = " ({})".format(time)

        if state == "Discharging":
            if percentleft < 10:
                fulltext += "<span font='FontAwesome'></span> "
            elif percentleft < 30:
                fulltext += "<span font='FontAwesome'></span> "
            elif percentleft < 60:
                fulltext += "<span font='FontAwesome'></span> "
            elif percentleft < 90:
                fulltext += "<span font='FontAwesome'></span> "
            else:
                fulltext += "<span font='FontAwesome'></span> "
        elif state == "Full":
            fulltext += FA_PLUG + " "
        elif state == "Unknown":
            fulltext += "<span font='FontAwesome'></span> "
        else:
            fulltext += FA_PLUG + " "

        form = '<span color="{}">{}%</span>'
        fulltext += form.format(color(percentleft), percentleft)
        fulltext += timeleft
        fulltext += " "

print(fulltext)
if totalPercentLeft < 10:
    # exit code 33 will turn background red
    exit(33)
