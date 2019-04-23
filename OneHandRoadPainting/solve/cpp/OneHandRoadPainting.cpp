#include <vector>
#include <string>
using namespace std;

class OneHandRoadPainting {
public:
  int64 fastest(vector<int> const &dStart,
                vector<int> const &dEnd,
                int paintPerBrush) {
    
    vector<pair<int, int>  > v;
    for (int i = 0; i < dStart.size(); i++)
      v.push_back(make_pair(dStart[i], dEnd[i]));
      
    

    return 0;
  }
};
