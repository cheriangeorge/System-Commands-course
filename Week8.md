### Week 8

#### Important Utilities

* `find` – locating files and processing them
* `tar`, `gzip` etc – packaging collections of files
* `make` – conditional actions

##### find
* `find [pathnames] [conditions]`


| Condition  | Description  |
|---|---|
|	`-name`	|	pattern to match filenames	|
|	`-type`	|	File type code eg., c for character file, d for directory, l for symbolic	link etc.,|
|	`-atime`	|	Files accessed +n (more than n), -n (less than n) days ago	|
|	`-ctime`	|	File changed +n (more than n), -n (less than n) days ago	|
|	`-regex`	|	Regular expression for pattern of filenames. Combine with -regextype posix-basic, posix-egrep etc.,	|
|	`-exec`	|	Command to run using { } as place holder for filename	|
|	`-print`	|	Print the full path name of matching files	|

##### file packaging

* Deep file hierarchies
* Large number of tiny files
* `tar` : collect a file hierarchy into a single file
* `gzip` : compress a file
* Applications: backup, file sharing, reduce disc
utilization

##### Possibilities

* `tar`, `zip`
* compress (ncompress), gzip (ncompress), bzip2 (bzip2), xz (xz-utils), 7z (p7zip-full)
* Tarballs like bundle.tgz for package + compress
* Time & memory required to shrink / expand versus size ratio
* Portability
* Unique names using timestamp, process ID etc., for backup tarballs

##### make

* `make -f make.file`
```
# comments
TMP_FILES = *.o *.aux
.PHONY : clean
target : prerequisites
recipe $(OPTION_NAME)
clean:
rm -f $(TMP_FILES)
```
---
#### Knowing your hardware

###### Hardware items
* CPU
* Storage & Partitions
* Graphics Card
* Memory Modules
* Battery & status
* Network devices & configuration

###### Packages to install

* `clinfo`
* `coreutils`
* `dmidecode`
* `fdisk`
* `hardinfo`
* `hdparm`
* `hwinfo`
* `lshw`
* `memtester`
* `net-tools`
* `pciutils`
* `procps`
* `sysstat`
* `upower`
* `util-linux`

---
#### Prompt strings

* Context for prompt strings
  - `bash`,`dash`, `zsh`, `ksh`, `csh`
  - `python`
  - `octave`
  - `gnuplot`
  - `sage`

* bash prompts
  - PS1 : primary prompt string : `$`
  - PS2 : secondary prompt for multi-line input : `>`
  - PS3 : prompt string in select loops : `#?`
  - PS4 : prompt srting for execution trace : `+`

* Escape sequences

| -  | Description  |
|---|---|
|	`\A`	|	Current time in 24-hour as hh:mm	|
|	`\u`	|	Current user’s username	|
|	`\d`	|	Date in “weekday month day” format	|
|	`\w`	|	Current directory	|
|	`\h`	|	Hostname upto first period	|
|	`\W`	|	Basename of current directory	|
|	`\H`	|	Complete hostname	|
|	`\#`	|	Current command number	|
|	`\s`	|	Name of the shell	|
|	`\$`	|	If uid is 0, # else $	|
|	`\t`	|	Current time in 24-hour as hh:mm:ss	|
|	`\@`	|	Current time in 12-hour a.m/p.m	|
|	`\T`	|	Current time in 12-hour as hh:mm:ss	|
|	`\\`	|	A literal \ character	|

`\u@\h:\w\$`

* Python command line
  - ps1 and ps2 are defined in the module sys
  - Change `sys.ps1` and `sys.ps2` if needed
  - Override `__str__` method to have dynamic prompt

---
