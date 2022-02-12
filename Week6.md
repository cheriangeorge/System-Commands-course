6.1
### Shell programming
##### More features in bash scripts

* Debugging
  - Print the command before executing it
    - `set -x ./myscript.sh`
    - `bash -x ./myscript.sh`
  - Place the `set -x` inside the script

* Combining conditions
  - `[ $a -gt 3 ] && [ $a -gt 7 ]`
  - `[ $a -lt 3 ] || [ $a -gt 7 ]`

* Shell arithmetic
  - Using `let`
		- `let a=$1+5`
		- `let "a= $1 + 5"`
	- Using `expr`
	  - `expr $a +20`
	  - `expr "$a + 20"`
	  - `b=$( expr $a + 20 )`
	- Using `$[ expression ]`
	  - `b=$[ $a + 10 ]`
	- Using `$(( expression ))`
	  - `b=$(( $a + 10 ))`
	  - `(( b++ ))`- Without $. Not intending to return. Useful for incrementing
* ### expr command operators

| Expression  | Description  |
|---|---|
|	`a + b`	|	Return arithmetic sum of a and b	|
|	`a - b`	|	Return arithmetic difference of a and b	|
|	`a * b`	|	Return arithmetic product of a and b	|
|	`a / b`	|	Return arithmetic quotient of a divided by b	|
|	`a % b`	|	Return arithmetic remainder of a divided by b	|
|	`a > b`	|	Return 1 if a greater than b; else return 0	|
|	`a >= b`	|	Return 1 if a greater than or equal to b; else return 0	|
|	`a < b`	|	Return 1 if a less than b; else return 0	|
|	`a <= b`	|	Return 1 if a less than or equal to b; else return 0	|
|	`a = b`	|	Return 1 if a equals b; else return 0	|
|	`a | b`	|	Return a if neither argument is null or 0; else return b	|
|	`a & b`	|	Return a if neither argument is null or 0; else return 0	|
|	`a != b`	|	Return 1 if a is not equal to b; else return 0	|
|	`str : reg`	|	Return the position upto anchored pattern match with BRE str	|
|	`match str reg`	|	Return the pattern match if reg matches pattern in str	|
|	`substr str n m`	|	Return the substring m chars in length starting at position n	|
|	`index str chars`	|	Return position in str where any one of chars is found else return 0	|
|	`length str`	|	Return numeric length of string str	|
|	`+ token`	|	Interpret token as string even if its a keyword	|
|	`(exprn)`	|	Return the value of expression exprn	|

* Bench Calculator 
	- An arbitaty preciscion calculator language
	- `bc -l`
		- the `l` option loads the math library.
	- `12^6` or `12.6/3.6`
	- Can be used for floating point operations.
	
* heredoc feature 
	- helps while passing long strings without having to worry about `\n` etc.
	- A hyphen tells bash to ignore leading tabs
	
* PATH variable
