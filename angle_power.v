module angle_power(clk, rst, angleup, angledown, powerup, powerdown, update, xCount, yCount, arrow, Vel, Ang);
input clk, rst, angleup, angledown, powerup, powerdown, update;
input [9:0]xCount;
input [9:0]yCount;
output arrow;
output reg[2:0]Vel;
output reg[4:0]Ang;

reg arrow;
wire rst;

always @(posedge clk)
begin
	arrow = (xCount > arrowX[0] && xCount < (arrowX[0] + 10'd10)) && (yCount > arrowY[0] && yCount < (arrowY[0] + 10'd10));

end

reg[9:0] arrowX [0:5];
reg [8:0]arrowY [0:5]; 


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
				if(angleup == 1'b0 && Ang < 5'd16)
					NS = ANGLEUP;
					
				else
					NS = STAY;
			end
			
		ANGLEDOWN:
			begin
				if(angledown == 1'b0 && Ang > 5'd0)
					NS = ANGLEDOWN;
				else
					NS = STAY;
			end
		POWERUP:
			begin
				if(powerup == 1'b0 && Vel < 3'd5)
					NS = POWERUP;
				else
					NS = STAY;
			end
		POWERDOWN:
			begin
				if(powerdown == 1'b0 && Vel > 3'd0)
					NS = POWERDOWN;
				else
					NS = STAY;
			end
		STAY: 
			begin
				if(angleup == 1'b0 && Ang < 5'd16)
					NS = ANGLEUP;
				else if (angledown == 1'b0 && Ang > 5'd0)
					NS = ANGLEDOWN;
				else if (powerup == 1'b0 && Vel < 3'd5)
					NS = POWERUP;
				else if (powerdown == 1'b0 && Vel > 3'd0)
					NS = POWERDOWN;
				else
					NS = STAY;
			end
	endcase

	always @(posedge update) 
	begin
	if (rst == 1'b1)
		begin //starting position
			arrowX[0] <= 10'd31;
			arrowY[0] <= 9'd443;
			Vel <= 3'd0;
			Ang <= 5'd0;
		end
	else
		case(S)
			ANGLEUP:
				begin
					arrowX[0] <= (arrowX[0] - 10'd1);
					arrowY[0] <= (arrowY[0] - 9'd4);
					Ang <= Ang + 5'd1;
				end
			ANGLEDOWN:
				begin
					arrowX[0] <= (arrowX[0] + 10'd1);
					arrowY[0] <= (arrowY[0] + 9'd4);
					Ang <= Ang - 5'd1;
				end
			POWERUP:
				begin
					arrowX[0] <= (arrowX[0] + 10'd4);
					arrowY[0] <= (arrowY[0] - 9'd10);
					Vel <= Vel + 3'd1;
				end
			POWERDOWN:
				begin
					arrowX[0] <= (arrowX[0] - 10'd4);
					arrowY[0] <= (arrowY[0] + 9'd10);
					Vel <= Vel + 3'd1;
				end
			STAY:
				begin
					arrowX[0] <= arrowX[0];
					arrowY[0] <= arrowY[0];
					Vel <= Vel;
					Ang <= Ang;
				end
		endcase
	end
	
endmodule 