# ip_repo
My IP repository for Xilinx projects

## IP Descriptions 
### ov7670_decode_stream
Decode video data from OV7670 and package into AXI4 Stream protocol. Pixels come as the RGB565 format.  `TUSER` indicates the first **valid** beat of  a frame; while `TUSER` as the last **valid** beat of a line. 
#### Register Address Map
| Address Offset | Access | Default |                                           Descriptions                                          |
|:--------------:|:------:|:-------:|:-----------------------------------------------------------------------------------------------:|
|       00h      |    W   |  0000h  | Run. The IP will begin to capture and stream the first frame from OV7670 after it receives 1h.  |