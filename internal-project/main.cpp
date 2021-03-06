#include <iostream>
#include <some.h>

int main(int argc, char *argv[])
{
    std::cout << "base application message" << std::endl;
    some::someLibrary::printSomething();
}
