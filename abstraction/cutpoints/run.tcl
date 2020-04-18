clear -all
# Read in HDL files
analyze -sv12 /home/diego/Documents/sbx/concurrent/top.sv
analyze -sv12 /home/diego/Documents/sbx/concurrent/abstract.sv
elaborate -top top
# Setup environment after elaborate
# Setup global environment
# Setup global clocks and resets
clock clk
reset -expression !(rstn)
