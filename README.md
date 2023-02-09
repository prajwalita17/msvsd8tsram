# msvsd8tsram
| S. No.    | Week|Day|Action Item|Status| 
|----------|-----|--------|-------|-----------------------|
|1.|0|1|Install Oracle virtual box with Ubuntu 20.04|✅|
|2.||2|Install Magic, ngspice and SKY130 PDKs|✅|
|3.||2|Install ALIGN tool|✅|
|4.||3|Create inverter and perform pre-layout using xschem or ngspice|✅|
|5.||3|Inverter Post-layout characterization using 2)|✅|
|6.||4|Inverter post-layout characterization using 3) |✅|
|7.||4|Compare the results obtained in 5) and 6) |✅|
|8.||5|Enroll in FREE VSD-custom layout course |✅|
|9.||6|Create the design shown in section 7 of the course and perform pre-layout using xschem or ngspice|✅|
|10.||6|Post layout characterization using 2) and 3)|✅|
|11.||6|Update your findings on your GitHub repo with the title “Week 0”|✅|

### Install Oracle Virtual Box with Ubuntu 22.04

1. Create a new directory **Opensourcetoolinstall** in D: Drive. Make sure there is atleast 150 GB disk space in the drive.
2. Go to [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
3. Under VirtualBox 7.0.6 platform packages, click on **Windows hosts** save the .exe file in **Opensourcetoolinstall** folder.
4. Install the VirtualBox.
5. Download **Ubuntu 22.04.1 LTS** from [https://ubuntu.com/download/desktop](https://ubuntu.com/download/desktop) and save the .exe file in **Opensourcetoolinstall** folder.

## Install Magic and SKY130 PDKs
### Magic
Magic is an open-source VLSI layout tool.
Install magic and its dependencies using the following commands. The dependencies can also be installed using Synaptic Manager. Synaptic manager can be first installed using `sudo apt install synaptic`.

```
# Ipdate your system
    $sudo apt update
    $sudo apt install -y git
# Install build-essential tools
    $sudo apt install -y build-essential
# Install csh
    $sudo apt install -y csh
# Install x11
    $sudo apt install -y x11-apps
# Install X11
    $sudo apt install -y x11-xserver-utils
# Install OpenGL
    $sudo apt install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev
# Cnstall Tcl/Tk
    $sudo apt install -y tcl-dev tk-dev
# Change to the work directory
    $cd ~/VSD_8TSRAM
# Clone the git repo
    $git clone git://opencircuitdesign.com/magic
# Change into the magic directory
    $cd magic
# Configure magic
    $./configure
# Build magic
    $make
# Install magic
    $sudo make install
```
### Ngspice
Ngspice is the open source spice simulator for electric and electronic circuits. 
Download ngspice-39 tarball `ngspice-39.tar.gz`from [https://ngspice.sourceforge.io/download.html](https://ngspice.sourceforge.io/download.html) into the work directory. Install nNgspice and all its dependicies using the following commands. 
```
# Home directory
    $cd ~/VSD_8TSRAM
    $tar -xzvf ngspice-39.tar.gz
    $mkdir release
    $cd release 
# Update the system
    $sudo apt-get update
# Install Xaw library
    $sudo apt-get -y install libxaw7-dev
# Install xterm
    $sudo apt-get -y install xterm
# Install bison
    $sudo apt-get -y install bison
# Install flex
    $sudo apt-get -y install flex
# Install readlines library
    $sudo apt-get -y install libreadlines6-dev
# Run configuration
    $../configure  --with-x --with-readline=yes --disable-debug
# Build
    $make 
# Install 
    $sudo make install
```
# NETGEN
```
# Home directory
cd ~/VSD_8TSRAM

# Install GNU m4
sudo apt-get install -y m4

# Clone the repository
git clone git://opencircuitdesign.com/netgen

cd netgen

# Configure the package
./configure

# Compile the package
make

# Install the package
sudo make install
```
# XSCHEM
```
# Home directory
cd ~/work

# Update the system
sudo apt-get update 

# Install flex and bison
sudo apt-get install -y flex bison

# Install libjpeg-dev 
# sudo apt-get -y install libjpeg-dev

# Install xcb
# sudo apt-get -y install xcb

# Clone the repository
git clone https://github.com/StefanSchippers/xschem.git xschem-src

cd xschem-src

# Configure the installation
./configure

# Compile the source
make

# Install the software
sudo make install
```

# OPEN_PDKs
```
# Home directory
cd ~/VSD_8TSRAM

# Install setup-tools
sudo apt-get -y install python3-setuptools


# Clone the Open PDK repository
if [ -d ~/work/open_pdks]
then
    echo "Already cloned!"
else 
    git clone git://opencircuitdesign.com/open_pdks
fi

cd open_pdks

# Configure Open PDK to use Sky130 libraries
./configure --enable-sky130-pdk

# Compile the PDK
make 

# Install the PDK
sudo make install
```
## Install ALIGN Tool

```
# Home directory
cd ~/work

# Clone the ALIGN source
git clone https://github.com/ALIGN-analoglayout/ALIGN-public
cd ALIGN-public

# Install virtual environment for python
sudo apt -y install python3.8-venv

# Install the latest pip
sudo apt-get -y install python3-pip

# Create python virtual envronment
python3 -m venv general

source general/bin/activate

python3 -m pip install pip --upgrade
pip install align
pip install pandas
pip install scipy
pip install nltk
pip install gensim
pip install setuptools wheel pybind11 scikit-build cmake ninja

# Install ALIGN as a user
pip install -v .

# Install ALIGN  as a developer
pip install -e .

pip install -v -e .[test] --no-build-isolation
pip install -v --no-build-isolation -e . --no-deps --install-option='-DBUILD_TESTING=ON'

# Clone the Sky130 PDK
cd ~/Work/ALIGN-public

git clone https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130

chmod +x 5_setup_openpdk.sh

./5_setup_align.sh
To, then, run the ALIGN tool, cd into ALIGN-public and do:

source general/bin/activate

schematic2layout.py <NETLIST_DIR> -p <PDK_DIR> -c
To test an example design named inverter_v1, cd into work folder within ALIGN-public directory and do:

schematic2layout.py ../examples/inverter_v1/ -p ../pdks/FinFET14nm_Mock_PDK/
6.1 ALIGN-SKY130 PDK
To install the Sky130 PDK that is compatible with ALIGN tool, clone the following repo inside ALIGN-public/pdk folder.

git clone https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130
And, then use one of the examples to test the setup with:

schematic2layout.py ../pdks/ALIGN-pdk-sky130/examples/telescopic_ota/ -p ../pdks/ALIGN-pdk-sky130/SKY

```


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
- **Selecting a substrate**

![image](https://user-images.githubusercontent.com/104830557/217040798-1edcf7ab-4772-4e3a-98ec-e859655e7679.png)

- **Creating active region for transistors**
![image](https://user-images.githubusercontent.com/104830557/217042471-e4c84cea-92c5-4341-9543-105622e191f4.png)

![image](https://user-images.githubusercontent.com/104830557/217043083-d4834741-415c-4ef2-bd8b-817909305fde.png)


- 
- 
### Introduction to Corner Stitching and Tech Files
### CMOS Layout - from tech files to SPICE simulations
### Euler's Path and Stick Diagram
```
# Home directory
cd ~/work

# Install setup-tools
sudo apt-get -y install python3-setuptools


# Clone the Open PDK repository
if [ -d ~/work/open_pdks]
then
    echo "Already cloned!"
else 
    git clone git://opencircuitdesign.com/open_pdks
fi

cd open_pdks

# Configure Open PDK to use Sky130 libraries
./configure --enable-sky130-pdk

# Compile the PDK
make 

# Install the PDK
sudo make install
```
