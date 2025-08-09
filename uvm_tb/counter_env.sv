class counter_env extends uvm_env;
  `uvm_component_utils(counter_env)

  counter_agent agent;
  counter_scoreboard sb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = counter_agent::type_id::create("agent", this);
    sb = counter_scoreboard::type_id::create("sb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.mon.ap.connect(sb.analysis_export);
  endfunction
endclass
