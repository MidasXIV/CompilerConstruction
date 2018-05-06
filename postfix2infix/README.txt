postfix to infix conversion.
If we were to write conversion program in C how many lines of code, would it be.? :-)
$ yacc -d a.y
$ lex a.l
$ gcc lex.yy.c y.tab.c -ll -o a
$ ./a
./a
1:Pl enter a postfix expr ending with ; or <ctrl-d> to quit : 2 3 5 * +;
The infix expr is  (2 +  (3 * 5) )
2:Pl enter yet another postfix expr ending with ; or <ctrl-d> to quit : 2 3 + 5 *;
The infix expr is  ( (2 + 3)  * 5)
2:Pl enter yet another postfix expr ending with ; or <ctrl-d> to quit : 3 5 * 2 +;
The infix expr is  ( (3 * 5)  + 2)
2:Pl enter yet another postfix expr ending with ; or <ctrl-d> to quit : 3 5 2 + *;
The infix expr is  (3 *  (5 + 2) )
2:Pl enter yet another postfix expr ending with ; or <ctrl-d> to quit : 3 5 2 + * 4 + 5 2 * +;
The infix expr is  ( ( (3 *  (5 + 2) )  + 4)  +  (5 * 2) )
2:Pl enter yet another postfix expr ending with ; or <ctrl-d> to quit :


