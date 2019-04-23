include ../Makefile.common

OUTPUT_D =../../build/cpp
SOLVER = $(OUTPUT_D)/OneHandRoadPaintingSolver
COMPILER = g++ -std=gnu++0x -I$(GETTC_HOME)/include/cpp

$(SOLVER): OneHandRoadPaintingSolver.cpp OneHandRoadPainting.cpp
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)
