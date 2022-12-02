module Look_Up(Vel,Ang,Vel_x,Vel_y);
	input[2:0] Vel;
	input[4:0] Ang;
	output reg [9:0]Vel_x;
	output reg [9:0]Vel_y;
	
	
	always @(Vel,Ang)
	begin
		case ({Vel,Ang})
			8'b00000000: 
			begin
				Vel_x <= 10'd120; 
				Vel_y <= 10'd10;
			end
			8'b00000001: 
			begin 
				Vel_x <= 10'd118; 
				Vel_y <= 10'd21;
			end
			8'b00000010: 
			begin
				Vel_x <= 10'd116; 
				Vel_y <= 10'd31;
			end
			8'b00000011: 
			begin
				Vel_x <= 10'd113; 
				Vel_y <= 10'd41;
			end
			8'b00000100: 
			begin
				Vel_x <= 10'd109; 
				Vel_y <= 10'd51;
			end
			8'b00000101:
			begin	
				Vel_x <= 10'd104; 
				Vel_y <= 10'd60;
			end
			8'b00000110: 
			begin
				Vel_x <= 10'd98; 
				Vel_y <= 10'd69;
			end
			8'b00000111: 
			begin 
				Vel_x <= 10'd92; 
				Vel_y <= 10'd77;
			end
			8'b00001000: 
			begin
				Vel_x <= 10'd85; 
				Vel_y <= 10'd85;
			end
			8'b00001001: 
			begin
				Vel_x <= 10'd77; 
				Vel_y <= 10'd92;
			end
			8'b00001010: 
			begin
				Vel_x <= 10'd69; 
				Vel_y <= 10'd98;
			end
			8'b00001011: 
			begin
				Vel_x <= 10'd60; 
				Vel_y <= 10'd104;
			end
			8'b00001100: 
			begin
				Vel_x <= 10'd51; 
				Vel_y <= 10'd109;
			end
			8'b00001101: 
			begin
				Vel_x <= 10'd41; 
				Vel_y <= 10'd113;
			end
			8'b00001111: 
			begin
				Vel_x <= 10'd21; 
				Vel_y <= 10'd116;
			end
			8'b00010000: 
			begin
				Vel_x <= 10'd21; 
				Vel_y <= 10'd118;
			end
			8'b00010001: 
			begin
				Vel_x <= 10'd10; 
				Vel_y <= 10'd120;
			end
			8'b00100000: 
			begin
				Vel_x <= 10'd239; 
				Vel_y <= 10'd21;
			end
			8'b00100001: 
			begin
				Vel_x <= 10'd236; 
				Vel_y <= 10'd42;
			end
			8'b00100010: 
			begin
				Vel_x <= 10'd232; 
				Vel_y <= 10'd62;
			end
			8'b00100011: 
			begin
				Vel_x <= 10'd226; 
				Vel_y <= 10'd82;
			end
			8'b00100100: 
			begin
				Vel_x <= 10'd218; 
				Vel_y <= 10'd101;  
			end
			8'b00100101: 
			begin
				Vel_x <= 10'd208; 
				Vel_y <= 10'd120;
			end
			8'b00100110: 
			begin
				Vel_x <= 10'd197; 
				Vel_y <= 10'd138;
			end
			8'b00100111: 
			begin
				Vel_x <= 10'd184; 
				Vel_y <= 10'd154;
			end
			8'b00101000: 
			begin
				Vel_x <= 10'd170; 
				Vel_y <= 10'd170;
			end
			8'b00101001:
			begin	
				Vel_x <= 10'd154; 
				Vel_y <= 10'd184;
			end
			8'b00101010: 
			begin
				Vel_x <= 10'd138; 
				Vel_y <= 10'd197;
			end
			8'b00101011: 
			begin
				Vel_x <= 10'd120; 
				Vel_y <= 10'd208;
			end
			8'b00101100: 
			begin
				Vel_x <= 10'd101; 
				Vel_y <= 10'd218;
			end
			8'b00101101: 
			begin
				Vel_x <= 10'd82; 
				Vel_y <= 10'd226;
			end
			8'b00101111: 
			begin
				Vel_x <= 10'd62; 
				Vel_y <= 10'd232;
			end
			8'b00110000: 
			begin
				Vel_x <= 10'd42; 
				Vel_y <= 10'd236;
			end
			8'b00110001: 
			begin
				Vel_x <= 10'd21; 
				Vel_y <= 10'd239;
			end
			8'b01000000:
			begin
				Vel_x <= 10'd359; 
				Vel_y <= 10'd31;
			end
			8'b01000001: 
			begin
				Vel_x <= 10'd355; 
				Vel_y <= 10'd63;
			end
			8'b01000010: 
			begin
				Vel_x <= 10'd348; 
				Vel_y <= 10'd93;
			end
			8'b01000011: 
			begin
				Vel_x <= 10'd338; 
				Vel_y <= 10'd123;
			end
			8'b01000100: 
			begin
				Vel_x <= 10'd326; 
				Vel_y <= 10'd152;
			end
			8'b01000101: 
			begin
				Vel_x <= 10'd312; 
				Vel_y <= 10'd180;
			end
			8'b01000110: 
			begin
				Vel_x <= 10'd295; 
				Vel_y <= 10'd206;
			end
			8'b01000111: 
			begin
				Vel_x <= 10'd276; 
				Vel_y <= 10'd231;
			end
			8'b01001000: 
			begin
				Vel_x <= 10'd255; 
				Vel_y <= 10'd255;
			end
			8'b01001001: 
			begin
				Vel_x <= 10'd231; 
				Vel_y <= 10'd276;
			end
			8'b01001010: 
			begin
				Vel_x <= 10'd206; 
				Vel_y <= 10'd295;
			end
			8'b01001011: 
			begin
				Vel_x <= 10'd180; 
				Vel_y <= 10'd312;
			end
			8'b01001100: 
			begin
				Vel_x <= 10'd152; 
				Vel_y <= 10'd326;
			end
			8'b01001101: 
			begin
				Vel_x <= 10'd123; 
				Vel_y <= 10'd338;
			end
			8'b01001111: 
			begin
				Vel_x <= 10'd93; 
				Vel_y <= 10'd348;
			end
			8'b01010000: 
			begin
				Vel_x <= 10'd63; 
				Vel_y <= 10'd355;
			end
			8'b01010001: 
			begin
				Vel_x <= 10'd31; 
				Vel_y <= 10'd359;
			end
			8'b01100000: 
			begin
				Vel_x <= 10'd478; 
				Vel_y <= 10'd42;
			end
			8'b01100001: 
			begin
				Vel_x <= 10'd473; 
				Vel_y <= 10'd83;
			end
			8'b01100010: 
			begin
				Vel_x <= 10'd464; 
				Vel_y <= 10'd124;
			end
			8'b01100011: 
			begin
				Vel_x <= 10'd451; 
				Vel_y <= 10'd164;
			end
			8'b01100100: 
			begin
				Vel_x <= 10'd435; 
				Vel_y <= 10'd203;
			end
			8'b01100101: 
			begin
				Vel_x <= 10'd416; 
				Vel_y <= 10'd240;
			end
			8'b01100110: 
			begin
				Vel_x <= 10'd393; 
				Vel_y <= 10'd275;
			end
			8'b01100111: 
			begin
				Vel_x <= 10'd368; 
				Vel_y <= 10'd309;
			end
			8'b01101000: 
			begin
				Vel_x <= 10'd339; 
				Vel_y <= 10'd339;
			end
			8'b01101001: 
			begin
				Vel_x <= 10'd309; 
				Vel_y <= 10'd368;
			end
			8'b01101010: 
			begin
				Vel_x <= 10'd275; 
				Vel_y <= 10'd393;
			end
			8'b01101011: 
			begin
				Vel_x <= 10'd240; 
				Vel_y <= 10'd416;
			end
			8'b01101100: 
			begin
				Vel_x <= 10'd203; 
				Vel_y <= 10'd435;
			end
			8'b01101101: 
			begin
				Vel_x <= 10'd164; 
				Vel_y <= 10'd451;
			end
			8'b01101111: 
			begin
				Vel_x <= 10'd124; 
				Vel_y <= 10'd464;
			end
			8'b01110000: 
			begin
				Vel_x <= 10'd83; 
				Vel_y <= 10'd473;
			end
			8'b01110001: 
			begin
				Vel_x <= 10'd42; 
				Vel_y <= 10'd478;
			end
			8'b10000000: 
			begin
				Vel_x <= 10'd598; 
				Vel_y <= 10'd52;
			end
			8'b10000001: 
			begin
				Vel_x <= 10'd591; 
				Vel_y <= 10'd104;
			end
			8'b10000010: 
			begin
				Vel_x <= 10'd580; 
				Vel_y <= 10'd155;
			end
			8'b10000011: 
			begin
				Vel_x <= 10'd564; 
				Vel_y <= 10'd205;
			end
			8'b10000100: 
			begin
				Vel_x <= 10'd544; 
				Vel_y <= 10'd254;
			end
			8'b10000101: 
			begin
				Vel_x <= 10'd520; 
				Vel_y <= 10'd300;
			end
			8'b10000110: 
			begin
				Vel_x <= 10'd491; 
				Vel_y <= 10'd344;
			end
			8'b10000111: 
			begin
				Vel_x <= 10'd460; 
				Vel_y <= 10'd386;
			end
			8'b10001000: 
			begin
				Vel_x <= 10'd424; 
				Vel_y <= 10'd424;
			end
			8'b10001001: 
			begin
				Vel_x <= 10'd386; 
				Vel_y <= 10'd460;
			end
			8'b10001010: 
			begin
				Vel_x <= 10'd344; 
				Vel_y <= 10'd491;
			end
			8'b10001011: 
			begin
				Vel_x <= 10'd300; 
				Vel_y <= 10'd520;
			end
			8'b10001100: 
			begin
				Vel_x <= 10'd254; 
				Vel_y <= 10'd544;
			end
			8'b10001101: 
			begin
				Vel_x <= 10'd205; 
				Vel_y <= 10'd564;
			end
			8'b10001111: 
			begin
				Vel_x <= 10'd155; 
				Vel_y <= 10'd580;
			end
			8'b10010000: 
			begin
				Vel_x <= 10'd104; 
				Vel_y <= 10'd591;
			end
			8'b10010001: 
			begin
				Vel_x <= 10'd52; 
				Vel_y <= 10'd598;
			end
			8'b10100000: 
			begin
				Vel_x <= 10'd717; 
				Vel_y <= 10'd63;
			end
			8'b10100001: 
			begin
				Vel_x <= 10'd709; 
				Vel_y <= 10'd125;
			end
			8'b10100010: 
			begin
				Vel_x <= 10'd695; 
				Vel_y <= 10'd186;
			end
			8'b10100011: 
			begin
				Vel_x <= 10'd677; 
				Vel_y <= 10'd246;
			end
			8'b10100100: 
			begin
				Vel_x <= 10'd653; 
				Vel_y <= 10'd304;
			end
			8'b10100101: 
			begin
				Vel_x <= 10'd624; 
				Vel_y <= 10'd360;
			end
			8'b10100110: 
			begin
				Vel_x <= 10'd590; 
				Vel_y <= 10'd413;
			end
			8'b10100111: 
			begin
				Vel_x <= 10'd552; 
				Vel_y <= 10'd463;
			end
			8'b10101000: 
			begin
				Vel_x <= 10'd509; 
				Vel_y <= 10'd509;
			end
			8'b10101001: 
			begin
				Vel_x <= 10'd463; 
				Vel_y <= 10'd552;
			end
			8'b10101010: 
			begin
				Vel_x <= 10'd413; 
				Vel_y <= 10'd590;
			end
			8'b10101011: 
			begin
				Vel_x <= 10'd360; 
				Vel_y <= 10'd624;
			end
			8'b10101100: 
			begin
				Vel_x <= 10'd304; 
				Vel_y <= 10'd653;
			end
			8'b10101101: 
			begin
				Vel_x <= 10'd246; 
				Vel_y <= 10'd677;
			end
			8'b10101111: 
			begin
				Vel_x <= 10'd186; 
				Vel_y <= 10'd695;
			end
			8'b10110000: 
			begin
				Vel_x <= 10'd125; 
				Vel_y <= 10'd709;
			end
			8'b10110001: 
			begin
				Vel_x <= 10'd63; 
				Vel_y <= 10'd717;
			end
		endcase
	end
endmodule 