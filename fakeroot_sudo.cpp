#include <iostream>
#include <vector>
#include "./lib/tools.hpp"

using namespace std;

int main(int argc, char **argv) {

    vector<string> arguments(argv + 1, argv + argc);
    string full_command = join(arguments, " ");

    printf("[ %s ]\n", full_command.c_str());

    full_command = "fakeroot " + full_command;

    system(full_command.c_str());

}
