class counter_driver extends uvm_driver #(counter_transaction);
  `uvm_component_utils(counter_driver)

  virtual counter_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual counter_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
    counter_transaction tr;
    forever begin
      seq_item_port.get_next_item(tr);
      vif.mode <= tr.mode;
      vif.clr <= tr.clr;
      vif.ld <= tr.ld;
      vif.d_in <= tr.d_in;
      @(posedge vif.clk);
      seq_item_port.item_done();
    end
  endtask
endclass
