# CS155 Problem Set 2 
This is a lexer analyzer implementation for the EASY language.

Submission by:\
Christian Dale R. Encinares\
2019-00752

## Usage
Navigate your directory into the cloned git repository then run the following code line by line in the terminal. Make sure to replace "<input file name>" with the EASY code's file name.
```                      
flex ENCINARES_CSS155_PS2.l 
gcc lex.yy.c -o output      
.\output <input file name> 
```
## Notes
This implementation does not handle comments in the EASY codes
