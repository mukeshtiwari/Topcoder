include ../Makefile.common

OUTPUT_D =../../build/cpp
SOLVER = $(OUTPUT_D)/MoreSquaresSolver
COMPILER = g++ -std=c++14 -I$(GETTC_HOME)/include/cpp

$(SOLVER): MoreSquaresSolver.cpp MoreSquares.cpp
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)
