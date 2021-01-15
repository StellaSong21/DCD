@echo off
set xv_path=D:\\song\\Editor\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto ebdd2b263fe5468298a4d92971c5c1a3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_ALU_behav xil_defaultlib.test_ALU xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
