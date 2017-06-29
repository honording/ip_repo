// Code your design here
module axis_source (
  clk,
  rstn,
  tdata,
  tvalid,
  tready,
  tlast,
  tuser
);
  parameter PKG_WIDTH  = 2;
  
  
  input clk;
  input rstn;
  output [31:0] tdata;
  output tvalid;
  input tready;
  output tlast;
  output tuser;

  assign tvalid = 1'b1;
  reg [PKG_WIDTH - 1 : 0] counter; 
  // 10: 0 - 1023
  //  4: 0 - 31
  //  1: 0 - 3
  
  always @(posedge clk) begin
    if (!rstn) begin
      counter <= {PKG_WIDTH{1'b0}};
    end else if (tready) begin
      counter <= counter + {{(PKG_WIDTH - 1){1'b0}},{1'b1}};
    end else begin
      counter <= counter;
    end
  end
  
  assign tdata = counter;
  
  assign tlast = counter == {PKG_WIDTH{1'b1}};
  assign tuser = 1'b0;
  
endmodule