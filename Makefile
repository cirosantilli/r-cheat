.POSIX:

IN_EXT ?= .r

INS := $(wildcard *$(IN_EXT))

.PHONY: all clean

all: $(INS)
	fail=false ;\
	for t in $^; do\
	  if ! ./"$$t"; then \
	    fail=true ;\
	    break ;\
	  fi ;\
	done ;\
	if $$fail; then \
	  echo "TEST FAILED: $$t" ;\
	  exit 1 ;\
	else \
	  echo 'ALL TESTS PASSED' ;\
	  exit 0 ;\
	fi ;\

clean:
	rm -f *.tmp
