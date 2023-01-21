module UartRxBuffer (
    input clk,
    input reset,
    input rx,
    output logic available,
    output logic [7:0] data
);

  logic [3:0] current_bit;
  logic [13:0] counter;

  always @ (posedge clk or negedge reset) begin
    if (!reset) begin
      current_bit <= 0;
      available <= 0;
    end else begin
      if (current_bit) begin
        counter <= counter + 1;
        case (current_bit)
          1: begin
            if (counter == 1301) begin
                data[0] <= rx;
                current_bit <= 2;
            end
          end
          2: begin
            if (counter == 2169) begin
                data[1] <= rx;
                current_bit <= 3;
            end
          end
          3: begin
            if (counter == 3037) begin
                data[2] <= rx;
                current_bit <= 4;
            end
          end
          4: begin
            if (counter == 3905) begin
                data[3] <= rx;
                current_bit <= 5;
            end
          end
          5: begin
            if (counter == 4773) begin
                data[4] <= rx;
                current_bit <= 6;
            end
          end
          6: begin
            if (counter == 5641) begin
                data[5] <= rx;
                current_bit <= 7;
            end
          end
          7: begin
            if (counter == 6509) begin
                data[6] <= rx;
                current_bit <= 8;
            end
          end
          8: begin
            if (counter == 7377) begin
                data[7] <= rx;
                available <= 1;
                current_bit <= 9;
            end
          end
          9: begin
            if (counter == 8680) begin
                current_bit <= 0;
            end
          end
        endcase
      end else begin
        counter <= 0;
        available <= 0;
        if (!rx) begin
            current_bit <= 1;
        end
      end
    end
  end

endmodule
