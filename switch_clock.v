module switch_clock(clk, update,VGA_CLK);
input clk;
output reg update;
output reg VGA_CLK;
reg [21:0]count;	
reg i;
	
//controls how fast the player and the blocks update
always@(posedge clk)
	begin
		count <= count + 22'd1;
		if(count == 22'd200000)
		begin
			update <= ~update;
			count <= 22'd0;
		end	
	end
	
//converts the board clock (50MHz) to  the VGA clock (25MHz)
always@(posedge clk)
	begin
		i <= ~i; 
		VGA_CLK <= i;
	end

endmodule 