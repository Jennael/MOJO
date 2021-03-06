#!/bin/sh

# 
# PlanAhead(TM)
# runme.sh: a PlanAhead-generated Runs Script for UNIX
# Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/Programs/ISE/14.7/ISE_DS/EDK/bin/nt;D:/Programs/ISE/14.7/ISE_DS/EDK/lib/nt;D:/Programs/ISE/14.7/ISE_DS/ISE/bin/nt;D:/Programs/ISE/14.7/ISE_DS/ISE/lib/nt;D:/Programs/ISE/14.7/ISE_DS/common/bin/nt;D:/Programs/ISE/14.7/ISE_DS/common/lib/nt:D:/Programs/ISE/14.7/ISE_DS/PlanAhead/bin
else
  PATH=D:/Programs/ISE/14.7/ISE_DS/EDK/bin/nt;D:/Programs/ISE/14.7/ISE_DS/EDK/lib/nt;D:/Programs/ISE/14.7/ISE_DS/ISE/bin/nt;D:/Programs/ISE/14.7/ISE_DS/ISE/lib/nt;D:/Programs/ISE/14.7/ISE_DS/common/bin/nt;D:/Programs/ISE/14.7/ISE_DS/common/lib/nt:D:/Programs/ISE/14.7/ISE_DS/PlanAhead/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# EAStep map -intstyle pa -w -pr b -mt on "mojo_top_0.ngd"
EAStep par -intstyle pa "mojo_top_0.ncd" -w "mojo_top_0_routed.ncd" -mt on
EAStep trce -intstyle ise -o "mojo_top_0.twr" -v 30 -l 30 "mojo_top_0_routed.ncd" "mojo_top_0.pcf"
EAStep xdl -secure -ncd2xdl -nopips "mojo_top_0_routed.ncd" "mojo_top_0_routed.xdl"
EAStep bitgen "mojo_top_0_routed.ncd" "mojo_top_0.bit" "mojo_top_0.pcf" -g Binary:Yes -g Compress -w -intstyle pa
