include ../Makefile.common

OUTPUT_D =../../build/cpp
SOLVER = $(OUTPUT_D)/SwappingNodesSolver
COMPILER = g++ -std=gnu++0x -I$(GETTC_HOME)/include/cpp

$(SOLVER): SwappingNodesSolver.cpp SwappingNodes.cpp
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)
