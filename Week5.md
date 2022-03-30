### Week 5 Notes

#### Command Line Editors
* Working with text files in the terminal
* Editors
  - Line Editors (Present in almost every flavour of UNIX / GNU Linux)
    - `ed`
    - `ex` (improved version of ed)
  - Terminal Editors
    - `pico` (Came along with the pine email application)
      - `nano` (Features added to pico)
    - `vi` (most popular and complex)
    - `emacs` 
  - GUI Editors
    - KDE
      - `kate`
      - `kwrite`
    - GNOME
      - `gedit`
    - sublime
    - atom (popular among github users)
    - brackets (Popular for those writing html code)
  - IDE
    - eclipse
    - Bluefish
    - NetBeans
* Features of text editors
  - Scrolling , view modes, current position in file
  - Navigation (char,word,line,pattern)
  - Insert, Replace, Delete
  - Cut-Copy-Paste
  - Search-Replace
  - Language-aware syntax highlighting
  - Key-maps, init scripts, macros
  - Plugins
  - Both `vi` and `emacs` editors satisfy all the above requirements
##### ed commands
|  Action 	|  Command 	|
|---	|---	|
|  Show the Prompt 	|  `P` 	|
|  Command Format 	|  `[addr[,addr]]cmd[params]` 	|
|  Commands for location 	|  `2` `.` `$` `%` `+` `-` `,` `;` `/RE/`	|
|  Commands for editing  	|  `f` `p` `a` `c` `d` `i` `j` `s` `m` `u` 	|
|  Execute a Shell command 	|  `!command` 	|
|   edit a file	|  `e filename` 	|
|  read file contents into buffer 	|  `r filename` 	|
|  read command output into buffer 	|  `r !command` 	|
|  write buffer to filename 	|  `w filename` 	|
|  quit 	|  `q` 	|

##### Using `ed`
  - `man ed` doesn't give much info . Use `info ed`
  - `ed test.txt` shows a number indicating number of bytes read into memory
  - `1` displays the first line
  - `$` displays the last line
  - `,p` and `%p` shows the contents of the entire buffer
  - `2,3p` range - 2nd to 3rd line
  - `/hello/` matches and shows first occurance of the pattern
  - `+` and `-` to scroll by line
  - `;p` from current position to end of buffer
  - `.` displays the current line
  - `!date` running the date command within `ed`
  - `r !date` read output of date command to buffer at current position
  - `w` writes the file (saves it)
  - `d` delete current line
  - `a` to append after current line. Press `.` and `enter` when done
  - `s/appended/Appended/` Substitute - Search and replace from current line.
  - `f` shows the name of the file being edited
  - `p` shows the contents of the current line 
  - `j` for joining lines . Usage `5,6j` to join line 5 and 6
  - `m` to move a line to a particular position. Usage `m1` to move current line to just below line 1. `m0` to move it right to the top
  - `u` to undo previous change
  - To add something to every line `%s/\(.*\)/PREFIX \1/`
    - `\1` is the back substitution
    - `\(.*\)` indicates any character that can be matched
    - `PREFIX` is the replacement string
  - `3,5s/PREFIX/prefix/` substitutes prefix for PREFIX from line 3 to 5

##### Commands for editing in ed / ex 

|  Command 	|  Action 	|
|---	|---	|
|  **f** 	|   show name of **f**ile being edited	|
|  **p** 	|  **p**rint the current line 	|
|   **a**	|  **a**ppend at the current line 	|
|  **c** 	|  **c**hange the line 	|
|  **d** 	|  **d**elete the current line 	|
|  **i** 	|  **i**nsert line at the current position 	|
|   **j**	|  **j**oin lines 	|
|  **s** 	|  **s**earch for regex pattern 	|
|  **m** 	|  **m**ove current line to position 	|
|  **u** 	|  **u**ndo latest change 	|

##### Using nano
* [Link](Command_line_editors/nano.md)
##### Using vi
* [Link](Command_line_editors/vi.md)
##### Using emacs
* [Link](Command_line_editors/emacs.md)
---
#### Scripts 
* Software Tools Principles (Ref: Classic Shell Scripting – Arnold Robbins & Nelson H.F. Beebe)
  - Do one thing well
  - Process lines of text, not binary
  - Use regular expressions
  - Default to standard I/O
  - Don’t be chatty
  - Generate same output format accepted as input
  - Let someone else do the hard part
  - Detour to build specialized tools

```bash
#! interpreter
# comments
commands
loops
variables
case statements
functions
```
* program - shell , awk , sed , python , ruby , perl
* script
  - sourced
    - `. scriptname` `source scriptname`
    - PID same as the current shell commands are executed one after other shell environment continues
    - Used to prepare environment
  - executed
    - `./scriptname`
    - Needs execution permission
    - New process gets created to run script
    - PID is not same as the shell commands are executed one after other
    - New environment lost after return
    - Used to create a new functionality
