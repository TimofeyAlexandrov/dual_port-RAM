`timescale 1ns / 1ps 
module ram_dp_sr_sw_tb;
	reg clk;  
	reg [7:0] address_0;  
	reg cs_0;  
	reg we_0;  
	reg oe_0;  
	reg [7:0] address_1;  
	reg cs_1;  
	reg we_1;  
	reg oe_1;  
	reg [7:0] data_0_reg; 	 
	
wire [7:0] data_0 = data_0_reg;  
wire [7:0] data_1; 

// Instantiate the Unit Under Test (UUT)  
ram_dp uut (.clk(clk),    
.address_0(address_0),   
.data_0(data_0),  
.cs_0(cs_0),   
.we_0(we_0),   
.oe_0(oe_0),   
.address_1(address_1),   
.data_1(data_1), 
.cs_1(cs_1),   
.we_1(we_1),   
.oe_1(oe_1)); 

initial begin 
	clk = 0;  
	address_0 = 1;
	cs_0 = 0;   
	we_0 = 0;   
	oe_0 = 0;  
	address_1 = 0;  
	cs_1 = 0;  
	we_1 = 0;  
	oe_1 = 0; 
	data_0_reg = 0;
	#100; 
end  
always begin    
#5   clk = ~clk; 
end	  

always begin   
#10   we_0 = 1; 
oe_0 = 0; 
cs_0 = 1;   
data_0_reg = data_0_reg + 1; 
address_0 = address_0 + 1; 
end  	
always begin
	#10   we_1 = 0;  
oe_1 = 1; 
cs_1 = 1;  
address_1 = address_1 + 1; 
end  
endmodule  
