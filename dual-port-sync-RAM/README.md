Simple Dual Port RAM with separate addresses and clocks for read/write operations.

Nets or reg (multiple bit widths) data types can be declared as vectors

```verilog
reg[7:0] memory_byte[0:1023];    //memory memory_byte with 1K 8-bit words(bytes)
```

```verilog
wire [31:0] bus_A,bus_B,bus_C;  //3 buses of 32 bit width
```

```verilog
reg [0:40] virtual_addr;              //vector register. Virtual address 41 bits wide

// 0:always MSB ; 40:always LSB
```
```verilog
integer count[0:7] ;         //an array of 8 count variables
```

wire [31:0] A[15:0] -> there are 16 address to access, with each address holding 32 bits of data

