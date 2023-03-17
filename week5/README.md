WEEK 5

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/generators/async_updown_counter_gen$ make
==============================================================
   ___  _____ ______ _   _ _____  _     ____   ___   ____
  / _ \|  _  \| ____| \ | |  ___|/ \   / ___| / _ \ / ___|
 | | | | |_) ||  _| |  \| | |_  / _ \  \___ \| | | | |    
 | |_| |  __/ | |___| |\  |  _|/ ___ \  ___) | |_| | |___ 
  \___/|_|    |_____|_| \_|_| /_/   \_\|____/ \___/ \____|
===============================================================
OpenFASOC is focused on open source automated analog generation
from user specification to GDSII with fully open-sourced tools.
This project is led by a team of researchers at the University of Michigan and is inspired from FASOC
For more info, visit https://fasoc.engin.umich.edu/
IP: Temperature Sensor 
Supported Technology: Sky130A 
Supported Library: sky130hd
Targets supported:
1. make sky130hd_temp_verilog
    >> This will create the verilog file for the thermal sensor IP. It doesn't create a macro, won't create lef/def/gds files and won't run simulations 
2. make sky130hd_temp [ninv=<num>] [nhead=<num>]
    >> This will create the macro for the thermal sensor, creates the lef/def/gds/spice netlist files and performs lvs/drc checks. But this won't run simulations.
3. make sky130hd_temp_full [ninv=<num>] [nhead=<num>] [sim=pex]
    >> This will create the macro for the thermal sensor, creates the lef/def/gds/spice netlist files, performs lvs/drc checks and also runs simulations.
    >> Note: Only Pre-PEX simulations are performed, by default, under this target. To perform Post-PEX simulations as well, set sim to 'pex' as shown in the target definition
4. make clean
    >> This will clean all files generated during the run inside the run/, flow/ and work/ directories
5. make help
    >> Displays this message
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/generators/async_updown_counter_gen$ make sky130hd_temp ninv=6 nhead=3
#----------------------------------------------------------------------
# Parsing command line arguments...
#----------------------------------------------------------------------
['tools/temp-sense-gen.py', '--specfile', 'test.json', '--outputDir', './work', '--ninv', '6', '--nhead', '3', '--prepex', '--platform', 'sky130hd', '--mode', 'macro']
Loading specfile...
Searching for the new Temperature Min.... -20
Searching for the new Temperature Max.... 100
---check_search_done---- FILE IS PRESENT LETS CHECK IF SEARCH WAS ALREADY DONE
---check_search_done---- search_param :    Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
---check_search_done---- df_search_done :       Temp         Power  ...  Header                                       search_param
0    20  2.440277e-07  ...       3  Tempmin:-20,Tempmax:100,Optimization:error,Mod...
[1 rows x 6 columns]
File present : SEARCH already done
---check_search_done---- get old research results :    20 2.44027697469062e-07 -0.311720262269828 6 3 Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
Error :  -0.311720262269828
Inv :  6
Header :  3
History :  Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
#----------------------------------------------------------------------
# Cleaning the workspace...
#----------------------------------------------------------------------
Updated 0 paths from the index
Loading platform_config file...
PDK_ROOT value: None
sed: can't read /sky130A/libs.tech/magic/sky130A.magicrc: No such file or directory
---check_search_done---- FILE IS PRESENT LETS CHECK IF SEARCH WAS ALREADY DONE
---check_search_done---- search_param :    Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
---check_search_done---- df_search_done :       Temp         Power  ...  Header                                       search_param
0    20  2.440277e-07  ...       3  Tempmin:-20,Tempmax:100,Optimization:error,Mod...
[1 rows x 6 columns]
File present : SEARCH already done
---check_search_done---- get old research results :    20 2.44027697469062e-07 -0.311720262269828 6 3 Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
Error :  -0.311720262269828
Inv :  6
Header :  3
History :  Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
INV:6
HEADER:3
target number of inverters: 6
target number of headers: 3
#----------------------------------------------------------------------
# Verilog Generation
#----------------------------------------------------------------------
Traceback (most recent call last):
  File "tools/temp-sense-gen.py", line 118, in <module>
    TEMP_netlist.gen_temp_netlist(ninv, nhead, aux1, aux2, aux3, aux4, aux5, srcDir)
  File "/home/prajwalita17/VSD_8TSRAM/openfasoc/openfasoc/generators/async_updown_counter_gen/tools/TEMP_netlist.py", line 27, in gen_temp_netlist
    r_netlist = open(srcDir + "/TEMP_ANALOG_lv.v", "r")
