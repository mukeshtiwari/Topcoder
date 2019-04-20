include ../Makefile.common

OUTPUT_D =../../build/go
SOLVER = $(OUTPUT_D)/CycleLengthSolver

$(SOLVER): CycleLengthSolver.go CycleLength/CycleLength.go
	export GOPATH="$$GOPATH:$(GETTC_HOME)/include/go" \
		&& go build -o $(SOLVER) CycleLengthSolver.go 

main: setup $(SOLVER)
