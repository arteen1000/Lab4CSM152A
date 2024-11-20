module testing;
   integer i;
    reg [31:0] input_array [0:SIZE-1];
    wire [31:0] output_array [0:SIZE-1];
   reg          trigger;
   
   permutation #(8) uut (
                         .trigger(trigger),
                         .inputArr(input_array),
        .outputArr(output_array)         
                         );
   
   
initial begin

           $display("Initializing array:");
        for (i = 0; i < SIZE; i = i + 1) begin
            input_array[i] = i + 1; // Example: 1, 2, ..., SIZE
            $write("%0d ", input_array[i]);
        end

   trigger = ~trigger;
   
           // Wait for the permutation to complete (combinational logic)
        #1;

        // Display the permuted output array
        $display("Permuted array:");
        for (i = 0; i < SIZE; i = i + 1) begin
            $write("%0d ", output_array[i]);
        end
        $display();
end   
endmodule
