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

