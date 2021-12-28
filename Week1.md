# Terminal Emulators 
* Terminal
* Konsole
* xterm
* guake
# Command Prompt
* username@hostname:~$ 
  - ~$ is the path
# Commands and Flags
* ### uname -a 
  - prints the name, version and other details about the current machine and the operating system running on it
  - the -a displays hidden files that have a dot in front of them 
* ### pwd 
  - Present Working Directory 
* ### ls 
  - a : all . displays hidden files 
  - l : use a long listing format
  - i : print index number of each file (inode)
* ### rm 
  - remove a file 
* ### mv
  - move , rename 
* ### ps 
  - currently running processes
* ### clear
  - or ctrl+l
* ### exit 
  - or ctrl+d
* ### man
  - get help on any command in linux. eg : man ls
  - man sections (1 to 9) eg : man 1 ls
  - 1 - Executable programs or shell commands
  - 2 - System calls provided by Kernel
  - 3 - Library calls
  - 4 - Special files usually found in /dev
  - 5 - File formats and conversions
  - 6 - Games
  - 7 - Misc : macro packages and conventions
  - 8 - System admin commands
  - 9 - Kernel routines
* cd
  - change directory eg cd .. - goes to parent directory
  - cd without any arguments will take you to the home directory
  - cd / takes you to the root folder
# Permissions and File types 
* drwxrwxrwx or lr-x--x--x (l indicates symbolic link and d indicates directory)
# Linux Virtual Machine 
* ### ISO 
  - image of Linux OS (Ubuntu 20.04 LTS for x86_64 platform)
* ### Hypervisor 
  - (eg: Oracle VirtualBox or VMWare Workstation Player)
# Command Line Environments
* Cloud - replit and cocalc
* Phone - Termux by Fredrick Fornwall

# File System of Linux OS
* Filesystem Hirearchy Standard FHS 3.0 (June 03, 2015) (refspecs.linuxfoundation.org/fhs.shtml)
* / is root directory and field separator or delimiter for sub-directories
* . references the current directory (. is a special file in every directory)
* .. references the parent directory (.. is a special file in every directory)
* Path for traversal can be absolute or relative
* boot directory is where the kernel is located
* /usr/bin contains commands that we will use
* /bin - essential command binaries
* /boot static files of the bootloader
* /dev device files (different character in long format of file listing 'c' instead of 'l' or 'd'. 'c' indicates character file - means you can read from it character by character. if first character is 'b' they are block devices typically hdds - the block devices are made available as files.)
* /etc Host specific system configuration (.conf files)
* /lib Essential shared libraries and kernel modules (Typically contain files with version number at the end)
* /media mount points for removable devices 
* /mnt mount points 
* /opt add on application software packages
* /run Data relevant to running processes
* /sbin essential system binaries
* /srv data for services
* /tmp temporary files (normally flushed when system is rebooted)
* /usr secondary hierarchy
  - /usr/bin : user commands
  - /usr/lib : libraries
  - /usr/local : local hierarchy
  - /usr/sbin : non vital system binaries
  - /usr/share : architecture dependent data 
  - /usr/include : header files included by c programs
  - /usr/src : source code
* /var variable data (/var/log contains logs for various services)
  - /var/cache : Application cache data
  - /var/lib : Variable state informtion
  - /var/local : variable data for /usr/local
  - /var/lock : lock files
  - /var/log : log files and directories 
  - /var/run : data relevant to running processes
  - /var/tmp : temporary files preserved between reboots


|          |    Shareable  |  Unsharable |
|----------|:-------------:|------:|
| static   |  /usr and /opt | /etc and /boot |
| variable |    /var/mail   |   /var/run and /var/lock |
