#include <cstdio>
#include <fstream>
#include <iostream>
#include <iterator>
#include <nlohmann/json.hpp>
#include <boost/algorithm/string/join.hpp>

using namespace std;
using json = nlohmann::json;

int main(int argc, char **argv) {

    /* NOT YET NEEDED
    ifstream config_file("./config.json");
    json config;
    config_file >> config;
    */

    vector<string> command_vec(argv + 1, argv + argc);

    printf("[ ");
    for (int i = 1; i < argc; i++) {
        cout << argv[i] << " ";
    }

    printf("]\n");

    string full_command = boost::join(command_vec, " ");
    system(full_command.c_str());

}
