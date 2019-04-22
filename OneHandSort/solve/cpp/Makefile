include ../Makefile.common

OUTPUT_D =../../build/cpp
SOLVER = $(OUTPUT_D)/OneHandSortSolver
COMPILER = g++ -std=gnu++0x -I$(GETTC_HOME)/include/cpp

$(SOLVER): OneHandSortSolver.cpp OneHandSort.cpp
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)
