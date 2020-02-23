.PHONY: all clean
EXENAME = test

all: run

run:
	make -C src/ all
	./test

lint:
	python ./bin/cpplint.py --filter=-legal/copyright,-build/header_guard,-build/include_what_you_use src/*.cpp include/*.h 2>lint_result

clean:
	make -C src/ clean
	-rm -rf $(EXENAME) *.dSYM
