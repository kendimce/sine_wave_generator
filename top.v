module top(clk,LED_out_first,LED_out_second);

input clk;
output [6:0] LED_out_first,LED_out_second;


generator gen(.clk(clk), .LED_out_first(LED_out_first), .LED_out_second(LED_out_second));


endmodule	