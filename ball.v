module ball(clk,rst,update,xCount,yCount,,,ball);

input clk, rst, update;
input [9:0]xCount;
input [9:0]yCount;
output ball;

reg ball;
wire rst;

always @(posedge clk)
begin
	ball = (xCount > ballX[0] && xCount < (ballX[0] + 10'd10)) && (yCount > ballY[0] && yCount < (ballY[0] + 10'd10));

end

reg[9:0] ballX [0:9];
reg [8:0]ballY [0:9]; 




endmodule 