include ../Makefile.common

OUTPUT_D =../../build/go
SOLVER = $(OUTPUT_D)/SwappingNodesSolver

$(SOLVER): SwappingNodesSolver.go SwappingNodes/SwappingNodes.go
	export GOPATH="$$GOPATH:$(GETTC_HOME)/include/go" \
		&& go build -o $(SOLVER) SwappingNodesSolver.go 

main: setup $(SOLVER)
