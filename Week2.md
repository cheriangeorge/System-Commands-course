## Week 2 Notes

* Multiple uses of / is as good as one
  - ie : `cd usr//////bin` will take you to `usr/bin`
* The root folder / is its own parent
  - ie : if you do `cd ..` within the root directory you stay in the same directory.
* Options / Flags can be written in multiple combinations
  - `ls -l level1 -di`
  - `ls -d level1 -il`
  - `ls level1 -ldi`
  - `ls -ldi level1`
 * long formats for options are also available
  - `ls -a` is equivalent to `ls --all`


### Commands
* `ls`
  - R flag lists all subdirectories recursively 
  - Passing directory name to ls shows what is within that directory. ie : ls -l level1 
  - d flag displays details of a folder without traversing inside it. it : ls -ld level1 
  - 
* `ll`
  - a shortcut for the ls -la command
* `which`
  - which *command* will show the location of the command
  - `which less` will show usr/bin/less
* `whatis`
  - gives a brief description of the command
* `alias` 
  - give a nickname to a frequently used command
  - usage : `alias ll = 'ls -l'`
  - Just typing alias will show a list of aliases
* `unalias` 
  - used to remove an alias
* `rmdir`
  - removes an empty directory

### Commands to know contents of a text file

* `less`
  - displays the content in one screen
  - ls -l /usr/bin/less shows that the command takes 180KB
* `wc`
  - prints newline,word and byte counts for the file
  - the -l flag shows just the number of lines
* `head`
  - head profile displays the first ten lines
  - use -n flag to specify the number of lines
* `tail`
  - tail profile displays the last ten lines
  - use -n flag to specify number of lines to be displayed
* `cat`
  - in /etc , cat profile would just dump contents on the screen without any further prompts.
  - disadvantages : cant move back and forth to view page by page, can't come out half way through.
  - if the file is very long cat is not the best way to look at the content.
* `more`
  - similar to less. Allows page by page viewing
  - ls -l /usr/bin/more shows that the command takes 43KB

### Knowing more commands
* `man`
* `which`
* `apropos`
  - For a keyword it shows you all the commands which have that keyword in the description
  - Used to discover new commands
  - If you type `ls -l /usr/bin/apropos` you see that it is a symbolic link to whatis, but the outputs are different : Why?
  - Reason : In Linux every executable will know in what name it has been invoked - can have different behaviour depending on the name that invoked it.
  - It also has the same output as `man -k` : Searching for a keyword
* `info`
  - Allows browsing through commands using the cursor 
  - Can go back using *<* or 'shift'+','
* `whatis`
* `help`
  - displays keywords reserved for the shell being run
* `type`
  - displays what type of command it is 
  - type type shows that it is a 'shell built in' being offered from the shell and not the os
  - type ls shows that it is aliased with some option. which ls shows that it is coming from os because there is an executable available.
 ### Multiple Arguments
 * ##### Recap : Arguments and Options
  - Options are enhanced features of the command
  - Arguments are specific names of files or directories 
 * Second arrument behaviour and interpratation of last argument should be seen in the man pages
 * Recursion is assumed for `mv` and not `cp`
  - recursion is assumed for some commands and should be explicitly stated in others
  - For copy command recurssion is not assumed
  - `cp dir1 dir2` need not work. dir1 has 2 files in it.
  - `cp -r dir1 dir2` works - recurssion is specified explicitly.
  - `mv dir1 dir3` works - it just renames the directory.
 * `touch file1 file2 file3` creates all 3 files in one go with identical timestamp.
 
 ### Links (Hard Links and Soft Links)
* Can determine whether a link is HL or SL by looking at the Inode numbers
* `ln -s source destination` to create symbolic link. `ln -s file1 file2`
  - file2 is a separate inode entry but it is just a shortcut to file1
  - file2 has only 1 hardlink.
* `ln source destionation` to create a hard link . `ln file1 file3`
  - file1 and file 3 have the same inode number - They are basically the same file.
  - file1 and file3 have 2 hard links when we do `ls -li`

### File Sizes 
* `ls -s`
  - file size appears in the first column
* `stat`
  - in `/usr/bin` we look at `stat znew`
  - Gives information about the size, how many blocks are being occupied
  - Here the size is little more than 4kb
  - `stat zmore` shows that it takes less than one block
* `du`
  - in `/usr/bin` we look at `du znew` or `du -h znew`
  - Gives information about the size
  - Here the size is displayed as 8.0KB since there is a block overflow.
  - This means that files that are smaller than the block size will actually take up a whole block
  - `du -h zmore` shows that it occupies one block - around 4.0K
* Role of block size
  - explained in stat and du

### In-Memory File Systems
* `/proc`
  - Is an older system 
  - `ls -l` will display several zero-size files, even though we can read content from them.
  - These are only a representation and not real files on the HDD.
  - `less cpuinfo` - information about the cpu
  - `cat version` - information about the OS. Also accessible using `uname -a`
  - `cat meminfo` - information about the memory - also `free -h`
  - `cat partitions` - information about the partitions - also `df -h` 
  - The `kcore` file appears to take huge space - Shows maximum virtual memory that the current linux os is able to handle. 2^47 or 140 TB
* `/sys`
  - Used from Kernel v2.6 onwards, however information about various processes that are running are still stored in the /proc directory itself.
  - Much more well organised than /proc
  - eg : `sys/bus/usb/devices/1-1` points to a specific usb device. 
* These are directories that are visible in the root folder. They are not on the disk but only in the memory.
* Important system information can be viewed from these directories in a read-only manner.

### Shell Variables 
* Makes it possible to communicate between 2 processes very efficiently. Need not write and read the filesystem.
* Security Concern : Some information that you write to the filesystem may be visible to other processes.
* Shell variables are available only within the shell or its child processes.
* `echo` prints strings to screen
  - uses space as a delimiter so multiple spaces between words are ignored. For multiple spaces, enclose the string in quotes.
  - can print a multi-line string by using double quotes and not closing it
* `echo $HOME` prints values of variables
  - By convention every shell variable starts with a Dollar
* **Commonly used shell variables**
  - `$USERNAME`
  - `$HOME`
  - `$HOSTNAME`
  - `$PWD`
  - `$PATH` - variable contains a list of directories which will be searched when you type a command
* Commands like `printenv` , `env` , `set` to see variables that are already defined
* **Special Shell Variables**
  - `$0` : name of the shell
  - `$$` : process ID of the shell
  - `$?` : return code of previously run program
  - `$-` : flags set in the bash shell
* **Process Control** `echo $$`
  - use of `&` to run a job in the background
  - `fg` - bring process to foreground
  - `coproc` - run a command while also being able to use the shell
  - `jobs` - list programs running in the background
  - `top` - See programs that are hogging the CPU or memory (refreshed every second)
  - `kill` - kill process owned by you 
* **Program Exit Codes** `echo $?` 
  - exit code always has a value between *0 and 255*
  - 0 : Success
  - 1 : Failure
  - 2 : Misuse
  - 126 : command cannot be executed
  - 127 : command not found
  - 130 : processes killed using control+c
  - 137 : processes killed using `kill -9 <pid>`
  - If the exit code is more than 256 then the exitcode%256 will be reported as the exit code
* **Flags set in bash** `echo $-`
  - h : locate hash commands
  - B : braceexpansion enabled
  - i : interactive mode
  - m : job control enabled (can be taken to bg or fg)
  - H : !style history substitution enabled
  - s : commands are read from stdin
  - c : commands are read from arguments
