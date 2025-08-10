interface counter_if(input bit clk);
  logic mode, clr, ld;
  logic [7:0] d_in;
  logic [7:0] count;
endinterface
