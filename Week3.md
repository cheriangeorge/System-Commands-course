## Week 3 Notes

### Combining Commands and Files
* Executing Multiple Commands
  - `command1; command2; command3;`
    - Each command will be executed one after the other.
  - `command1 && command2`
    - command2 will be executed only if command 1 succeeds
    - If the return code is 0 it is true and if it is greater than 0 it is false
    - `ls && date -Q && wc -l /etc/profile` will display the dir listing followed by error that -Q is invalid; wc is not executed.
  - `command1 || command2`
    - command2 will not be executed if command1 succeeds
    - `ls /blah || date` will display current date after "No such file or directory"
    - `ls || date` will display just the directory listing
    - command2 is like a Plan B if command1 doesn't succeed.
  - Example `ls /blah ; date ; wc -l /etc/profile ;`
  - If we use parenthesis ie `(ls /blah ; date ; wc -l /etc/profile ;)` the command gets executed in a subshell and is returned back to the shell we are using.
  - We can use `echo $BASH_SUBSHELL` to return an integer which tells us at what level of execution we are.
    - `(echo $BASH_SUBSHELL)` will report a value of 1 
    - `(ls; (date; echo $BASH_SUBSHELL))` will report a value of 2
  - Launching too many subshells could be expensive computationally.
* File Descriptors
  - Every command in linux has 3 file descriptors - `stdin` (0) , `stdout` (1), `stderr` (2).
    - `stdin` is a pointer to a stream that is coming from the keyboard or use input
    - `stdout` or `stderr` usually points to the screen where the display or output is made.
    - the three pointers are looking at only the stream of characters.
    - they can be directed to a file or a command, or the default behaviour can be left as it is.
  - Combining a command and a file
    - `command > file1` 
      - `stdout` is redirected to `file1`
      - `file1` will be created if it does not exist
      - if `file1` exists, its contents will be overwritten
      - example : `ls -1 /usr/bin > file1` - displays no output on the screen because there is no error
      - `ls -1 /blah > file1` - displays an error. file1 is overwritten and is now 0 Bytes.
      - `hwinfo > hwinfo.txt`
      - trying this command in a folder where there is no w permissions will generate an error
      - The `cat` command tries to read from the provided file name if not given it tries to read from stdin (keyboard)
        - `cat > file1` will allow you to type content. The feature could be used to create text files on the command line. You can come out using the `Ctrl`+`D` option.
        - `cat file1` displays the content of `file1`
        - `cat` takes input from the keyboard and displays it on the screen (line by line; when you press enter) - Finish by pressing `Ctrl`+`D` to signify end of file.
    - `command >> file1` 
      - contents will be appended to file1
      - new file1 will be created if it does not exist.
      - Example : `date >> file2 ; wc -l /etc/profile >> file2 ; file /usr/bin/znew >> file2 ;`
      - `cat >> file1` to append text to a file from command line. Come out using `Ctrl` + `D`
