module FIFO ( 
output reg [7:0] data_out, 
output full, empty, 
input [7:0] data_in, 
input clock, reset, wn, rn 
); 
reg [2:0] wptr, rptr; 
reg [7:0] memory [7:0]; 
// Initialize FIFO memory and pointers 
always @(posedge clock or posedge reset) begin 
if (reset) begin 
// Reset memory and pointers 
integer i; 
for (i = 0; i < 8; i = i + 1) 
memory[i] <= 0; 
data_out <= 0; 
wptr <= 0; 
rptr <= 0; 
end 
else begin 
// Write operation 
if (wn && !full) begin 
memory[wptr] <= data_in; 
wptr <= wptr + 1; 
end 
 
// Read operation 
if (rn && !empty) begin 
data_out <= memory[rptr]; 
rptr <= rptr + 1; 
 
end 
 
end 
end 
 
// FIFO full condition 
// assign full = ((wptr[2:1] == rptr[2:1]) && (wptr[0] != rptr[0])); 
// assign full= (wptr==15 && !rn && wn); 
assign full = ((wptr+1'b1) == rptr); 
// FIFO empty condition 
assign empty = (wptr == rptr); 
endmodule
