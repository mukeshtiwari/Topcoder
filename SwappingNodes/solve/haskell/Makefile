include ../Makefile.common

OUTPUT_D = ../../build/haskell
SOLVER = $(OUTPUT_D)/SwappingNodesSolver
COMPILER = ghc -i$(GETTC_HOME)/include/haskell -outputdir $(OUTPUT_D)

$(SOLVER): SwappingNodesSolver.hs SwappingNodes.hs
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)