FileNotFoundError: [Errno 2] No such file or directory: 'tools/../src//TEMP_ANALOG_lv.v'
make: *** [Makefile:48: sky130hd_temp] Error 1
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/generators/async_updown_counter_gen$ make sky130hd_temp ninv=6 nhead=3 sim=pex
#----------------------------------------------------------------------
# Parsing command line arguments...
#----------------------------------------------------------------------
['tools/temp-sense-gen.py', '--specfile', 'test.json', '--outputDir', './work', '--ninv', '6', '--nhead', '3', '--prepex', '--pex', '--platform', 'sky130hd', '--mode', 'macro']
Loading specfile...
Searching for the new Temperature Min.... -20
Searching for the new Temperature Max.... 100
---check_search_done---- FILE IS PRESENT LETS CHECK IF SEARCH WAS ALREADY DONE
---check_search_done---- search_param :    Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
---check_search_done---- df_search_done :       Temp         Power  ...  Header                                       search_param
0    20  2.440277e-07  ...       3  Tempmin:-20,Tempmax:100,Optimization:error,Mod...
[1 rows x 6 columns]
File present : SEARCH already done
---check_search_done---- get old research results :    20 2.44027697469062e-07 -0.311720262269828 6 3 Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
Error :  -0.311720262269828
Inv :  6
Header :  3
History :  Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
#----------------------------------------------------------------------
# Cleaning the workspace...
#----------------------------------------------------------------------
Updated 0 paths from the index
Loading platform_config file...
PDK_ROOT value: None
sed: can't read /sky130A/libs.tech/magic/sky130A.magicrc: No such file or directory
---check_search_done---- FILE IS PRESENT LETS CHECK IF SEARCH WAS ALREADY DONE
---check_search_done---- search_param :    Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
---check_search_done---- df_search_done :       Temp         Power  ...  Header                                       search_param
0    20  2.440277e-07  ...       3  Tempmin:-20,Tempmax:100,Optimization:error,Mod...
[1 rows x 6 columns]
File present : SEARCH already done
---check_search_done---- get old research results :    20 2.44027697469062e-07 -0.311720262269828 6 3 Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
Error :  -0.311720262269828
Inv :  6
Header :  3
History :  Tempmin:-20,Tempmax:100,Optimization:error,Model:tools/..//models/modelfile.csv,Delta_1st_pass:10
INV:6
HEADER:3
target number of inverters: 6
target number of headers: 3
#----------------------------------------------------------------------
# Verilog Generation
#----------------------------------------------------------------------
Traceback (most recent call last):
  File "tools/temp-sense-gen.py", line 118, in <module>
    TEMP_netlist.gen_temp_netlist(ninv, nhead, aux1, aux2, aux3, aux4, aux5, srcDir)
  File "/home/prajwalita17/VSD_8TSRAM/openfasoc/openfasoc/generators/async_updown_counter_gen/tools/TEMP_netlist.py", line 27, in gen_temp_netlist
    r_netlist = open(srcDir + "/TEMP_ANALOG_lv.v", "r")
FileNotFoundError: [Errno 2] No such file or directory: 'tools/../src//TEMP_ANALOG_lv.v'
make: *** [Makefile:48: sky130hd_temp] Error 1
```









