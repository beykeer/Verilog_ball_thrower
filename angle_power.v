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
	arrow = (xCount > arrowX[0] && xCount < (arrowX[0] + 10'd5)) && (yCount > arrowY[0] && yCount < (arrowY[0] + 10'd5));

end

reg[9:0] arrowX[0:9];
reg [8:0]arrowY[0:9]; 


//determines the direction and power ball is launched

reg [3:0]S; 
reg [3:0]NS;

localparam ANGLEUP = 4'd0, 
	ANGLEDOWN = 4'd1,
	POWERUP = 4'd2, 
	POWERDOWN = 4'd3, 
	STAY = 4'd4,
	DELAY1A = 4'd5,
	DELAY2A = 4'd6,
	DELAY3A = 4'd7,
	DELAY1P = 4'd8,
	DELAY2P = 4'd9,
	DELAY3P = 4'd10,
	DELAY4P = 4'd11,
	DELAY5P = 4'd12,
	DELAY6P = 4'd13;
	
	always @(posedge update) 
	begin
		if (rst == 1'b1)
			S <= STAY;
		else
			S <= NS;
	end

always @(*) 
	case (S)
		ANGLEUP: NS = DELAY1A;
			
		ANGLEDOWN: NS = DELAY1A;
			
		POWERUP: NS = DELAY1P;
			
		POWERDOWN: NS = DELAY1P;
		
		DELAY1A: NS = DELAY2A;
		
		DELAY2A: NS = DELAY3A;
		
		DELAY3A: NS = STAY;
		
		DELAY1P: NS = DELAY2P;
		
		DELAY2P: NS = DELAY3P;
		
		DELAY3P: NS = DELAY4P;
		
		DELAY4P: NS = DELAY5P;
		
		DELAY5P: NS = DELAY6P;
		
		DELAY6P: NS = STAY;
			
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
			arrowX[0] <= 10'd42;
			arrowY[0] <= 9'd425;
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
					Vel <= Vel - 3'd1;
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