include ../Makefile.common

OUTPUT_D =../../build/cpp
SOLVER = $(OUTPUT_D)/OneHandSchedulingSolver
COMPILER = g++ -std=gnu++0x -I$(GETTC_HOME)/include/cpp

$(SOLVER): OneHandSchedulingSolver.cpp OneHandScheduling.cpp
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)
