#include <fstream>
#include <topcoder>
#include "SwappingNodes.cpp"
namespace tc = TopCoder;

int main(int argc, char const *argv[]) {
  try {
    std::ifstream ifs(argv[1]);
    vector<int> leaves; tc::read(ifs, leaves); tc::next(ifs);
    int numberOfLeaves; tc::read(ifs, numberOfLeaves);
    ifs.close();

    std::ofstream ofs(argv[2]);
    SwappingNodes solver;
    tc::show(ofs, solver.swapNodes(leaves, numberOfLeaves));
    ofs.close();
  } catch (std::exception &e) {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}
