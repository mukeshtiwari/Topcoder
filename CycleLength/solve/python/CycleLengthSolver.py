#! /usr/local/bin/python3

import os, sys
import CycleLength

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

        seed = reader.next("int")
        reader.next()
        a = reader.next("int")
        reader.next()
        b = reader.next("int")
        reader.next()
        m = reader.next("int")

    result = CycleLength.solve(seed, a, b, m)
    with open(sys.argv[2], "w") as fo:
        fo.write(tc.write(result, "int"))

if __name__ == "__main__":
    init()
    main()
