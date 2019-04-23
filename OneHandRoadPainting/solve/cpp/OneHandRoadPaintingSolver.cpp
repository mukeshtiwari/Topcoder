#include <fstream>
#include <topcoder>
#include "OneHandRoadPainting.cpp"
namespace tc = TopCoder;

int main(int argc, char const *argv[]) {
  try {
    std::ifstream ifs(argv[1]);
    vector<int> dStart; tc::read(ifs, dStart); tc::next(ifs);
    vector<int> dEnd; tc::read(ifs, dEnd); tc::next(ifs);
    int paintPerBrush; tc::read(ifs, paintPerBrush);
    ifs.close();

    std::ofstream ofs(argv[2]);
    OneHandRoadPainting solver;
    tc::show(ofs, solver.fastest(dStart, dEnd, paintPerBrush));
    ofs.close();
  } catch (std::exception &e) {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}
