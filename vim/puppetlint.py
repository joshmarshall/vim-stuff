#!/usr/bin/env python
import subprocess
import sys
import re


LINES = []


def main():
    for line in subprocess.Popen(
            'puppet-lint %s' % (sys.argv[1]), shell=True,
            stdout=subprocess.PIPE).stdout.readlines():
        match = re.search('line (?P<line>\d+)', line)
        line_number = 0
        if match:
            line_number = int(match.group('line'))
        line = "%d: %s" % (line_number, line)
        LINES.append((line_number, line))

    LINES.sort(key=lambda x: x[0])
    for _, line in LINES:
        print line.strip()


if __name__ == "__main__":
    main()
