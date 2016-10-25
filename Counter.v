`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Four_bit_up_down_counter_with_reset_load_enable_behavior
//////////////////////////////////////////////////////////////////////////////////

module Four_bit_up_down_counter_with_reset_enable_behavior(
    input Clock,      // Clock signal
    input Reset,      // Reset signal
    input Enable,     // Enable signal
    input up_down,    // Counting Direction (Up if Hi, Down if Low)
    output [3:0] Q    // 4 bit Output value (0-F)
    );

    reg [3:0] count;
    wire cnt_Up_done;
    wire cnt_Dwn_done;

    assign cnt_Up_done = & count;     // Logical AND, Hi if count = F
    assign cnt_Dwn_done = ~| count;   // Logical NOR, Hi if count = 0
    assign Q = count;                 // Output value

    always @(posedge Clock) begin
      if (Reset)                // Reset high signal
         count <= 0;
      else if (Enable) begin // Begin counting Down (Value-0)
          if (up_down)
            if (cnt_Up_done)
              count <= 4'b0000;
            else
              count <= count + 1;
          else if (~up_down)
            if (cnt_Dwn_done)
              count <= 4'b1111;
            else
              count <= count - 1;
        end
    end
endmodule
