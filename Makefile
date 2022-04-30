# Make for Assembly

.PHONY: help init build run clean

## Defines
_ARCH:=-arch
ARCH:=arm64 # Architecture - x86_64, arm64, [blank]

## for x86_64:
# MACOS:=true # MacOS - true, false (show the below or not)
# _MACOSVER:=-macosx_version_min
# MACOSVER:=12.0
# _MACOSL:=-L 
# MACOSL:=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
# _LSYSTEM:=-lSystem

SRC:=add128.s
OBJ:=add128.o
EXE:=add128.out

_SRC:=./src
_OBJ:=./obj
_EXE:=./exe

_MACSYSLIB:=-lSystem -syslibroot
MACSYSLIB:=`xcrun -sdk macosx --show-sdk-path`

_START:=-e
START:=_start

## Targets / Rules

help:
	@echo "Usage: make [target]"
	@echo "Available targets:"
	@echo "init - set up the project"
	@echo "build - build the program"
	@echo "run - run the program"
	@echo "clean - clean the build"

init:
	mkdir -p $(_SRC) $(_OBJ) $(_EXE)

build:
	@echo "Building..."
	as -o $(_OBJ)/$(OBJ) $(_SRC)/$(SRC) $(_ARCH) $(ARCH)
	ld -o $(_EXE)/$(EXE) $(_OBJ)/$(OBJ) $(_MACSYSLIB) $(MACSYSLIB) $(_START) $(START) $(_ARCH) $(ARCH)
	@echo "Done."

run:
	@echo "Running..."
	$(_EXE)/$(EXE)
	@echo $?
	@echo "Done."

clean:
	@echo "Cleaning..."
	rm $(_OBJ)/*.o
	rm $(_EXE)/*.out
	@echo "Done."
