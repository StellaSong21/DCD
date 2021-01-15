@echo off
set xv_path=D:\\song\\Editor\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 1b6f9f355ccd4cc886d2893ea9228ca7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_VEM_behav xil_defaultlib.test_VEM xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
