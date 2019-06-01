all: signal signal_run cosinus cosinus_run

signal:
	gfortran -o signal signal.F90 -lfftw3

signal_run:
	./signal
	
cosinus:
	gfortran -o cosinus cosinus.F90 -lfftw3
cosinus_run:
	./cosinus