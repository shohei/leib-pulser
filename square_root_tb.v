`timescale 10ns / 100ps
module test_square_root;

reg[15:0] Z;
wire[7:0] Q;

initial begin
  $dumpfile("square_root.vcd");
  $dumpvars(0,s);
end

initial begin
  Z = 16'd81;
  #10 $finish;
end

square_root s(
  .z(Z),
  .q(Q)
);


endmodule
