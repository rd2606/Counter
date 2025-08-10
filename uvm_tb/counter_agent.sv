class counter_agent extends uvm_agent;
  `uvm_component_utils(counter_agent)

  counter_sequencer sqr;
  counter_driver drv;
  counter_monitor mon;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sqr = counter_sequencer::type_id::create("sqr", this);
    drv = counter_driver::type_id::create("drv", this);
    mon = counter_monitor::type_id::create("mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction
endclass
