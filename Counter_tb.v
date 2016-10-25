`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Four_bit_down_counter_with_load_enable_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module Four_bit_up_down_counter_with_reset_enable_behavior_tb(
    );

    reg Clock, Enable, Reset, up_down;
    wire [3:0] Q;

	Four_bit_up_down_counter_with_reset_enable_behavior DUT (.Clock(Clock), .Reset(Reset), .Enable(Enable), .up_down(up_down), .Q(Q));

    initial
    begin
        Clock = 0;
        forever
        begin
          #5 Clock = 1;
          #5 Clock = 0;
        end
    end

    initial
    begin
      Enable = 0; Reset = 0; up_down = 1;
      #20 Enable = 1;
      #20 Reset = 1;
      #20 Reset = 0;
      #80 Enable = 0;
      #40 Enable = 1;
      #400 Reset = 1;
      #20 Reset = 0;
      
      #100 up_down = 0;
      #20 Reset = 1;
      #20 Reset = 0;
      #20 Enable = 1;
      #20 Reset = 1;
      #20 Reset = 0;
      #80 Enable = 0;
      #40 Enable = 1;
      #400 Reset = 1;
      #20 Reset = 0;
      #40;

      $finish;
    end

endmodule
