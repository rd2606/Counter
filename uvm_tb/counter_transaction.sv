class counter_transaction extends uvm_sequence_item;
  rand bit mode, clr, ld;
  rand bit [7:0] d_in;
  bit [7:0] count;

  `uvm_object_utils(counter_transaction)

  function new(string name = "counter_transaction");
    super.new(name);
  endfunction

  function void do_copy(uvm_object rhs);
    counter_transaction tr;
    if (!$cast(tr, rhs)) return;
    mode = tr.mode;
    clr = tr.clr;
    ld = tr.ld;
    d_in = tr.d_in;
    count = tr.count;
  endfunction
endclass
