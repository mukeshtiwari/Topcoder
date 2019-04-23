#include <fstream>
#include <topcoder>
#include "OneHandScheduling.cpp"
namespace tc = TopCoder;

int main(int argc, char const *argv[]) {
  try {
    std::ifstream ifs(argv[1]);
    vector<int> tStart; tc::read(ifs, tStart); tc::next(ifs);
    vector<int> tEnd; tc::read(ifs, tEnd);
    ifs.close();

    std::ofstream ofs(argv[2]);
    OneHandScheduling solver;
    tc::show(ofs, solver.checkSchedule(tStart, tEnd));
    ofs.close();
  } catch (std::exception &e) {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}
