include ../Makefile.common

OUTPUT_D = ../../build/haskell
SOLVER = $(OUTPUT_D)/OneHandSortSolver
COMPILER = ghc -i$(GETTC_HOME)/include/haskell -outputdir $(OUTPUT_D)

$(SOLVER): OneHandSortSolver.hs OneHandSort.hs
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)

