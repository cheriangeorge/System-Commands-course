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
