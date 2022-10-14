module pre(MuxSelect , MuxIn , Out);
    input logic [6:0] MuxIn;
    input logic [2:0] MuxSelect;
    output logic Out; // signal set by always_comb block
    always_comb // declare always_comb block
    begin
        case (MuxSelect) // start case statement
        3’b000: Out = MuxIn [0] // Case 0
        3’b001: Out = MuxIn [1] // Case 1
        3’b010: Out = MuxIn [2] // Case 2
        3’b011: Out = MuxIn [3] // Case 3
        3’b100: Out = MuxIn [4] // Case 4
        3’b101: Out = MuxIn [5] // Case 5
        3’b110: Out = MuxIn [6] // Case 6
        3’b111: Out = MuxIn [7] // Case 7
        default:  Out = MuxIn [0] // Case 7
        endcase
    end
endmodule