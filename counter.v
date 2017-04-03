module counter (
  input CLK,RST,
  output LED
);

reg led;
reg[34:0] cnt;
// wire en1hz = (cnt==35'd32_000_000);
// wire en10hz = (cnt==35'd3_200_000);
// wire en100hz = (cnt==35'd320_000);
wire en1khz = (cnt==35'd32_000);

always @(posedge CLK) begin
  if(RST)
    cnt <= 35'd0;
  else if(en1khz)
    cnt <= 35'd0;
  else
    cnt <= cnt + 35'd1;
end

always @(posedge CLK) begin
  if(RST)
    led <= 1'b0;
  else if(en1khz)
    led <= ~led;
end

assign LED = led;


endmodule
