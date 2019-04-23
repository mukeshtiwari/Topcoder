include ../Makefile.common

OUTPUT_D = ../../build/haskell
SOLVER = $(OUTPUT_D)/OneHandSchedulingSolver
COMPILER = ghc -i$(GETTC_HOME)/include/haskell -outputdir $(OUTPUT_D)

$(SOLVER): OneHandSchedulingSolver.hs OneHandScheduling.hs
	$(COMPILER) -o $(SOLVER) $<

main: setup $(SOLVER)

