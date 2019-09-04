#include <served/served.hpp>

int main(int argc, char const* argv[]) {
    // Create a multiplexer for handling requests
    served::multiplexer mux;

    // Get /scores
    mux.handle("/scores")
        .get([](served::response & res, const served::request & req) {
            res << "Hello world!";
        });

    //  Create the server and run with 5 handler threads.
    served::net::server server("127.0.0.1", "8080", mux);
    server.run(5);

    return(EXIT_SUCCESS);
}