# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/song/LAB/Vivado/lab_ALU_test/lab_ALU_test.cache/wt [current_project]
set_property parent.project_path D:/song/LAB/Vivado/lab_ALU_test/lab_ALU_test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib D:/song/LAB/Vivado/lab_ALU_test/lab_ALU_test.srcs/sources_1/new/ALU.v
read_xdc D:/song/LAB/Vivado/lab_ALU_test/lab_ALU_test.srcs/constrs_1/new/ALU.xdc
set_property used_in_implementation false [get_files D:/song/LAB/Vivado/lab_ALU_test/lab_ALU_test.srcs/constrs_1/new/ALU.xdc]

synth_design -top ALU -part xc7a100tcsg324-1
write_checkpoint -noxdef ALU.dcp
catch { report_utilization -file ALU_utilization_synth.rpt -pb ALU_utilization_synth.pb }
