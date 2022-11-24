module ram_dp #(parameter data_O_WIDTH = 8,ADDR_WIDTH = 8, RAM_DEPTH = 1 << ADDR_WIDTH)
(
input clk,
input [ADDR_WIDTH-1:0] address_0,
input cs_0,we_0,oe_0,
input [ADDR_WIDTH-1:0] address_1,
input cs_1,we_1,oe_1,
inout [data_O_WIDTH-1:0] data_0,data_1
);

reg [data_O_WIDTH-1:0] data_0_out,data_1_out;
reg [data_O_WIDTH-1:0] mem [0:RAM_DEPTH-1];

always @(posedge clk)
	begin : MEM_WRITE 
		if ( cs_0 && we_0 ) begin 
		 mem[address_0] <= data_0; 	   
		end else if (cs_1 && we_1) begin
			mem[address_1] <= data_1;
		end 
	end	 
assign data_0 = (cs_0 && oe_0 &&  ! we_0) ? data_0_out : 8'bz;		

always @ (posedge clk)
	begin : MEM_READ_0
		if (cs_0 &&  ! we_0 && oe_0) begin
			data_0_out <= mem[address_0];
		end else begin 
	data_0_out <= 0;
	end
end 
assign data_1 = (cs_1 && oe_1 &&  ! we_1) ? data_1_out : 8'bz; 

always @ (posedge clk)
	begin : MEM_READ_1
		if (cs_1 &&  ! we_1 && oe_1) begin
			data_1_out <= mem[address_1];
		end else begin 
	data_1_out <= 0;     
	end     
end 	  

endmodule

			
	