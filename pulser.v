module pulser(
  input CLK,RST,
  output DOUT
);

// reg[34:0] cnt;
// wire en1khz = (cnt==35'd32_000);

reg[3:0] cur,nxt;
reg[34:0] pitch;
parameter TRIG=4'd0, IDLE=4'd1, ACCEL=4'd2, SLEW=4'd3, DECEL=4'd4;
parameter V0=8'd5; 
parameter V=8'd25; 
parameter a=8'd10; 
parameter F=12'd2000; 
parameter totalstep=8'd150;
parameter PULSE_ON_TIME=8'd100; //2.0(us) / 31.25(ns) = 64.0 => 70 
reg dout;

//state machine control cycle 
always @( posedge CLK, posedge RST ) begin
  if ( RST )
    cur <= IDLE;
  else
    cur <= nxt;
end

//pitch computation
always @* begin



end

//pin output
always @* begin
  case(cur)
    IDLE:
      
    ACCEL:


  endcase
end

//state machine definition 
always @* begin
  case (cur)
    IDLE:    nxt <= IDLE;
    ACCEL: if(x < S) 
             nxt <= ACCEL;
           else if (x <  totalstep - S)
             nxt <= SLEW; 
    SLEW:  if(x < totalstep - S)
             nxt <= ACCEL;
           else
             nxt <= DECEL;
    DECEL: if(x==totalstep)
             nxt <= DECEL;
           else
             nxt <= IDLE;
  endcase
end

// always @(posedge CLK) begin
//   if(RST)
  //     cnt <= 35'd0;
  //   else if(en1khz)
    //     cnt <= 35'd0;
    //   else
      //     cnt <= cnt + 35'd1;
      // end

      // always @(posedge CLK) begin
      //   if(RST)
        //     dout <= 1'b0;
        //   else if(en1khz)
          //     dout <= ~dout;
          // end

          // assign DOUT = dout;

endmodule
