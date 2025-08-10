class counter_monitor extends uvm_monitor;
  `uvm_component_utils(counter_monitor)

  virtual counter_if vif;
  uvm_analysis_port #(counter_transaction) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual counter_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
    counter_transaction tr;
    forever begin
      @(posedge vif.clk);
      tr = counter_transaction::type_id::create("tr");
      tr.mode = vif.mode;
      tr.clr = vif.clr;
      tr.ld = vif.ld;
      tr.d_in = vif.d_in;
      tr.count = vif.count;
      ap.write(tr);
    end
  endtask
endclass
