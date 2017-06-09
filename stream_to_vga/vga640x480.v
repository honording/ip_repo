`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga640x480(
	input wire clk25,			//pixel clock: 25MHz
	input wire aresetn,			//asynchronous reset
	// VGA interface
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [3:0] red,	//red vga output
	output reg [3:0] green, //green vga output
	output reg [3:0] blue,	//blue vga output
	// AXIS data_in interface
	input wire [15:0] tdata,
    input wire tvalid,
    output reg tready,
    // VDMA sync
    output reg fsync,
    // HV counter
    output wire [9:0] hcounter,
    output wire [9:0] vcounter
	);

// video structure constants
parameter	hActiveArea		= 640;
parameter	hFrontPorch		= 16;
parameter	hSyncPulse		= 96;
parameter	hBackPorch		= 48;

parameter	vActiveArea		= 480;
parameter	vFrontPorch		= 11;
parameter	vSyncPulse		= 2;
parameter	vBackPorch		= 31;

localparam	hpixels 		= hActiveArea + hFrontPorch + hSyncPulse + hBackPorch;	// horizontal pixels per line
localparam 	hbp 			= hSyncPulse + hBackPorch;								// end of horizontal back porch
localparam	hfp 			= hbp + hActiveArea;									// beginning of horizontal front porch
localparam	hpulse 			= hSyncPulse;											// hsync pulse length

localparam	vlines 			= vActiveArea + vFrontPorch + vSyncPulse + vBackPorch;	// vertical lines per frame
localparam	vbp 			= vSyncPulse + vBackPorch;								// end of vertical back porch
localparam	vfp 			= vbp + vActiveArea;									// beginning of vertical front porch
localparam	vpulse 			= vSyncPulse;											// vsync pulse length


// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 513 - 33 = 480

assign hcounter = hc;
assign vcounter = vc;

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge clk25)
begin
	// reset condition
	if (~aresetn)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(*)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// -----------------
		// display
		if (hc >= hbp && hc < hfp)
		begin
		    red 	= tdata[15:12];
			green 	= tdata[10:7];
			blue 	= tdata[4:1];
			tready 	= 1;
		end
		// we're outside active horizontal range so display black
		else
		begin
			red 	= 0;
			green 	= 0;
			blue 	= 0;
			tready 	= 0;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red 	= 0;
		green 	= 0;
		blue 	= 0;
		tready 	= 0;
	end
end

reg vsync_last;
always@(posedge clk25)
begin
    if(~aresetn) begin
        vsync_last <= 0;
        fsync <= 0;
    end else begin
        vsync_last <= vsync;
        if (~vsync_last & vsync) begin
            fsync <= 1;
        end else begin
            fsync <= 0;
        end
    end
end

endmodule
