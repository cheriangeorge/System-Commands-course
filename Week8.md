### Week 8

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

#### Network & ssh
###### Accessing remote machines on command line
* IPv4 address range
  - Localhost
    - `127.0.0.0/8`
  - Private network
    - `Class A : 10.0.0.0/8` - 16,777,216
    - `Class B : 172.16.0.0/12` - 1,048,,576
    - `Class C : 192.168.0.0/16` - 65,536
  - Public network

* Ways to gain remote access
  - VPN access
  - ssh tunneling
  - Remote desktop : x2go, rdp, pcoip,
  - Desktop over browser: Apache Guacomole
  - Commercial, over internet : Teamviewer, AnyDesk,Zoho assist, ...

* Some important ports
| Port  | Service  | Description  |
|---|---|---|
|	`21`	|	`ftp`	|	File transfer	|
|	`22`	|	`ssh`	|	Secure Shell	|
|	`25`	|	`smtp`	|	Simple Mail Transfer Protocol	|
|	`80`	|	`http`	|	Hypertext Tranfer Protocol	|
|	`443`	|	`https`	|	Secure Hypertext Tranfer Protocol	|
|	`631`	|	`cups`	|	Common Unix Printing System	|
|	`3306 `	|	`mysql`	|	MySQL database	|

* Firewall
  - Ports open on my machine
  - Ports needed to be accessed on remote machine
  - Network routing over the port
  - Firewall controls at each hop

* Protecting a server
  - Server with a public service > Web Application Filter > Network Firewall > Anonymous users

* SELinux
  - Security Enhanced Linux mode available on Ubuntu too, apart from server grade flavors like CentOS, Fedora, RHEL, SuSE Linux etc.,
  - Additional layer of access control on files to services
  - Role Based Access Control
  - Process sandboxing, least privilege access for subjects
  - Check using `ls -lZ` and `ps -eZ`
  - RBAC items: user `(unconfined_u)`, role `(object_r)`, type `(user_home_t)`, level `(s0)`
  - Modes: `disabled`, `enforcing`, `permissive`
  - Tools: `semanage`, `restorecon`
  - SELinux is recommended for all publicly visible servers

* Network tools

| Tool  | Description  |
|---|---|
|	`ping`	|	To see if the remote machine is up	|
|	`traceroute`	|	Diagnostics the hop timings to the remote machine	|
|	`nslookup`	|	Ask for conversion of IP address to name	|
|	`dig`	|	DNS lookup utility	|
|	`netstat`	|	Print network connections	|
|	`mxtoolbox.com`	|	For help with accessibility from public network	|
|	`whois lookup`	|	Who owns which domain name	|
|	`nmap`	|	(careful !) Network port scanner	|
|	`wireshark`	|	(careful !) Network protocol analyzer	|

* High Performance Computing
  - Look at www.top500.org for statistics
  - Accessing a remote HPC machine is usually over SSH
  - Long duration jobs are submitted to a job scheduler for execution
  - Raw data if large needs to be processed remotely before being transferred to your machine (network charges? bandwidth?)
  - Comfort with command line is a must

---

#### Automating scripts
###### Scheduled, recurring, automatic execution of scripts
* `cron`
  - Service to run scripts automatically at scheduled times
  - Tools: `at`, `crontab`, `anacron`, `logrotate`
  - Script locations:
    - `/etc/crontab`  
    - `/etc/cron.d`
    - `/etc/cron.hourly`
    - `/etc/cron.daily`
    - `/etc/cron.weekly`
    - `/etc/cron.monthly`

Example of job definition:
.---------------- minute (0 - 59)
|  .------------- hour (0 - 23)
|  |  .---------- day of month (1 - 31)
|  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
|  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
|  |  |  |  |
*  *  *  *  * user-name command to be executed

* Job definition
  - `5 2 * * 1-5 root cd /home/scripts/backup && ./mkbackup.sh`
    - `5` minute (0-59)
    - `2` hour (0-23)
    - `*` day of the month (1-31)
    - `*` month (1-12) or jan, feb, ...
    - `1-5` day of week (0-6) or sun,mon, ...
    - `root` user-name
    - `cd /home/scripts/backup` command
  - The above command runs mkbackup.sh as root every working day at 02:05 AM
* Demonstration
  - The first time crontab is used you have to select the default editor
  - crontab is in `etc` directory
  - `anacron` is run by the System administrator
  - `cron.daily` is a folder in `etc` that displays daily tasks. Similarly `cron.hourly`,`cron.monthly`,`cron.weekly`
  - By placing a script in any of these directories you can make it run at the specified schedule
  - By running `crontab -e` you can execute a specific script at a time. Customize timely running of scripts.

* Startup scripts
  - Startup scripts: `/etc/init/`, `/etc/init.d/`
  - Runlevel scripts:

| Level  | Location  | Description  |
|---|---|---|
|	`0`	|	`/etc/rc0.d/`	|	Shutdown and power off	|
|	`1`	|	`/etc/rc1.d/`	|	Single user mode	|
|	`2`	|	`/etc/rc2.d/`	|	Non GUI multi-user mode w/o networking	|
|	`3`	|	`/etc/rc3.d/`	|	Non GUI multi-user mode with networking	|
|	`4`	|	`/etc/rc4.d/`	|	Non GUI multi-user mode for special purposes	|
|	`5`	|	`/etc/rc5.d/`	|	GUI multi-user mode with networking	|
|	`6`	|	`/etc/rc6.d/`	|	Shutdown and reboot	|

---

#### Managing Storage
###### LVM & RAID

* LVM
  - Logical Volume Management
  - Pooling multiple storage devices as a single logical volume
  - `lvm2 tools` : create and manage virtual block devices from physical devices
  - Suppose you need a very large partition but there is no HDD available of that size, you can define a logical volume that spans over multiple HDDs.
  - Logical Volumes are mounted by the GNU Linux OS, which are mapped over multiple physical disks.
* RAID
  - Redundant Arrays of Independent Disks
  - Distributing data over multiple discs for redundancy / speed / increased capacity
  - Raid Controller : software or hardware
* RAID modes
  - usable capacity < actual capacity

| RAID Mode  | Min drives  | Description  | Comments  |
|---|---|---|---|
|	RAID 0	|	2	|	Striping	|	Speed up	|
|	RAID 1	|	2	|	Mirroring	|	Read is n times faster, n-1 drive failures tolerated	|
|	RAID 5	|	3	|	Block-level striping with distributed parity	|	1 drive failure tolerated, Read is n times faster, write is n-1 times faster	|
|	RAID 6	|	4	|	Block-level striping with dual distributed parity	|	2 drive failures tolerated, read is n times faster, write is n-2 times faster	|

* Explanation
  - RAID 0 - You are using 2 disks as 1. Half of one file is stored on 2 disks. Doubles speed of access of a file. Write Speed is 2x and Read Speed is 2x for 2 disks.
  - RAID 1 - Any piece of the file is written to both the disks. Reading is 2x but writing is n-1. People tend to use RAID 1 for OS alone.
  - RAID 5 - When you have more than 3 disks. Data is written to more than ne disk. If one fails nothing is lost.
  - RAID 6 - Parity over 2 disks. If 2 disks fail you still have all your data.
  - Most of the hardware supprts hot-swap. 
  - Useable capacity is less than the actual capacity
  - For storage people use RAID 5 or RAID 6.
* Demo
  - `df -h` to check system storage
