`include "bai1.v"
module counter_3bits_tb();
// Declare inputs as regs and outputs as wires
reg clock, reset, enable;
wire [2:0] counter_out;

// Initialize all variables
initial begin        

  $dumpfile ("bai1.vcd"); 
  $dumpvars(1, clock, reset, enable, counter_out); 

  $display ("time\t clk reset enable counter");	
  $monitor ("%g\t %b   %b     %b      %b", 
	  $time, clock, reset, enable, counter_out);	
  clock = 1;       // initial value of clock
  reset = 0;       // initial value of reset
  enable = 0;      // initial value of enable
  #5 reset = 1;    // Assert the reset
  #10 reset = 0;   // De-assert the reset
  #10 enable = 1;  // Assert enable
  #100 enable = 0; // De-assert enable
  #5 $finish;      // Terminate simulation
end

// Clock generator
always begin
  #5 clock = ~clock; // Toggle clock every 5 ticks
end

// Connect DUT to test bench
counter_3bits U_counter (
clock,
reset,
enable,
counter_out
);

endmodule