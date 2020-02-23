CC = g++
CXX = g++
CPPFLAGS = -I../include -std=c++11 -Wall -Wextra -g
LDFLAGS = -std=c++11

EXENAME = test

.PHONY : clean TAGS all

all : $(EXENAME)
	mv $(EXENAME) ../

test : mydate.o

clean :
	-rm -rf *.o $(EXENAME) *.dSYM

TAGS : clean all