* Script location
  - Use absolute path or relative path while executing the script
  - Keep the script in folder listed in $PATH
  - Watch out for the sequence of directories in $PATH
* bash environment
  - Login shell
    - ```
      /etc/profile
      ~/.bash_profile
      ~/.bash_login
      ~/.profile
      ```
  - Non-login shell
    - ```
      /etc/bash.bashrc
      ~/.bashrc
      ```
* Output from shell scripts
  - `echo`
    - simple
    - terminates with a newline if -n option not given
    - `echo My home is $HOME`
  - `printf`
    - supports format specifiers like in C
    - `printf “My home is %s\n” $HOME`
* Input to shell scripts
  - `read var`
    - string read from command line is stored in `$var`
* Shell Script arguments
  - `$0` name of the shell program
  - `$#` number of arguments passed
  - `$1` or `${1}` first argument
  - `${11}` eleventh argument
  - `$*` or `$@` all arguments at once
  - `“$*”` all argument as a single string
  - `“$@”` all argument as a separate strings
  - example : `./myscript.sh -l arg2 -v arg4`
* Command substitution
  - ```var=`command` ```
  - `var=$(command)`
    - command is executed and the output is substituted.
    - Here, the variable var will be assigned with that output.
* for do loop
  - ```
    for var in list
    do
      commands
    done
    ```
  - commands are executed once for each item in the list
  - space is the field delimiters
  - set IFS if required

* case statement
  - ```
    case var in
    pattern1)
      commands
      ;;
    pattern2)
      commands
      ;;
    esac
    ```
  - commands are executed each pattern matched for var in the options
* if loop
  - ```
    if condition
    then
      commands
    fi
    ```
  - ```
    if condition; then
      commands
    fi
    ```
  - commands are executed only if condition returns true
* Conditions
  - test expression
    - `test -e file`
  - `[ exprn ]`
    - `[ -e file ]`
  - `[[ exprn ]]`
    - `[[ $ver == 5.*]]`
  - `(( exprn ))`
    - `(( $v ** 2 > 10 ))`
  - command
    - `wc -l file`
  - pipeline
    - `who|grep “joy” > /dev/null`
  - For negation `! condition`
* String Comparison , Numeric, file comparison
  - expressions
    - unary
    - binary
* test numeric comparisons
  - Table
    |  Comparison | Description  |
    |---|---|
    |	`$n1 -eq $n2`	|	Check if n1 is equal to n2	|
    |	`$n1 -ge $n2`	|	Check if n1 is greater than or equal to n2	|
    |	`$n1 -gt $n2`	|	Check if n1 is greater than n2	|
    |	`$n1 -le $n2`	|	Check if n1 is less than or equal to n2	|
    |	`$n1 -lt $n2`	|	Check if n1 is less than n2	|
    |	`$n1 -ne $n2`	|	Check if n1 is not equal to n2	|
* test string comparisons
  - Table
    |  Comparison | Description  |
    |---|---|
    |	`$str1 = $str2`	|	Check if str1 is same as str2	|
    |	`$str1 != $str2`	|	Check if str1 is not same as str2	|
    |	`$str1 < $str2`	|	Check if str1 is less than str2	|
    |	`$str1 > $str2`	|	Check if str1 is greater than str2	|
    |	`-n $str2`	|	Check if str1 has length greater than zero	|
    |	`-z $str2`	|	Check if str1 has length of zero	|
* Unary file comparisons
  - Table
    |  Comparison | Description  |
    |---|---|
    |	`-e file`	|	Check if file exists	|
    |	`-d file`	|	Check if file exists and is a directory	|
    |	`-f file`	|	Check if file exists and is a file	|
    |	`-r file`	|	Check if file exists and is readable	|
    |	`-s file`	|	Check if file exists and is not empty	|
    |	`-w file`	|	Check if file exists and is writable	|
    |	`-x file`	|	Check if file exists and is executable	|
    |	`-O file`	|	Check if file exists and is owned by current user	|
    |	`-G file`	|	Check if file exists and default group is same as that of current user	|
* Binary file comparisons
  - Table
    |  Comparison | Description  |
    |---|---|
    |	`file1 -nt file2`	|	Check if file1 is newer than file2	|
    |	`file1 -ot file2`	|	Check if file1 is older than file2	|
* while do loop
  - ```
    while condition
    do
      commands
    done
    ```
  - commands are executed only if condition returns true
* until do loop
  - ```
    until condition
    do
      commands
    done
    ```
  - commands are executed only if condition returns false
* functions
  - definition
  - ```
    myfunc()
    {
      commands
    }
    ```
  - call
  - ```
    myfunc
    ```
  - `commands` are executed eachtime `myfunc` is called
  - Definitions must be before the calls
