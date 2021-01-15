@echo off
set xv_path=D:\\song\\Editor\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim test_VEM_behav -key {Behavioral:sim_1:Functional:test_VEM} -tclbatch test_VEM.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
