@echo off
set xv_path=D:\\song\\Editor\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim test_ALU_behav -key {Behavioral:sim_1:Functional:test_ALU} -tclbatch test_ALU.tcl -view D:/song/LAB/Vivado/lab_ALU_test/test_ALU_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
