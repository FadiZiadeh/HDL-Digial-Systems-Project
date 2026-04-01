module bor (input [3:0] a,b, output [3:0] cout); 

or (cout[0],a[0],b[0]); 
or (cout[1],a[1],b[1]); 
or (cout[2],a[2],b[2]); 
or (cout[3],a[3],b[3]); 

endmodule