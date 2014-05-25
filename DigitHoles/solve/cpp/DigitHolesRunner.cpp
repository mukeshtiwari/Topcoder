#include <topcoder>
using namespace TopCoder;
#include "DigitHoles.cpp"
#include <fstream>
using namespace std;

int main(int argc, char const *argv[]) {
    try {
        ifstream ifs(argv[1]);
        int number; read(ifs, number);
        ifs.close();

        ofstream ofs(argv[2]);
        show(ofs, numHoles(number));
        ofs.close();
    } catch (exception &e) {
        cerr << e.what() << endl;
    }
    return 0;
}
