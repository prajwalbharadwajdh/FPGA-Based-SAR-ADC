module sar_counter( 
  input ena, clk, rst, 
  output reg [7:0] out,
  output reg conversion_done
);

reg [3:0] len;	// Bit index (7 down to 0) reg trial_mode;		// 1: Trial, 0: Decision reg last_decision_cycle; // Done flag delay

always @(posedge clk) begin 
  if (rst) begin
    out <= 8'b0;
    len <= 7;	// Start MSB conversion_done <= 0;
    trial_mode <= 1'b1;	// Start in trial last_decision_cycle <= 0;
  end
  else begin
    if (last_decision_cycle) begin 
      conversion_done <= 1'b1; // Assert Done last_decision_cycle <= 0;
    end
    else if (!conversion_done) begin

      if (trial_mode) begin
        out[len] <= 1'b1; // Set trial bit trial_mode <= 1'b0; // Next is decision
      end
      else begin
        if (!ena) begin
          out[len] <= 1'b0; // Clear bit (Trial too high) 
        end

        if (len == 0) begin
          last_decision_cycle <= 1'b1; // LSB decision made 
        end
        else begin
          len <= len - 1; // Move to next bit 
          trial_mode <= 1'b1; // Next is trial
        end
      end  
    end
  end 
end
endmodule
