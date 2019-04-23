#! /usr/local/bin/python3

import os, sys
import OneHandRoadPainting

def init():
    default_path = os.path.join(os.getenv("HOME"), ".gettc")
    gettc_home = os.path.abspath(os.getenv("GETTC_HOME", default_path))
    include_dir = os.path.join(gettc_home, "include/python")
    sys.path.append(include_dir)

def main():
    import topcoder as tc
    with open(sys.argv[1], "r") as fi:
        input = fi.read()
        reader = tc.Reader(input)

        dStart = reader.next("int[]")
        reader.next()
        dEnd = reader.next("int[]")
        reader.next()
        paintPerBrush = reader.next("int")

    result = OneHandRoadPainting.fastest(dStart, dEnd, paintPerBrush)
    with open(sys.argv[2], "w") as fo:
        fo.write(tc.write(result, "long"))

if __name__ == "__main__":
    init()
    main()
