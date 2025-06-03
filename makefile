noargs:
	@echo "usage: make run ARGS=\"various required args\""
run:
	processing-java --sketch=PROJECT --run $(ARGS)
