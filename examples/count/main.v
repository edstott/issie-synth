
module main (
	OUT_5_out0);
reg clk;
output  [7:0] OUT_5_out0;
reg  [7:0] REG1_6_out0 = 8'h0;
wire  [7:0] A1_4_out0;
wire  [7:0] C2_1_out0;
wire  [7:0] IN_7_out0;
wire  [7:0] OUT_2_out0;
wire A1_4_out1;
wire C1_3_out0;
wire COUT_0_out0;

always @(posedge clk) REG1_6_out0 <= OUT_2_out0;
assign C1_3_out0 = 1'h0;
assign C2_1_out0 = 8'h0;
assign OUT_5_out0 = REG1_6_out0;
assign IN_7_out0 = REG1_6_out0;
assign {A1_4_out1,A1_4_out0 } = IN_7_out0 + C2_1_out0 + C1_3_out0;
assign COUT_0_out0 = A1_4_out1;
assign OUT_2_out0 = A1_4_out0;


        initial
                begin
                
                clk = 1'b0;
                $display("OUT");
                while ($time < 300)
                begin
                    $display("%3h",OUT_5_out0);
                    #5 clk = !clk;
                    #5 clk = !clk;
                end
                end
    
endmodule
