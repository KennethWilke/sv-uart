module top (
  input wire clk, // 100MHz
  input wire reset,
  input wire rx,
  output wire tx
);

  Uart uart(clk, reset, rx, tx);

endmodule
