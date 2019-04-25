include ../Makefile.common

OUTPUT_D =../../build/go
SOLVER = $(OUTPUT_D)/MoreSquaresSolver

$(SOLVER): MoreSquaresSolver.go MoreSquares/MoreSquares.go
	export GOPATH="$$GOPATH:$(GETTC_HOME)/include/go" \
		&& go build -o $(SOLVER) MoreSquaresSolver.go 

main: setup $(SOLVER)
