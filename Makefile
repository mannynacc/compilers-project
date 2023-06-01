all:
	yacc -d f1_parser.y
	lex f1_lex.l
	gcc lex.yy.c y.tab.c -ly -ll -o f1

clean:
	rm -rf f1
	rm -rf lex.yy.c
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf y.tab.h.gch

