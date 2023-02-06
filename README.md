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
|12.||7|Status Update Call|✅|


### Install Oracle Virtual Box with Ubuntu 22.04

1. Create a new directory **Opensourcetoolinstall** in D: Drive. Make sure there is atleast 150 GB disk space in the drive.
2. Go to [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
3. Under VirtualBox 7.0.6 platform packages, click on **Windows hosts** save the .exe file in **Opensourcetoolinstall** folder.
4. Install the VirtualBox.
5. Download **Ubuntu 22.04.1 LTS** from [https://ubuntu.com/download/desktop](https://ubuntu.com/download/desktop) and save the .exe file in **Opensourcetoolinstall** folder.

## Install Magic and SKY130 PDKs

## Install ALIGN Tool

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

```
$ pip install setuptools wheel pybind11 scikit-build cmake ninja
$ pip install -v -e .[test] --no-build-isolation
$ pip install -v --no-build-isolation -e . --no-deps --install-option='-DBUILD_TESTING=ON'
```
The second command doesn't just install ALIGN inplace, it also caches generated object files etc. under an `_skbuild` subdirectory. Re-running `pip install -v -e .[test] --no-build-isolation` will reuse this cache to perform an incremental build. We add the `-v` or `--verbose` flag to be able to see build flags in the terminal.

If you want the build-type to be Release (-O3), you can issue the following three lines:

```
$ pip install setuptools wheel pybind11 numpy scikit-build cmake ninja
$ pip install -v -e .[test] --no-build-isolation
$ pip install -v --no-build-isolation -e . --no-deps --install-option='--build-type=Release' --install-option='-DBUILD_TESTING=ON'
```
or
```
$ pip install setuptools wheel pybind11 numpy scikit-build cmake ninja
$ pip install -v -e .[test] --no-build-isolation
$ pip install -v --no-build-isolation -e . --no-deps --install-option='--build-type=RelWithDebInfo' --install-option='-DBUILD_TESTING=ON'
```
Use the Release mode if you are mostly developing in Python and don't need the C++ debugging symbols. Use the RelWithDebInfo if you need both debug symbols and optimized code.

To debug runtime issues, run:
```
python -m cProfile -o stats $ALIGN_HOME/bin/schematic2layout.py $ALIGN_HOME/examples/sc_dc_dc_converter
```

Then in a python shell:

```
import pstats
from pstats import SortKey
p = pstats.Stats('stats')
p.sort_stats(SortKey.TIME).print_stats(20)
```

To run tests similar to the checkin and merge-to-master CI runs run:

```
cd $ALIGN_HOME
# Checkin
pytest -vv
CI_LEVEL='checkin' pytest -n 4 -s -vv --runnightly --placer_sa_iterations 100 -- tests/integration/
# Merge to master
CI_LEVEL='merge' pytest -n 8 -s -vv --runnightly --maxerrors=20 --placer_sa_iterations 100 -- tests/integration/ tests/pdks
```

### Step 4: Run ALIGN
You may run the align tool using a simple command line tool named schematic2layout.py For most common cases, you will simply run:

```
$ schematic2layout.py <NETLIST_DIR> -p <PDK_DIR> -c
```

For instance, to build the layout for telescopic_ota:
```
$ mkdir work && cd work
$ schematic2layout.py ../examples/telescopic_ota -p ../pdks/FinFET14nm_Mock_PDK/
```
For a full list of options supported by the tool, please use the following command:
```
$ schematic2layout.py -h
```

## VSD Custom Layout
### CMOS Fabrication Process
#### 16 Mask Process
- Selecting a substrate

![image](https://user-images.githubusercontent.com/104830557/217040798-1edcf7ab-4772-4e3a-98ec-e859655e7679.png)

- Creating active region for transistors
- 
- 
### Introduction to Corner Stitching and Tech Files
### CMOS Layout - from tech files to SPICE simulations
### Euler's Path and Stick Diagram

