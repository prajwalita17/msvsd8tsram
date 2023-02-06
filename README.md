# msvsd8tsram
| S. No.    | Week|Day|Action Item|Status| 
|----------|-----|--------|-------|-----------------------|
|1.|0|1|Install Oracle virtual box with Ubuntu 20.04|✅|
|2.||2|Install magic and SKY130 PDKs|✅|
|3.||2|Install ALIGN tool|✅|
|4.||3|Create inverter and perform pre-layout using xschem or ngspice|✅|
|5.||3|Inverter Post-layout characterization using 2)|✅|
|6.||4|Inverter post-layout characterization using 3) |✅|
|7.||4|Compare 5 and 6 |✅|
|8.||5|Enroll in FREE VSD-custom layout course |✅|
|9.||6|Create the design shown in section 7 of the course and perform pre-layout using xschem or ngspice|✅|
|10.||6|Post layout characterization using 2) and 3)|✅|
|11.||6|Update your findings on your GitHub repo with the title “Week 0”|✅|


### Install Oracle Virtual Box

1. Create a new directory **Opensourcetoolinstall** in D: Drive. Make sure there is atleast 150 GB disk space in the drive.
2. Go to [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
3. Under VirtualBox 7.0.6 platform packages, click on **Windows hosts** save the .exe file in **Opensourcetoolinstall** folder.
4. Install the VirtualBox.
5. Download **Ubuntu 22.04.1 LTS** from [https://ubuntu.com/download/desktop](https://ubuntu.com/download/desktop) and save the .exe file in **Opensourcetoolinstall** folder.


### Step 0: Check prerequisites
The following dependencies must be met by your system:

gcc >= 6.1.0 (For C++14 support)
python >= 3.7 (For PEP 560 support) 
You may optionally install Boost & lp_solve using your distro package manager (apt, yum etc) to save some compilation time.
Note: In case you have multiple gcc versions installed on your system, we recommend explicitly setting the compiler paths as follows:

```
$ export CC=/path/to/your/gcc
$ export CXX=/path/to/your/g++
```

### Step 1: Clone the ALIGN source code to your local environment
```
$ git clone https://github.com/ALIGN-analoglayout/ALIGN-public
$ cd ALIGN-public
```

### Step 2: Create a Python virtualenv

Note: You may choose to skip this step if you are doing a system-wide install for multiple users. Please DO NOT skip this step if you are installing for personal use and/or you are a developer.

```
$ python -m venv general
$ source general/bin/activate
$ python -m pip install pip --upgrade
```
### Step 3a: Install ALIGN as a USER
If you already have a working installation of Python 3.8 or above, the easiest way to install ALIGN is:
```
$ pip install -v .
```

### Step 3b: Install ALIGN as a DEVELOPER
If you are a developer, you may wish to install align with some additional flags.

For python developers:

```
$ pip install -e .[test]
```

The -e or --editable flag generates links to the align package within your current directory. This allows you to modify python files and test them out immediately. You will still need to re-run this command to build your C++ collateral (when you are changing branches for example).
