/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input [4:0] button,
    output reg red_led,
    output reg [1:0] enter_led,
    output reg [1:0] guess_led,
    output reg [5:0] button_col,
    input [4:0] button_row,
    output reg [6:0] seven_seg,
    output reg [5:0] seg_sel,
    output reg gnd,
    output reg pwr
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_state_m_red_led;
  wire [2-1:0] M_state_m_enter_led;
  wire [2-1:0] M_state_m_guess_led;
  wire [6-1:0] M_state_m_button_col;
  wire [7-1:0] M_state_m_seven_seg;
  wire [6-1:0] M_state_m_seg_sel;
  reg [5-1:0] M_state_m_button;
  reg [5-1:0] M_state_m_button_row;
  state_m_2 state_m (
    .clk(clk),
    .rst(rst),
    .button(M_state_m_button),
    .button_row(M_state_m_button_row),
    .red_led(M_state_m_red_led),
    .enter_led(M_state_m_enter_led),
    .guess_led(M_state_m_guess_led),
    .button_col(M_state_m_button_col),
    .seven_seg(M_state_m_seven_seg),
    .seg_sel(M_state_m_seg_sel)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    red_led = M_state_m_red_led;
    enter_led = M_state_m_enter_led;
    guess_led = M_state_m_guess_led;
    seven_seg = M_state_m_seven_seg;
    seg_sel = M_state_m_seg_sel;
    gnd = 1'h0;
    pwr = 1'h1;
    button_col = M_state_m_button_col;
    M_state_m_button_row = button_row;
    M_state_m_button = button;
  end
endmodule
