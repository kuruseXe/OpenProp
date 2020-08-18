#!/usr/bin/env python
#
# Created:  <+DATE+>
#
<+CURSOR+>

import sys


def main(args):
    if len(args) != 3:
        print("Invalid argument!")
        return
    print(len(args))
    print(args[0])


if __name__ == '__main__':
    main(sys.argv)
