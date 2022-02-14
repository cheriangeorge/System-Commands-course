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
  - Example [condition-examples.sh](Example_Files/condition-examples.sh)

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
	- Example [arithmetic-example-1.sh](Example_Files/arithmetic-example-1.sh)
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
|	`a \| b`	|	Return a if neither argument is null or 0; else return b	|
|	`a & b`	|	Return a if neither argument is null or 0; else return 0	|
|	`a != b`	|	Return 1 if a is not equal to b; else return 0	|
|	`str : reg`	|	Return the position upto anchored pattern match with BRE str	|
|	`match str reg`	|	Return the pattern match if reg matches pattern in str	|
|	`substr str n m`	|	Return the substring m chars in length starting at position n	|
|	`index str chars`	|	Return position in str where any one of chars is found else return 0	|
|	`length str`	|	Return numeric length of string str	|
|	`+ token`	|	Interpret token as string even if its a keyword	|
|	`(exprn)`	|	Return the value of expression exprn	|

* Example [expr-examples.sh](Example_Files/expr-examples.sh)

* Bench Calculator 
	- An arbitaty preciscion calculator language
	- `bc -l`
		- the `l` option loads the math library.
	- `12^6` or `12.6/3.6`
	- Can be used for floating point operations.
	
* heredoc feature 
	- helps while passing long strings without having to worry about `\n` etc.
	- Example [heredoc-example-1.sh](Example_Files/heredoc-example-1.sh)
	- Example [heredoc-example-2.sh](Example_Files/heredoc-example-2.sh)
	- A hyphen tells bash to ignore leading tabs
	
* PATH variable
	- Example [path-example.sh](Example_Files/path-example.sh)
		- IFS (Internal Field Seperator)
___ 
L6.3

* if-elif-else-fi loop
```bash
if condition1
then
	commandset1
else
	commandset2
fi
```
```bash
if condition1
then
	commandset1
elif condition2
then
	commandset2
elif condition3
then
	commandset3
else
	commandset4
fi
```
* case statement options
	- commandset4 is the default for values of $var not matching what are listed
	
```bash
case $var in
	op1)
		commandset1;;
	op2 | op3)
		commandset2;;
	op4 | op5 | op6)
		commandset3;;
	*)
		commandset4;;
esac
```
* c style for loop : one variable
	- extention of POSIX and maynot be available in all the shells
	- Adding `time` before a script command gives the amount of time taken to execute.

```bash
begin=1
finish=10
for (( a = $begin; a < $finish; a++ ))
do
	echo $a
done
```

* c style for loop : two variables
	- Note: Only one condition to close the for loop

```bash
begin1=1
begin2=10
finish=10
for (( a=$begin1, b=$begin2; a < $finish; a++, b-- ))
do
	echo $a $b
done
```

* processing output of a loop
	- Output of the loop is redirected to the tmp file
```bash
filename=tmp.$$
begin=1
finish=10
for (( a = $begin; a < $finish; a++ ))
do
	echo $a
done > $filename
```

* break
	- Break out of inner loop
```bash
n=10
i=0
while [ $i -lt $n ]
do
	echo $i
	(( i++ ))
	if [ $i -eq 5 ]
	then
		break
	fi
done
```
	- Break out of outer loop
```bash
n=10
i=0
while [ $i -lt $n ]
do
	echo $i
	j=0
	while [ $j -le $i ]
	do
		printf "$j "
		(( j++ ))
		if [ $j -eq 7 ]
		then
			break 2
		fi
	done
	(( i++ ))
done
```

* continue
	- Continue will skip rest of the commands in the loop and goes to next iteration

```bash
n=9
i=0
while [ $i -lt $n ]
do
	printf "\n loop $i:"
	j=0
	(( i++ ))
	while [ $j -le $i ]
	do
		(( j++ ))
		if [ $j -gt 3 ] && [ $j -lt 6 ]
		then
			continue
		fi
		printf "$j "
	done
done
```

* shift
	- shift will shift the command line arguments by one to the left.
	- shift is destructive - after the arguments are shifted t the left they are gone. This is only helpful if you don't need the arguments later.
	- n checks if it is a non-zero argument
	- except $0, which is the name of the script, the rest of the arguments get popped 

```bash
i=1
while [ -n "$1" ]
do
	echo argument $i is $1
	shift
	(( i++ ))
done
```

* exec
	- `exec ./my-executable --my-options --my-args`
	- To replace shell with a new program or to change i/o settings
	- If new program is launched successfully, it will not return control to the shell
	- If new program fails to launch, the shell continues

* eval
	- `eval my-arg`
	- Execute argument as a shell command
	- Combines arguments into a single string
	- Returns control to the shell with exit status
	- Example [eval-example.sh](Example_Files/eval-example.sh)
* function 
	- Example [function-example.sh](Example_Files/function-example.sh)
* getopts
	- This script can be invoked with only three options: `a`, `b`, `c`. The options `b` and `c` will take arguments.
	- Example [getopts-example.sh](Example_Files/getopts-example.sh)

```bash
while getopts "ab:c:" options;
do
	case "${options}" in
		b)
			barg=${OPTARG}
			echo accepted: -b $barg
			;;
		c)
			carg=${OPTARG}
			echo accepted: -c $carg
			;;
		a)
			echo accepted: -a
			;;
		*)
			echo Usage: -a -b barg -c carg
			;;
	esac
done
```

* select loop
	- Text Menu
	- Example [select-example.sh](Example_Files/select-example.sh)
```bash
echo select a middle one
select i in {1..10}
do
	case $i in
		1 | 2 | 3)
			echo you picked a small one;;
		8 | 9 | 10)
			echo you picked a big one;;
		4 | 5 | 6 | 7)
			echo you picked the right one
			break;;
	esac
done
echo selection completed with $i
```

* Additional notes
	- Warning : Never `eval` a user supplied string on any command line
	- eval is sending the strings to the shell and printing them out.
	- Can source a file with functions to use it in a shell script
	- `source mylib.sh`
	- Do not give set uid permission to the scripts unless you know what you are doing

___
L6.4
### awk
##### A language for processing fields and records

* Introduction
	- It is a programming language
	- awk is an abbreviation of the names of three people who developed it: Aho, Weinberger & Kernighan
	- It is a part of POSIX, IEEE 1003.1-2008
	- Variants: nawk, gawk, mawk ...
	- gawk contains features that extend POSIX

* Execution model
	- Input stream is a set of records
	- Eg., using "\n" as record separator, lines are records
	- Each record is a sequence of fields
	- Eg., using " " as field separator, words are fields
	- Splitting of records to fields is done automatically
	- Each code block executes on one record at a time, as matched by the pattern of that block

* Usage
	- Single line at the command line
		- ```cat /etc/passwd | awk -F”:” ‘{print $1}’```
	- Script interpreted by awk
		- `./myscript.awk /etc/passwd`
		- `myscript.awk`
		```awk
		#!/usr/bin/gawk -f
		BEGIN {
			FS=":"
			}
		{
			print $1
		}
		```
		
* Built-in variables
