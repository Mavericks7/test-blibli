module LED(
	input clk_50Mhz,
	input RST,
	output reg[3:0] LED
);
reg[23:0] count;

always @(posedge clk_50Mhz or negedge RST) 
begin
	if(!RST)
		count <= 24'd0;
	else if(count < 24'd1000_0000)
		count <= count + 1'b1;
	else
		count <= 24'd0;

end

always @(posedge clk_50Mhz or negedge RST) 
begin
	if(!RST)
		LED <= 4'b0001;
	else if(count == 24'd1000_0000)
   	LED[3:0] <= {LED[2:0],LED[3]};
	else
		LED <= LED;

end
endmodule 