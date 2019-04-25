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

class MoreSquares {
    public:
    pair<int, int> addPoint(pair<int, int> p, pair<int, int> q)
    {
      return make_pair(p.first + q.first, p.second + q.second);
    }


    public:
    vector<pair<int, int>> computePoint(pair<int, int> p, pair<int, int> q)
    {
      pair<int, int> w = make_pair(-(q.second - p.second), q.first - p.first);
      vector<pair<int, int>> v;
      v.push_back(addPoint(p, w));
      v.push_back(addPoint(q, w));
      return v;
    }
      


    public:
    int countLocations(int n, int SX, int SY, vector<int> Xprefix, vector<int> Yprefix) {
      
      int L = (int) Xprefix.size();
      vector<int> x(n), y(n);
      for (int i = 0; i < L; i++) {
          x[i] = Xprefix[i];
          y[i] = Yprefix[i];
        }
      for (int i = L; i < n; i++) {
          x[i] = (x[i - 1] * 47 + 42) % SX;
          y[i] = (y[i - 1] * 47 + 42) % SY;
        }
      vector<pair<int, int>> p(n);
      for (int i = 0; i < n; i++) {
        p[i] = make_pair(x[i], y[i]);
      }  

      set<pair<int, int>> s;
      for (int i = 0; i < n; i++) s.insert(p[i]);


      vector<pair<int, int>> vp(s.begin(), s.end());
      set<pair<int, int>> pset;
      int ln = vp.size();
      for(int i = 0; i < ln; i++)
        for(int j = 0; j < ln; j++)
        {
          if (i == j) continue;
          vector<pair<int, int>> t = computePoint(vp[i], vp[j]);
          pair<int, int> fir = t[0];
          pair<int, int> sec = t[1];
          if (s.count(fir) == 0 && s.count(sec) == 0) continue;
          else if (s.count(fir) != 0 && s.count(sec) != 0) continue;
          else if (s.count(fir) == 0 && s.count(sec) != 0) pset.insert(fir);
          else pset.insert(sec);
        }


      return pset.size();
    }
};

// CUT begin
ifstream data("MoreSquares.sample");

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

bool do_test(int N, int SX, int SY, vector<int> Xprefix, vector<int> Yprefix, int __expected) {
    time_t startClock = clock();
    MoreSquares *instance = new MoreSquares();
    int __result = instance->countLocations(N, SX, SY, Xprefix, Yprefix);
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
        int N;
        from_stream(N);
        int SX;
        from_stream(SX);
        int SY;
        from_stream(SY);
        vector<int> Xprefix;
        from_stream(Xprefix);
        vector<int> Yprefix;
        from_stream(Yprefix);
        next_line();
        int __answer;
        from_stream(__answer);

        cases++;
        if (case_set.size() > 0 && case_set.find(cases - 1) == case_set.end())
            continue;

        cout << "  Testcase #" << cases - 1 << " ... ";
        if ( do_test(N, SX, SY, Xprefix, Yprefix, __answer)) {
            passed++;
        }
    }
    if (mainProcess) {
        cout << endl << "Passed : " << passed << "/" << cases << " cases" << endl;
        int T = time(NULL) - 1556173782;
        double PT = T / 60.0, TT = 75.0;
        cout << "Time   : " << T / 60 << " minutes " << T % 60 << " secs" << endl;
        cout << "Score  : " << 250 * (0.3 + (0.7 * TT * TT) / (10.0 * PT * PT + TT * TT)) << " points" << endl;
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
        cout << "MoreSquares (250 Points)" << endl << endl;
    }
    return run_test(mainProcess, cases, argv[0]);
}
// CUT end
