# ================================== #
#  Web Server Makefile               #
#  Written by Angelo Kyrilov         #
#                                    #
#  Computer Science and Engineering  #
#  University of California, Merced  #
#                                    #
# ================================== #

# Specify the compiler
CC = g++

# Specify compiler flags
CFLAGS = -Iinc -Idep -w -std=c++11 -lboost_system -lboost_filesystem -lpthread

# Specify folder structure of project
IDIR = inc
ODIR = obj
BDIR = bin
SDIR = src
TDIR = test
PDIR = scratchpad

# Specify name of app executable
PROGRAM = server

# Specify name of test suite executable
TEST = test

# Specify name of scratchpad executable
SCRATCH = scratch

# Server Flags
run = -t templates/ -s static/
#==============================================================================================

# Do not edit below this line (unless you want to)

H_FILES := $(wildcard $(SDIR)/*.cpp)

SRC_FILES := $(wildcard $(SDIR)/*.cpp)
OBJ := $(patsubst $(SDIR)/%.cpp,$(ODIR)/%.o,$(SRC_FILES))

NEEDED_FILES := $(filter-out $(SDIR)/app.cpp, $(SRC_FILES))
TESTOBJ = $(TDIR)/$(ODIR)/test.o $(patsubst $(SDIR)/%.cpp,$(ODIR)/%.o,$(NEEDED_FILES))

SCRATCHOBJ = $(PDIR)/$(ODIR)/scratchpad.o $(patsubst $(SDIR)/%.cpp,$(ODIR)/%.o,$(NEEDED_FILES))

$(PDIR)/$(ODIR)/%.o: $(PDIR)/%.cpp $(H_FILES)
	$(CC) -c -o $@ $< $(CFLAGS)

$(TDIR)/$(ODIR)/%.o: $(TDIR)/%.cpp $(H_FILES)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/%.o: $(SDIR)/%.cpp $(H_FILES)
	$(CC) -c -o $@ $< $(CFLAGS)

$(PROGRAM): $(OBJ) 
	$(CC) $^ -o $(BDIR)/$@ $(CFLAGS)

$(TEST): $(TESTOBJ) 
	$(CC) $^ -o $(BDIR)/$@ $(CFLAGS)

$(SCRATCH): $(SCRATCHOBJ)
	$(CC) $^ -o $(BDIR)/$@ $(CFLAGS)

run: $(PROGRAM)
	./$(BDIR)/$^ $(run)

clean:
	$(RM) $(BDIR)/*
	$(RM) $(ODIR)/*.o
	$(RM) $(TDIR)/$(ODIR)/*.o
	$(RM) $(PDIR)/$(ODIR)/*.o
