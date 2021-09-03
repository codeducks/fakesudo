#include <cstdlib>
#include <nlohmann/json.hpp>
#include <boost/algorithm/string/join.hpp>
#include <fstream>
#include <cstdio>

using namespace std;
using json = nlohmann::json;


/* Location defaults */
string home_env = getenv("HOME");
string config_filename  = home_env + "/.fakesudo_config";
string history_filename = home_env + "/.fakesudo_history";

string join(vector<string> cmd_vec, string seperator) {
    string cmd = boost::join(cmd_vec, seperator);
    return cmd;
}

// this checks the json for settings and performs as necessary
void handle_custom(string cmd) {

    ifstream config_file(config_filename);

    /* DEFAULTS */

    bool use_history = false;

    if(config_file.good() == false) {
        printf("Couldn't find config file at \"%s\". Using defaults.", config_filename.c_str());
        return;
    }

    json config;
    config_file >> config;

    if(config["use_history"].dump() == "true") use_history = true;

    if(use_history == true) {
        ofstream his_file(history_filename);
        his_file << cmd << endl;
        his_file.close();
    }

    return;
}
