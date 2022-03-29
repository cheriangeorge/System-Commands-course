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
