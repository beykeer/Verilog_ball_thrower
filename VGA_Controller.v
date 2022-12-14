module VGA_Controller(VGA_CLK, xCount, yCount, ScreenArea, hsync, vsync, blank_n);

input VGA_CLK;
output reg [9:0]xCount, yCount; 
output reg ScreenArea;  
output hsync, vsync, blank_n;

reg p_hSync, p_vSync; 
	
integer porchHF = 10'd640; //start of horizntal front porch
integer syncH = 10'd655;//start of horizontal sync
integer porchHB = 10'd747; //start of horizontal back porch
integer maxH = 10'd793; //total length of line.

integer porchVF = 10'd480; //start of vertical front porch 
integer syncV = 10'd490; //start of vertical sync
integer porchVB = 10'd492; //start of vertical back porch
integer maxV = 10'd525; //total rows. 

always@(posedge VGA_CLK)
	begin
		if(xCount === maxH)
			xCount <= 10'd0;
		else
			xCount <= xCount + 10'd1;
	end

	
always@(posedge VGA_CLK)
	begin
		if(xCount === maxH)
			begin
				if(yCount === maxV)
					yCount <= 10'd0;
				else
					yCount <= yCount + 10'd1;
			end
	end
	
always@(posedge VGA_CLK) //display area generator
	begin
		ScreenArea <= ((xCount < porchHF) && (yCount < porchVF)); 
	end

always@(posedge VGA_CLK) //sync signal generator
	begin
		p_hSync <= ((xCount >= syncH) && (xCount < porchHB)); 
		p_vSync <= ((yCount >= syncV) && (yCount < porchVB)); 
	end
 
assign vsync = ~p_vSync; 
assign hsync = ~p_hSync;
assign blank_n = ScreenArea;

endmodule 