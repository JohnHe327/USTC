#pragma once
#include <string>

using std::string;

class MyDate {
private:
    int days[12]={
        31,28, 31, 30, 31, 30, 31, 31, 30, 31,30, 31
    };
    int year, month, day;
    bool isLeapYear ();
    void addOneDay ();
public:
    MyDate();
    MyDate(int year_input,int month_input,int day_input);
    int getYear();
    int getMonth();
    int getDay() ;
    MyDate& addDay(int inc);
    string toString();
};
