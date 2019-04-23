#include <cstdio>
#include <cmath>
#include <cstring>
#include <ctime>
#include <iostream>
#include <algorithm>
#include <set>
#include <vector>
#include <sstream>
#include <typeinfo>
#include <fstream>

using namespace std;

class OneHandRoadPainting {

  public:
    long long solve(vector<pair<int, int> > vzip, int paintPerBrush)
    {
      int n = vzip.size();
      long long ans = 0;
      for (int i = 0; i < n; i++)
      {
        div_t res = div(vzip[i].first - vzip[i].second, paintPerBrush);
        int numseg = res.quot, restseg = res.rem;
        if (numseg == 0 && restseg == 0) ans += 0; // This case is not possilbe
        else if (numseg != 0 && restseg == 0)
            ans = ans + (long long) 2 * sumAP(vzip.[i].first, numseg, -paintPerBrush);
        else if (numseg == 0 && restseg != 0)
        {
            


      }
      return 0;

    }

    long long fastest(vector<int> dStart, vector<int> dEnd, int paintPerBrush) {
      vector<pair<int, int> > vzip;
      int n = dStart.size();
      for (int i = 0; i <= n; i++) vzip.push_back(make_pair(dEnd[i], dStart[i]));
      reverse(vzip.begin(), vzip.end());
      return solve(vzip, paintPerBrush);
    }
};

// CUT begin
ifstream data("OneHandRoadPainting.sample");

string next_line() {
    string s;
    getline(data, s);
    return s;
}

template <typename T> void from_stream(T &t) {
    stringstream ss(next_line());
    ss >> t;
}

void from_stream(string &s) {
    s = next_line();
}

template <typename T> void from_stream(vector<T> &ts) {
    int len;
    from_stream(len);
    ts.clear();
    for (int i = 0; i < len; ++i) {
        T t;
        from_stream(t);
        ts.push_back(t);
    }
}

template <typename T>
string to_string(T t) {
    stringstream s;
    s << t;
    return s.str();
}

string to_string(string t) {
    return "\"" + t + "\"";
}

bool do_test(vector<int> dStart, vector<int> dEnd, int paintPerBrush, long long __expected) {
    time_t startClock = clock();
    OneHandRoadPainting *instance = new OneHandRoadPainting();
    long long __result = instance->fastest(dStart, dEnd, paintPerBrush);
    double elapsed = (double)(clock() - startClock) / CLOCKS_PER_SEC;
    delete instance;

    if (__result == __expected) {
        cout << "PASSED!" << " (" << elapsed << " seconds)" << endl;
        return true;
    }
    else {
        cout << "FAILED!" << " (" << elapsed << " seconds)" << endl;
        cout << "           Expected: " << to_string(__expected) << endl;
        cout << "           Received: " << to_string(__result) << endl;
        return false;
    }
}

int run_test(bool mainProcess, const set<int> &case_set, const string command) {
    int cases = 0, passed = 0;
    while (true) {
        if (next_line().find("--") != 0)
            break;
        vector<int> dStart;
        from_stream(dStart);
        vector<int> dEnd;
        from_stream(dEnd);
        int paintPerBrush;
        from_stream(paintPerBrush);
        next_line();
        long long __answer;
        from_stream(__answer);

        cases++;
        if (case_set.size() > 0 && case_set.find(cases - 1) == case_set.end())
            continue;

        cout << "  Testcase #" << cases - 1 << " ... ";
        if ( do_test(dStart, dEnd, paintPerBrush, __answer)) {
            passed++;
        }
    }
    if (mainProcess) {
        cout << endl << "Passed : " << passed << "/" << cases << " cases" << endl;
        int T = time(NULL) - 1555841312;
        double PT = T / 60.0, TT = 75.0;
        cout << "Time   : " << T / 60 << " minutes " << T % 60 << " secs" << endl;
        cout << "Score  : " << 500 * (0.3 + (0.7 * TT * TT) / (10.0 * PT * PT + TT * TT)) << " points" << endl;
    }
    return 0;
}

int main(int argc, char *argv[]) {
    cout.setf(ios::fixed, ios::floatfield);
    cout.precision(2);
    set<int> cases;
    bool mainProcess = true;
    for (int i = 1; i < argc; ++i) {
        if ( string(argv[i]) == "-") {
            mainProcess = false;
        } else {
            cases.insert(atoi(argv[i]));
        }
    }
    if (mainProcess) {
        cout << "OneHandRoadPainting (500 Points)" << endl << endl;
    }
    return run_test(mainProcess, cases, argv[0]);
}
// CUT end
