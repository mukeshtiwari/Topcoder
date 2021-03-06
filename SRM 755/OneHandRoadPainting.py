# -*- coding: utf-8 -*-
import math,string,itertools,fractions,heapq,collections,re,array,bisect

#Python is way more cleaner than C++
class OneHandRoadPainting:

    def sumAP(self, a, n, d):
            return  (n * (2 * a + (n - 1) * d)) / 2

    def sliceSeg(self, izip, paintPerBrush):
        if (izip == []): return izip
        (endseg, begseg), rest = izip[0], izip[1::]
        if (paintPerBrush >= endseg - begseg):
            return self.sliceSeg(izip[1::], paintPerBrush - (endseg - begseg))
        else:
            return [tuple ((endseg - paintPerBrush, begseg))] + izip[1::]


    def solve(self, izip, paintPerBrush):
        if (izip == []):
            return 0
        else:
            (endseg, begseg), rest = izip[0], izip[1::]
            (numseg, restseg) = divmod(endseg - begseg, paintPerBrush)
            if numseg == 0 and restseg == 0 : 
                raise Exception("This should not have had happened")
            elif numseg != 0 and restseg == 0 :
                return (2 * self.sumAP(endseg, numseg, -paintPerBrush) 
                        + self.solve(izip[1::], paintPerBrush))
            elif numseg == 0 and restseg != 0 :
                #slice the part which can be painted
                rest = self.sliceSeg(izip, paintPerBrush)
                return (2 * endseg + self.solve(rest, paintPerBrush))
            else:
                #get rid of painted segment and simulat the rest
                tzip = [tuple ((endseg - numseg * paintPerBrush, begseg))] + izip[1::]
                rest = self.sliceSeg(tzip, paintPerBrush)
                return (2 * self.sumAP(endseg, numseg, -paintPerBrush) + 
                        2 * (endseg - numseg * paintPerBrush) + self.solve(rest, paintPerBrush))




    def fastest(self, dStart, dEnd, paintPerBrush):
        izip = zip(dEnd, dStart)[::-1] #zip the list, and reverse it
        return self.solve(izip, paintPerBrush)


# CUT begin
# TEST CODE FOR PYTHON {{{
import sys, time, math

def tc_equal(expected, received):
    try:
        _t = type(expected)
        received = _t(received)
        if _t == list or _t == tuple:
            if len(expected) != len(received): return False
            return all(tc_equal(e, r) for (e, r) in zip(expected, received))
        elif _t == float:
            eps = 1e-9
            d = abs(received - expected)
            return not math.isnan(received) and not math.isnan(expected) and d <= eps * max(1.0, abs(expected))
        else:
            return expected == received
    except:
        return False

def pretty_str(x):
    if type(x) == str:
        return '"%s"' % x
    elif type(x) == tuple:
        return '(%s)' % (','.join( (pretty_str(y) for y in x) ) )
    else:
        return str(x)

def do_test(dStart, dEnd, paintPerBrush, __expected):
    startTime = time.time()
    instance = OneHandRoadPainting()
    exception = None
    try:
        __result = instance.fastest(dStart, dEnd, paintPerBrush);
    except:
        import traceback
        exception = traceback.format_exc()
    elapsed = time.time() - startTime   # in sec

    if exception is not None:
        sys.stdout.write("RUNTIME ERROR: \n")
        sys.stdout.write(exception + "\n")
        return 0

    if tc_equal(__expected, __result):
        sys.stdout.write("PASSED! " + ("(%.3f seconds)" % elapsed) + "\n")
        return 1
    else:
        sys.stdout.write("FAILED! " + ("(%.3f seconds)" % elapsed) + "\n")
        sys.stdout.write("           Expected: " + pretty_str(__expected) + "\n")
        sys.stdout.write("           Received: " + pretty_str(__result) + "\n")
        return 0

def run_tests():
    sys.stdout.write("OneHandRoadPainting (500 Points)\n\n")

    passed = cases = 0
    case_set = set()
    for arg in sys.argv[1:]:
        case_set.add(int(arg))

    with open("OneHandRoadPainting.sample", "r") as f:
        while True:
            label = f.readline()
            if not label.startswith("--"): break

            dStart = []
            for i in range(0, int(f.readline())):
                dStart.append(int(f.readline().rstrip()))
            dStart = tuple(dStart)
            dEnd = []
            for i in range(0, int(f.readline())):
                dEnd.append(int(f.readline().rstrip()))
            dEnd = tuple(dEnd)
            paintPerBrush = int(f.readline().rstrip())
            f.readline()
            __answer = int(f.readline().rstrip())

            cases += 1
            if len(case_set) > 0 and (cases - 1) in case_set: continue
            sys.stdout.write("  Testcase #%d ... " % (cases - 1))
            passed += do_test(dStart, dEnd, paintPerBrush, __answer)

    sys.stdout.write("\nPassed : %d / %d cases\n" % (passed, cases))

    T = time.time() - 1555841226
    PT, TT = (T / 60.0, 75.0)
    points = 500 * (0.3 + (0.7 * TT * TT) / (10.0 * PT * PT + TT * TT))
    sys.stdout.write("Time   : %d minutes %d secs\n" % (int(T/60), T%60))
    sys.stdout.write("Score  : %.2f points\n" % points)

if __name__ == '__main__':
    run_tests()

# }}}
# CUT end
