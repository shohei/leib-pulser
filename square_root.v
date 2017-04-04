module square_root(
  input [15:0] z,
  output [7:0] q
);

wire [7:0] q;

//7th stage
wire [16:14] z7;
assign       z7[16]    = 1'b0;
assign       z7[15:14] = z[15:14];
wire [16:14] r7        = z7 - {2'b01};
assign       q[7]      = ~r7[16];

//6th stage
wire [16:12] z6;
assign       z6[16:14] = {q[7]} ? r7 : z7;
assign       z6[13:12] = z[13:12];
wire [16:12] r6        = z6 - {q[7],2'b01};
assign       q[6]      = ~r6[16];

//5th stage
wire [15:10] z5;
assign       z5[15:12] = {q[6]} ? r6 : z6;
assign       z5[11:10] = z[11:10];
wire [15:10] r5        = z5 - {q[7:6],2'b01};
assign       q[5]      = ~r5[15];

//4th stage
wire [14:8]  z4;
assign       z4[14:10] = {q[5]} ? r5 : z5;
assign       z4[9:8]   = z[9:8];
wire [14:8]  r4        = z4 - {q[7:5],2'b01};
assign       q[4]      = ~r4[14];

//3rd stage
wire [13:6]  z3;
assign       z3[13:8] = {q[4]} ? r4 : z4;
assign       z3[7:6]   = z[7:6];
wire [13:6]  r3        = z3 - {q[7:4],2'b01};
assign       q[3]      = ~r3[13];

//2nd stage
wire [12:4]  z2;
assign       z2[12:6] = {q[3]} ? r3 : z3;
assign       z2[5:4]   = z[5:4];
wire [12:4]  r2        = z2 - {q[7:3],2'b01};
assign       q[2]      = ~r2[12];

//1st stage
wire [11:2]  z1;
assign       z1[11:4] = {q[2]} ? r2 : z2;
assign       z1[3:2]   = z[3:2];
wire [11:2]  r1        = z1 - {q[7:2],2'b01};
assign       q[1]      = ~r1[11];

//zero stage
wire [10:0]  z0;
assign       z0[10:2] = {q[1]} ? r1 : z1;
assign       z0[1:0]   = z[1:0];
wire [10:0]  r0        = z0 - {q[7:1],2'b01};
assign       q[0]      = ~r0[10];


endmodule

