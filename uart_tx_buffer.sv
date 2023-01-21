module UartTxBuffer (
    input clk,
    input reset,
    input write,
    input [7:0] data,
    output logic tx
);

  logic [3:0] current_bit;
  logic [13:0] counter;
  logic [7:0] internal_data;

  always @ (posedge clk or negedge reset) begin
    if (!reset) begin
      current_bit <= 0;
      counter <= 0;
      internal_data <= 'h00;
    end else begin
      // send stuff! this reads :3
      if (current_bit) begin
        counter <= counter + 1;
        case (current_bit)
          1: begin
            if (counter == 867) begin
                current_bit <= 2;
            end
          end
          2: begin
            tx <= internal_data[0];
            if (counter == 1735) begin
                current_bit <= 3;
            end
          end
          3: begin
            tx <= internal_data[1];
            if (counter == 2603) begin
                current_bit <= 4;
            end
          end
          4: begin
            tx <= internal_data[2];
            if (counter == 3471) begin
                current_bit <= 5;
            end
          end
          5: begin
            tx <= internal_data[3];
            if (counter == 4339) begin
                current_bit <= 6;
            end
          end
          6: begin
            tx <= internal_data[4];
            if (counter == 5207) begin
                current_bit <= 7;
            end
          end
          7: begin
            tx <= internal_data[5];
            if (counter == 6075) begin
                current_bit <= 8;
            end
          end
          8: begin
            tx <= internal_data[6];
            if (counter == 6943) begin
                current_bit <= 9;
            end
          end
          9: begin
            tx <= internal_data[7];
            if (counter == 7812) begin
                current_bit <= 10;
            end
          end
          10: begin
            tx <= 1;
            if (counter == 8680) begin
                current_bit <= 0;
            end
          end
        endcase
      end else begin
        counter <= 0;
        if (write) begin
          current_bit <= 1;
          internal_data <= data;
          tx <= 0;
        end else begin
          tx <= 1;
        end
      end
    end
  end

endmodule
