module Uart (
    input clk,
    input reset,
    input rx,
    output tx
);

  logic [7:0] data;
  logic echo;

  UartRxBuffer receive_buffer(clk, reset, rx, echo, data);
  UartTxBuffer send_buffer(clk, reset, echo, data, tx);

endmodule
