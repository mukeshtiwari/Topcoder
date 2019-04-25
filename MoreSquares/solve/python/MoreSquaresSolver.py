#! /usr/local/bin/python3

import os, sys
import MoreSquares

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

        N = reader.next("int")
        reader.next()
        SX = reader.next("int")
        reader.next()
        SY = reader.next("int")
        reader.next()
        Xprefix = reader.next("int[]")
        reader.next()
        Yprefix = reader.next("int[]")

    result = MoreSquares.countLocations(N, SX, SY, Xprefix, Yprefix)
    with open(sys.argv[2], "w") as fo:
        fo.write(tc.write(result, "int"))

if __name__ == "__main__":
    init()
    main()
