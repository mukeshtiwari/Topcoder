#include <fstream>
#include <topcoder>
#include "CycleLength.cpp"
namespace tc = TopCoder;

int main(int argc, char const *argv[]) {
  try {
    std::ifstream ifs(argv[1]);
    int seed; tc::read(ifs, seed); tc::next(ifs);
    int a; tc::read(ifs, a); tc::next(ifs);
    int b; tc::read(ifs, b); tc::next(ifs);
    int m; tc::read(ifs, m);
    ifs.close();

    std::ofstream ofs(argv[2]);
    CycleLength solver;
    tc::show(ofs, solver.solve(seed, a, b, m));
    ofs.close();
  } catch (std::exception &e) {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}
