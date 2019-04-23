include ../Makefile.common

OUTPUT_D =../../build/go
SOLVER = $(OUTPUT_D)/OneHandSchedulingSolver

$(SOLVER): OneHandSchedulingSolver.go OneHandScheduling/OneHandScheduling.go
	export GOPATH="$$GOPATH:$(GETTC_HOME)/include/go" \
		&& go build -o $(SOLVER) OneHandSchedulingSolver.go 

main: setup $(SOLVER)
