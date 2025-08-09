`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "counter_if.sv"
`include "uvm_testbench_pkg.sv"

module tb_counter_8bit_uvm;
  bit clk;
  counter_if cif(clk);

  // DUT instance
  counter_8bit dut(
    .mode(cif.mode),
    .clr(cif.clr),
    .ld(cif.ld),
    .d_in(cif.d_in),
    .clk(clk),
    .count(cif.count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // UVM config
  initial begin
    uvm_config_db#(virtual counter_if)::set(null, "*", "vif", cif);
    run_test("counter_test");
  end
endmodule
