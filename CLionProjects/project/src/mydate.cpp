#include <sstream>
#include "../include/mydate.h"

using std::stringstream;

bool MyDate:: isLeapYear () {
    return ((year%100!=0&&year%4==0)||year%400==0);
}

void MyDate::addOneDay(){
    day++;
    if ( day > days[month - 1]){
        day = 1;
        month++;
        if (month > 12) {
        month=1;
        year++ ;
            if(isLeapYear()) {
                days[1] = 29;
            }else
            days[1]=28;
        }
    }
}

MyDate ::MyDate() {
}

MyDate::MyDate(int yearInput,int month_input,int day_input) {
    year = yearInput;
    month = month_input;
    day = day_input;
}

int MyDate::getYear () {
    return year;
}

int MyDate::getMonth() {
    return month;
}

int MyDate::getDay() {
    return day;
}

MyDate& MyDate :: addDay(int inc) {
    while ( inc -- ) {
        addOneDay();
    }
    return *this;
}
string MyDate::toString() {
    stringstream ss;
    ss << year <<"-"<< month <<"-"<< day;
    return ss.str() ;
}
