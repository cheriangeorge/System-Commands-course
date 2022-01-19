### Week 4 Notes

#### Software Management
* Using Package Management Systems 
  - Tools for installing, updating, removing and managing software
  - Install new / updated software across network
  - Package - File look up, both ways 
    - Which files are given by a particular package and which package contains a given file
  - Database of packages on the system including versions (compatibility and requirements)
  - Dependency checking
  - Signature verification tools (to check authenticity of source of the software)
  - Tools for building packages (to build packages from soure code - particularly true for kernel modules)

* Package types 
  - Package
    - RPM
      - Red Hat
        - CentOS
        - Fedora
        - Oracle Linux
      - SUSE Enterprise Linux
        - OpenSUSE
    - DEB
      - Debian
        - Ubuntu
          - Mint
        - Knoppix
* Commands
  - `lsb_release -a` to find version of Operating System
  - When searching for packages for this version of the OS you can search by OS code name eg: `focal`
* Architectures
  - amd64 | x86_64
  - i386 | x86
  - arm (RISC5 Sakthi)
  - ppc64el | OpenPOWER
  - all | noarch |src (not tied to any architecture)
* Commands
  - `uname -a` gives the kernel version and the type of architecture.
* Tools 
	- Package Type
		- RPM
			- Yellowdog Updater Modifier (yum)
				- Red Hat Package Manager (rpm)
				- Dandified YUM (dnf)
		- DEB
			-  synaptic (GUI)	
			-  aptitude (Command Line)
				- Advanced Package Tool (apt)
					- dpkg
						- dpkg-deb
* Package managemet in Ubuntu using `apt`
	- Inquiring package db
		- Search packages for a keyword
			- `apt-cache search keyword`
		- List all packages
			- `apt-cache pkgnames`
			- `apt-cache pkgnames | sort | less` for page by page sorted display
			- `apt-cache pkgnames nm` for all packages starting with nm
		- Display package records of a package
			- `apt-cache show -a package`

* Package Names
	- Package
		- RPM
			- package-version-release.architecture.rpm
		- DEB
			- package_version-revision_architecture.deb
			- eg : `pool/universe/n/nmap/nmap_7.80+dfsg1-2build1_amd64.deb`
* Package Priorities
	- required : essential to proper functioning of the system
	- important : provides functionality that enables the system to run well
	- standard : included in a standard system installation
	- optional : can omit if you do not have enough storage
	- extra : could conflict with packages with higher priority, has specialized requirements, install only if needed.
	- Priority is displayed as `extra` in the output of `apt-cache show nmap` or `apt-cache show wget` for example.
* Package Sections
	- [Package Sections for Ubuntu focal](https://packages.ubuntu.com/focal/)
	- `apt-cache show fortunes` shows `Section : universe/games`
* Checksums
	- For a small change in the original file the checksum is very different. This is useful to chack if the original file has been tampered or not. 
	- Can be used to verify that nothing has gone wrong to the contents of the file while downloading. 
	- md5sum 
		- 128 bit string
		- `md5sum filename`
	- SHA1
		- 160 bit string
		- `sha1sum filename`
	- SHA256
		- 256 bit string
		- `sha256sum filename`

___
4.2
* Who can install packages in Linux OS ?
	- administrators
	- sudoers in the case of Ubuntu
	- Only sudoers can install/upgrade/remove packages
	- a sudo command can be executed by those who are listed in `/etc/sudoers`
	- Command `sudo cat /etc/sudoers` . If the current `$USER` is not in the sudoers file the incident will be reported.
	- In the file the users listed under `# User privilege specification` have sudo permission.
	- sudo attempts and authentication failures get recorded in `/var/log/auth.log`. View using `sudo tail -n 100 /var/log/auth.log`
* When installing a package the system knows the website/server from which the packages have to be downloaded
	- This information is stored in the folder `/etc/apt`
	- Uncommented lines in the file `sources.list` have the debian/ubuntu sources 
	- A directory `sources.list.d` stores sources for third party software. Allows `apt update` to know new versions to download from repositories stored in these files
	- `sudo apt-get update` fetches updates and keeps them in cache
	- `sudo apt-get upgrade` upgrades the packages. It lists how many updates are going to be affected and how much data is going to be downloaded.
	- 
