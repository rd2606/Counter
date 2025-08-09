class counter_scoreboard extends uvm_component;
  `uvm_component_utils(counter_scoreboard)

  uvm_analysis_imp #(counter_transaction, counter_scoreboard) analysis_export;
  bit [7:0] ref_count = 0;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
  endfunction

  function void write(counter_transaction tr);
    if (tr.ld)
      ref_count = tr.d_in;
    else if (tr.clr)
      ref_count = 0;
    else if (tr.mode)
      ref_count = ref_count + 1;
    else
      ref_count = ref_count - 1;

    if (tr.count !== ref_count)
      `uvm_error("COUNT_MISMATCH", $sformatf("Expected: %0h, Got: %0h", ref_count, tr.count))
  endfunction
endclass
