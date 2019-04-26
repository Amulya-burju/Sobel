
source ../../../legup.tcl

set_parameter PRINTF_CYCLES 1

set_operation_latency multiply 0

set_project StratixIV DE4-530 Tiger_DDR2
#Change Device in top.qsf to CycloneV 5CGXFC9E6F35C7

# we need to ignore the memory dependency for the prev_prev_row shift register:
# 		window[0][2] = prev_prev_row[prev_prev_row_index];
#		prev_prev_row[prev_prev_row_index] = prev_row_elem;
# We know that the prev_prev_row_index will change for the next iteration so there
# is no loop carried dependency here
loop_pipeline "loop" -ignore-mem-deps 

set_parameter LOCAL_RAMS 1
