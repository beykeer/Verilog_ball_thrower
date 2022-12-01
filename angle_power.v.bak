module angle_power(clk, rst, angleup, angledown, powerup, powerdown, update, xCount, yCount, player);
input clk, rst, angleup, angledown, powerup, powerdown, update;
input [9:0]xCount;
input [9:0]yCount;
output arrow;

reg arrow;
wire rst;







//determines the direction and power ball is launched

reg [2:0]S; 
reg [2:0]NS;

localparam ANGLEUP = 3'd0, 
	ANGLEDOWN = 3'd1,
	POWERUP = 3'd2, 
	POWERDOWN = 3'd3, 
	STAY = 3'd4;
	
	always @(posedge update) 
	begin
		if (rst == 1'b1)
			S <= STAY;
		else
			S <= NS;
	end

always @(*) 
	case (S)
		ANGLEUP:
			begin
				if(angleup == 1'b0)
					NS = ANGLEUP;
				else
					NS = STAY;
			end
			
		ANGLEDOWN:
			begin
				if(angledown == 1'b0)
					NS = ANGLEDOWN;
				else
					NS = STAY;
			end
		POWERUP:
			begin
				if(powerup == 1'b0)
					NS = POWERUP;
				else
					NS = STAY;
			end
		POWERDOWN:
			begin
				if(powerdown == 1'b0)
					NS = POWERDOWN;
				else
					NS = STAY;
			end
		STAY: 
			begin
				if(angleup == 1'b0)
					NS = ANGLEUP;
				else if (angledown == 1'b0)
					NS = ANGLEDOWN;
				else if (powerup == 1'b0)
					NS = POWERUP;
				else if (powerdown == 1'b0)
					NS = POWERDOWN;
				else
					NS = STAY;
			end
	endcase
