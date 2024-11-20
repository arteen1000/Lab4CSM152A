module permutation #(parameter SIZE = 52) (
                   input [31:0]      inputArr[0:SIZE-1],
                   input             trigger, 
                   output reg [31:0] outputArr[0:SIZE-1]);
   
   
   integer                           i, j;
   reg [31:0]                        temp;
   
    always @(trigger)
        for (i = 0; i < SIZE; i = i + 1) begin
           outputArr[i] = inputArr[i];
        end

        // Print initial array
        $display("Initial array:");
        for (i = 0; i < SIZE; i = i + 1) begin
            $write("%0d ", arr[i]);
        end
        $display();

        // Fisher-Yates Shuffle
        for (i = SIZE - 1; i > 0; i = i - 1) begin
            j = $random % (i + 1); // Random index between 0 and i
            // Swap arr[i] and arr[j]
            temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        end

        // Print permuted array
        $display("Permuted array:");
        for (i = 0; i < SIZE; i = i + 1) begin
            $write("%0d ", arr[i]);
        end
        $display();
    end
endmodule
