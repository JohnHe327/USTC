#include <cassert>
#include <iostream>
#include "../include/mydate.h"

using std::cin;
using std::cout;
using std::endl;
using std::string;

void assertequal(const string &x, const string &value) {
    static int id = 0;
    ++id;
    if (x != value) {
        cout << "错误测试用例 " << id << endl;
        exit(1);
    }
    return;
}

int main() {
    assertequal(MyDate(2000, 1, 1).toString(), "2000-1-1");
    assertequal(MyDate(2000, 1, 1).addDay(80).toString(), "2000-3-22");
    assertequal(MyDate(1999, 12, 31).addDay(1).toString(), "2000-1-1");
    return 0;
}
