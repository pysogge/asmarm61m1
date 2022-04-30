# ARM Assembly Tools / Structure

Running on Apple M1, 2020; O.S. version 12.1

## To Start (on a Mac M1, Make)
```bash
# Init
make init (to ensure you have dir structure)
# Build
make build
# Run
make run ## should return "error 9" 9 is the return code!

# Clean
make clean
```

## To Build & Run Manually
```bash
# Init
mkdir -p exe obj

# Build
as -o ./obj/add128.o ./src/add128.s -arch arm64
ld -o ./exe/add128.out ./obj/add128.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

#Run
./exe/add128.out
echo $? ## should return 9
```
