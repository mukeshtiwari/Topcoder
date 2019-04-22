include ../Makefile.common

OUTPUT_D =../../build/go
SOLVER = $(OUTPUT_D)/OneHandSortSolver

$(SOLVER): OneHandSortSolver.go OneHandSort/OneHandSort.go
	export GOPATH="$$GOPATH:$(GETTC_HOME)/include/go" \
		&& go build -o $(SOLVER) OneHandSortSolver.go 

main: setup $(SOLVER)
