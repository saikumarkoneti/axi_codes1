file mkdir logs
#compilation
vlog ../top/top_tb.sv \
+incdir+../../rtl/verilog \
+incdir+../Mii \
+incdir+../Phy \
+incdir+../ref \
+incdir+../wb \
+incdir+../sbd \
+incdir+../memory \
+incdir+/mnt/c/questasim64_10.7c/verilog_src/uvm-1.2 \
+incdir+../top \

set  testname mac_fd_rx_test
variable time [format "%s" [clock format [clock seconds] -format %m%d_%H%M]]
set log_f "logs/$testname\_$time\.log"
#elaboration
vsim -vopt -c top_tb -voptargs=+acc +UVM_TESTNAME=$testname -l $log_f 
#add wave 
do wave.do
add log -r sim:/top_tb/*
#simulation
run -all




