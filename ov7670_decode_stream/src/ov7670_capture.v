module ov7670_capture(
  input               capture_rst,
  // OV7670 interface
  input               pclk,
  input               vsync,
  input               href,
  input       [7:0]   d,
  // AXIS pixel out interface
  output reg  [15:0]  tdata,
  output reg          tvalid,
  input               tready,
  output              tlast,
  output              tuser
    );

  parameter integer   WIDTH   = 640;
  parameter integer   HEIGHT  = 480;

  reg [15:0]  d_latch;
  reg [18:0]  address;
  reg [18:0]  address_next;  
  reg [1:0]   wr_hold;
  reg [10:0]  pixel;
  reg [10:0]  pixel_next;

  initial d_latch       = 16'b0;
  initial address       = 19'b0;
  initial address_next  = 19'b0;
  initial wr_hold       = 2'b0; 
  initial pixel         = 11'b0;
  initial pixel_next    = 11'b0;  


  always @(posedge pclk) begin 
    if (capture_rst || vsync) begin
      address       <=  19'b0;
      address_next  <=  19'b0;
      wr_hold       <=  2'b0;
      tvalid        <=  0;
    end else begin
      address       <=  address_next;
      tvalid        <=  wr_hold[1]; // Set to 1 one cycle after dout is updated

      // Get 1 byte from camera each cycle.  Have to get two bytes to form a pixel.
      // wr_hold is used to generate the write enable every other cycle.
      // No changes until href = 1 indicating valid data
      wr_hold <= {wr_hold[0] , (href && (!wr_hold[0]))};
      d_latch <= {d_latch[7:0] , d};

      if (wr_hold[1] == 1) begin  // increment write address and output new pixel
        address_next  <=  address_next + 1;
        tdata[15:0]   <= {d_latch[15:11] , d_latch[10:5] , d_latch[4:0] };
      end
    end
  end

  always @(posedge pclk) begin
    if (capture_rst || vsync) begin
      pixel         <=  11'b0;
      pixel_next    <=  11'b0;
    end else begin
      pixel     <= pixel_next;
      if (wr_hold[1] == 1) begin
        pixel_next <= pixel_next + 1;
      end else if (pixel == WIDTH) begin
        pixel_next <= 0;
      end
    end
  end

  assign tuser = tvalid && (address_next == 1);

  assign tlast = tvalid && (pixel_next == WIDTH);

endmodule
