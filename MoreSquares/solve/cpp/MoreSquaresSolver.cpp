#include <fstream>
#include <topcoder>
#include "MoreSquares.cpp"
namespace tc = TopCoder;

int main(int argc, char const *argv[]) {
  try {
    std::ifstream ifs(argv[1]);
    int N; tc::read(ifs, N); tc::next(ifs);
    int SX; tc::read(ifs, SX); tc::next(ifs);
    int SY; tc::read(ifs, SY); tc::next(ifs);
    vector<int> Xprefix; tc::read(ifs, Xprefix); tc::next(ifs);
    vector<int> Yprefix; tc::read(ifs, Yprefix);
    ifs.close();

    std::ofstream ofs(argv[2]);
    MoreSquares solver;
    tc::show(ofs, solver.countLocations(N, SX, SY, Xprefix, Yprefix));
    ofs.close();
  } catch (std::exception &e) {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}
