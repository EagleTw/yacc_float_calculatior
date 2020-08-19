CC = gcc
LEXYACC = calc
TARGET = calc

all: $(LEXYACC).l $(LEXYACC).y
	# compile bison
	bison -d -o y.tab.c $(LEXYACC).y
	gcc -c -g -I.. y.tab.c 
	
	# compile flex
	flex -o lex.yy.c $(LEXYACC).l	
	gcc -c -g -I.. lex.yy.c

	# compile and link bison and flex
	gcc -o $(TARGET)  y.tab.o lex.yy.o -ll

clean:
	rm -f $(TARGET) lex.yy.c y.tab.c y.tab.h *.o
