include ../Makefile.common

OUTPUT_D =../../build/go
SOLVER = $(OUTPUT_D)/OneHandRoadPaintingSolver

$(SOLVER): OneHandRoadPaintingSolver.go OneHandRoadPainting/OneHandRoadPainting.go
	export GOPATH="$$GOPATH:$(GETTC_HOME)/include/go" \
		&& go build -o $(SOLVER) OneHandRoadPaintingSolver.go 

main: setup $(SOLVER)
