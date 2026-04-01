module sub (a,b,ctrl,Cout,sum); // to turn this into subtration b complement is used 

input [3:0] a;
input [3:0] b;
input ctrl;
output [3:0] sum;
output [3:0] Cout;
wire w1,w2,w3,w4;

xor G1(w1,b[0],ctrl);
xor G2(w2,b[1],ctrl);
xor G3(w3,b[2],ctrl);
xor G4(w4,b[3],ctrl);

FA (a[0],w1,ctrl,sum[0],Cout[0]); // the wire coming out of this FA will enter the next and so on 
FA (a[1],w2,Cout[0],sum[1],Cout[1]);
FA (a[2],w3,Cout[1],sum[2],Cout[2]);
FA (a[3],w4,Cout[2],sum[3],Cout[3]); 

endmodule