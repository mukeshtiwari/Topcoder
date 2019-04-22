#include <fstream>
#include <topcoder>
#include "OneHandSort.cpp"
namespace tc = TopCoder;

int main(int argc, char const *argv[]) {
  try {
    std::ifstream ifs(argv[1]);
    vector<int> target; tc::read(ifs, target);
    ifs.close();

    std::ofstream ofs(argv[2]);
    OneHandSort solver;
    tc::show(ofs, solver.sortShelf(target));
    ofs.close();
  } catch (std::exception &e) {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}
