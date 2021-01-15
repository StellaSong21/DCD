proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir D:/song/LAB/Vivado/lab_VEM/lab_VEM.cache/wt [current_project]
  set_property parent.project_path D:/song/LAB/Vivado/lab_VEM/lab_VEM.xpr [current_project]
  set_property ip_repo_paths d:/song/LAB/Vivado/lab_VEM/lab_VEM.cache/ip [current_project]
  set_property ip_output_repo d:/song/LAB/Vivado/lab_VEM/lab_VEM.cache/ip [current_project]
  add_files -quiet D:/song/LAB/Vivado/lab_VEM/lab_VEM.runs/synth_1/VEM.dcp
  read_xdc D:/song/LAB/Vivado/lab_VEM/lab_VEM.srcs/constrs_1/new/lab_VEM.xdc
  link_design -top VEM -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force VEM_opt.dcp
  report_drc -file VEM_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file VEM.hwdef}
  place_design 
  write_checkpoint -force VEM_placed.dcp
  report_io -file VEM_io_placed.rpt
  report_utilization -file VEM_utilization_placed.rpt -pb VEM_utilization_placed.pb
  report_control_sets -verbose -file VEM_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force VEM_routed.dcp
  report_drc -file VEM_drc_routed.rpt -pb VEM_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file VEM_timing_summary_routed.rpt -rpx VEM_timing_summary_routed.rpx
  report_power -file VEM_power_routed.rpt -pb VEM_power_summary_routed.pb
  report_route_status -file VEM_route_status.rpt -pb VEM_route_status.pb
  report_clock_utilization -file VEM_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force VEM.mmi }
  write_bitstream -force VEM.bit 
  catch { write_sysdef -hwdef VEM.hwdef -bitfile VEM.bit -meminfo VEM.mmi -file VEM.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

