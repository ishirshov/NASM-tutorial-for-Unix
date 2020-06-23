OBJECTS = asmtutor.com tutorialspoint.com


.PHONY: all $(OBJECTS)
all:
	for d in $(OBJECTS);				\
	do									\
		$(MAKE) --directory=$$d;		\
    done


clean: $(OBJECTS)
	for d in $(OBJECTS);				\
	do									\
		$(MAKE) --directory=$$d clean;	\
    done




