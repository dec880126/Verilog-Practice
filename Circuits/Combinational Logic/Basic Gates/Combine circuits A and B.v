module top_module (input x, input y, output z);
wire [3:0] z_temp;

task A;
    input x, y;
    output z;
    begin
        z = (x^y) & x;
    end
endtask

task B;
    input x, y;
    output z;
    begin
        if(x == y)
            z = 1;
        else
            z = 0;
    end
endtask

always @(*) begin
    A(x, y, z_temp[0]);
    B(x, y, z_temp[1]);
    A(x, y, z_temp[2]);
    B(x, y, z_temp[3]);
end

assign z = (z_temp[0] | z_temp[1]) ^ (z_temp[2] & z_temp[3]);


endmodule