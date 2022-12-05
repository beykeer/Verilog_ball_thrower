module ball(clk,rst,update,go,xCount,yCount,Vel_x,Vel_y,ball);

input clk, rst, update,go;
input [9:0]xCount;
input [9:0]yCount;
input [9:0]Vel_x;
input [9:0]Vel_y;
output ball;

reg [9:0]holdx;
reg [9:0]holdy;
reg ball;
wire rst;
reg [10:0]i;

always @(posedge clk)
begin
	ball = (xCount > ballX[0] && xCount < (ballX[0] + 10'd5)) && (yCount > ballY[0] && yCount < (ballY[0] + 10'd5));

end

reg[9:0] ballX [0:9];
reg [8:0]ballY [0:9]; 

reg [2:0]S; 
reg [2:0]NS;

//ZERO FOR BALL IS 445 ON THE Y

localparam START = 3'd0, 
	Check_loop = 3'd1,
	adjust_value = 3'd2, 
	move_ball = 3'd3, 
	done = 3'd4;

	always @(posedge update) 
	begin
		if (rst == 1'b1)
			S <= START;
		else
			S <= NS;
	end

	//what is next state
always @(*) 
	case (S)
		START:
			begin
				if (go == 1'd1)
				begin
					NS=Check_loop;
				end
				else
					NS=START;
			end
			
		Check_loop:
			begin
				if(ballY[0]>=9'd445)
				begin
					NS=done;
				end
				else
					NS=adjust_value;
			end
		adjust_value:NS=move_ball;
		move_ball:NS=Check_loop;
		done: NS=done;
	endcase

	always @(posedge update) 
	begin
	if (rst == 1'b1)
		begin //starting position
			ballX[0] <=10'd24;
			ballY[0] <=9'd435;
			i=0;
			
		end
	else
		case(S)
			START:
				begin
					ballX[0] <=10'd24;
					ballY[0] <=9'd435;
					
				end
			Check_loop:;

			adjust_value:
				begin
					holdx <= (24+((Vel_x/10)*i));
					holdy <=	(435-((Vel_y/10)*i)+((981/200)*(i*i)));
				end
			move_ball: 
			begin
				ballX[0]<=holdx;
				ballY[0]<=holdy;
				i=i+1;
			end
			done:;
				
		endcase
	end

endmodule 