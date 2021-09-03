#include <iostream>
#include <vector>
#include <iterator>

#include "./lib/tools.hpp"

using namespace std;

int main(int argc, char **argv) {

    vector<string> command_vec(argv + 1, argv + argc);
    string full_command = join(command_vec, " ");

    printf("[ %s ]\n", full_command.c_str());

    handle_custom(full_command);

    system(full_command.c_str());

    return 0;
}
