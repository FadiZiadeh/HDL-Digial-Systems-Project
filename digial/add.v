module add (input [3:0] a,b, input bin, output cout, output [3:0] result); 

wire [2:0] w; //full adder requires 3 wires to connect between gates 
FA (a[0],b[0],bin,w[0],result[0]); // the wire coming out of this FA will enter the next and so on 
FA (a[1],b[1],w[0],w[1],result[1]);
FA (a[2],b[2],w[1],w[2],result[2]);
FA (a[3],b[3],w[2],cout,result[3]); 

endmodule