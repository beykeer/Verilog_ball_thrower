module Ball_thrower(
  // Clock Inputs
  input         CLOCK_50,

// Push Button
  input  [3:0] KEY,         // Pushbutton[3:0]

  // DPDT Switch
  input  [17:0] SW,          // Toggle Switch[17:0]
  
// VGA
  output        VGA_CLK,     // VGA Clock
  output        VGA_HS,      // VGA H_SYNC
  output        VGA_VS,      // VGA V_SYNC
  output        VGA_BLANK_N, // VGA BLANK
  output        VGA_SYNC_N,  // VGA SYNC
  output reg [7:0]  VGA_R,       // VGA Red[9:0]
  output reg [7:0]  VGA_G,       // VGA Green[9:0]
  output reg [7:0]  VGA_B       // VGA Blue[9:0]
  );
wire clk;
wire rst;

assign clk = CLOCK_50;
assign go = SW[0];
assign rst = SW[17];



wire [9:0]Vel_x;
wire [9:0]Vel_y;

 
wire update;

switch_clock clocks(clk, update, VGA_CLK); //converts the board clock to VGA clock and frame update clock
 

wire arrow;
wire ball;
wire angleup;
wire angledown;
wire powerup;
wire powerdown;

assign angleup = KEY[0];
assign angledown = KEY[1];
assign powerup = KEY[2];
assign powerdown = KEY[3];

wire [2:0]Vel;
wire [4:0]Ang;

angle_power aandp(VGA_CLK, rst, angleup, angledown, powerup, powerdown, update, xCount, yCount, arrow, Vel, Ang);

Look_Up youreabitch(Vel,Ang,Vel_x,Vel_y);

ball paul(VGA_CLK,rst,update,go,xCount,yCount,Vel_x,Vel_y,ball);

//display
wire [9:0] xCount; 
wire [9:0] yCount;
wire ScreenArea;

reg ground;
reg target;

always @(posedge VGA_CLK) 
begin
	ground <= ((yCount >= 450) && (yCount < 481));
	target <= ((yCount >= 450) && (yCount < 481) && (xcount > 420) && (xcount <540));
end

VGA_Controller VGA(VGA_CLK, xCount, yCount, ScreenArea, VGA_HS, VGA_VS, VGA_BLANK_N);

wire R;
wire G;
wire B;

assign R = (target) || (arrow) || (ball);
assign G = (ground) || (ball);
assign B = (ball);


always @ (posedge VGA_CLK)
	begin
		VGA_R = {8{R}};
		VGA_G = {8{G}};
		VGA_B = {8{B}};
	end 

endmodule 
