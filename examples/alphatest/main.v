

    module RAM1_7(q, a, d, we, clk);
    output reg [7:0] q = 0;
    input [7:0] d;
    input [3:0] a;
    input we, clk;
    reg [7:0] ram [15:0];
     always @(posedge clk) begin
         if (we)
             ram[a] <= d;
         q <= ram[a];
     end

    integer i;
    initial
    begin
        for (i=0; i < 16; i=i+1)
        begin
            ram[i] = 0;
        end

        ram[1] = 1;
ram[2] = 4;
ram[3] = 9;
ram[4] = 16;
ram[5] = 25;
ram[6] = 36;
ram[7] = 49;
ram[8] = 64;
ram[9] = 1;
ram[10] = 2;
ram[11] = 3;
ram[12] = 4;
ram[13] = 5;
ram[14] = 6;
ram[15] = 7;
    end
    endmodule

    
module main (
	clk,
	K_8_out0,
	reg1_6_out0,
	RAMOUT_10_out0,
	COUT_0_out0,
	ADDER_2_out0,
	RAMIN_12_out0);
input clk;
input  [19:0] K_8_out0;
output  [19:0] ADDER_2_out0;
output  [19:0] reg1_6_out0;
output  [3:0] RAMIN_12_out0;
output  [7:0] RAMOUT_10_out0;
output COUT_0_out0;
reg  [19:0] REG1_13_out0 = 20'h0;
wire  [19:0] A1_3_out0;
wire  [19:0] TT_9_out0;
wire  [3:0] SEL1_11_out0;
wire  [7:0] C3_5_out0;
wire  [7:0] RAM1_7_out0;
wire A1_3_out1;
wire C1_1_out0;
wire SEL2_4_out0;

RAM1_7 I1 (RAM1_7_out0, SEL1_11_out0, C3_5_out0, SEL2_4_out0, clk);
always @(posedge clk) REG1_13_out0 <= A1_3_out0;
assign C3_5_out0 = 8'h73;
assign C1_1_out0 = 1'h1;
assign {A1_3_out1,A1_3_out0 } = REG1_13_out0 + K_8_out0 + C1_1_out0;
assign reg1_6_out0 = REG1_13_out0;
assign RAMOUT_10_out0 = RAM1_7_out0;
assign SEL1_11_out0 = REG1_13_out0[3:0];
assign COUT_0_out0 = A1_3_out1;
assign ADDER_2_out0 = A1_3_out0;
assign SEL2_4_out0 = SEL1_11_out0[0:0];
assign RAMIN_12_out0 = SEL1_11_out0;


endmodule
