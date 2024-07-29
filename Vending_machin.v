module coke_vending_machine(
    input wire clk,
    input wire reset,
    input wire coin_inserted,
    output reg dispense_coke,
    output reg [1:0] change,
    output reg [1:0] current_amount
);

    // Parameters
    parameter COKE_PRICE = 2;
    parameter MAX_AMOUNT = 3;

    // State definition
    reg [1:0] state;
    parameter IDLE = 2'b00;
    parameter ACCEPTING = 2'b01;
    parameter DISPENSING = 2'b10;

    always @(posedge clk or posedge reset) 
      begin
        if (reset) begin
            state <= IDLE;
            current_amount <= 0;
            dispense_coke <= 0;
            change <= 0;
        end 
        else 
          begin
            case (state)
                IDLE: begin
                    if (coin_inserted) begin
                        state <= ACCEPTING;
                        current_amount <= 1;
                    end
                end

                ACCEPTING: begin
                    if (coin_inserted) begin
                        if (current_amount < MAX_AMOUNT) begin
                            current_amount <= current_amount + 1;
                        end
                    end

                    if (current_amount >= COKE_PRICE) begin
                        state <= DISPENSING;
                    end
                end

                DISPENSING: begin
                    dispense_coke <= 1;
                    change <= current_amount - COKE_PRICE;
                    state <= IDLE;
                    current_amount <= 0;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
