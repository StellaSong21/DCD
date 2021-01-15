# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/song/LAB/Vivado/lab_decoder/lab_decoder.cache/wt [current_project]
set_property parent.project_path D:/song/LAB/Vivado/lab_decoder/lab_decoder.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib D:/song/LAB/Vivado/lab_decoder/lab_decoder.srcs/sources_1/new/decoder.v
read_xdc D:/song/LAB/Vivado/lab_decoder/lab_decoder.srcs/constrs_1/new/decoder.xdc
set_property used_in_implementation false [get_files D:/song/LAB/Vivado/lab_decoder/lab_decoder.srcs/constrs_1/new/decoder.xdc]

synth_design -top decoder -part xc7a100tcsg324-1
write_checkpoint -noxdef decoder.dcp
catch { report_utilization -file decoder_utilization_synth.rpt -pb decoder_utilization_synth.pb }
