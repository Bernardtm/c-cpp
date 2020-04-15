# Directories
INCLUDES_DIR=../include
LIBRARIES_DIR=../lib 
OBJECTS_DIR=obj

# Compiler
C_COMPILER=gcc
COMPILER_FLAGS=-I$(INCLUDES_DIR)

# Libraries
LIBS=-lm

# Dependencies
_DEPENDENCIES=
DEPENDENCIES= $(patsubst %,$(OBJECTS_DIR)/%,$(_DEPENDENCIES))

# Objects
_OBJECTS= helloworld.o
OBJECTS= $(patsubst %,$(OBJECTS_DIR)/%,$(_OBJECTS))

# Compile
$(OBJECTS_DIR)/%.o: %.c $(DEPENDENCIES)
		$(C_COMPILER) -c -o $@ $< $(COMPILER_FLAGS)

# Build
helloworld: $(OBJECTS)
		$(C_COMPILER) -o $@ $^ $(COMPILER_FLAGS) $(LIBS)

.PHONY: clean

clean:
		rm -f $(OBJECTS_DIR)/*.o *~ core $(INCLUDES_DIR)/*~