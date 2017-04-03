`timescale 10ns / 100ps
module pulser_tb;

reg CLK ;
reg RST ;
wire LED;

//initialize output file
initial begin
  $dumpfile("pulser.vcd");
  $dumpvars(0, p);
end

//initialize CLK
initial begin
  CLK = 1'b0;
  forever begin
    #1.563 CLK = !CLK;
  end
end

//initialize RST
initial begin
  #5 RST  = 1'b1; 
  #5 RST = 1'b0; 
end

//ititialize simulation time
initial begin
  #1000000 $finish;
end

pulser p(CLK, RST, LED);

endmodule
