tree /f 
python assembler_v2.py 
cd modules
md output
iverilog -o output\output.vvp CPU_tb.v
vvp output\output.vvp
cd ..
move modules\output\*.* output
rmdir modules\output
gtkwave output\output.vcd
pause