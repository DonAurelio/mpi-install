COMPILER = mpicc
TARGET  = hello_world
EXT = .c

N = 4
HOST_FILE = host_file

all: run_single_host

compile:
	${COMPILER} -o ${TARGET} ${TARGET}${EXT}

run_single_host: compile
	mpirun --allow-run-as-root  -n ${N} ./${TARGET}

run_multi_host: compile
	mpirun --allow-run-as-root  -n ${N} -f ${HOST_FILE} ./${TARGET}

clean:
	rm -f ${TARGET}
