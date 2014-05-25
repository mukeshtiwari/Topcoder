OUTPUT_D=../../build/haskell
DATA_D=../../data
COMPILER=ghc -i$$HOME/.gettc/include/haskell -outputdir $(OUTPUT_D)
RUNNER=sh ../../bin/runner.sh

run = $(RUNNER) $1 $(OUTPUT_D)/TwoWaysSortingRunner $(DATA_D)/$2 $(OUTPUT_D)/$2

default : demo

setup :
	if [ ! -d $(OUTPUT_D) ]; then mkdir -p $(OUTPUT_D); fi

main : TwoWaysSortingRunner.hs TwoWaysSorting.hs setup
	$(COMPILER) -o $(OUTPUT_D)/TwoWaysSortingRunner $<

test : TwoWaysSortingTest.hs TwoWaysSorting.hs setup
	$(COMPILER) -o $(OUTPUT_D)/TwoWaysSortingTest $<
	$(OUTPUT_D)/TwoWaysSortingTest

demo : main
	$(call run,verbose,demo) 

sys : main
	$(call run,quiet,sys)

sysv : main
	$(call run,verbose,sys)

clean :
	rm -rf $(OUTPUT_D)
