class counter_test extends uvm_test;
  `uvm_component_utils(counter_test)

  counter_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = counter_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    counter_sequence seq;
    seq = counter_sequence::type_id::create("seq");
    seq.start(env.agent.sqr);
  endtask
endclass

class counter_sequence extends uvm_sequence #(counter_transaction);
  `uvm_object_utils(counter_sequence)

  function new(string name = "counter_sequence");
    super.new(name);
  endfunction

  task body();
    counter_transaction tr;
    // Example: generate a few random transactions
    repeat (10) begin
      tr = counter_transaction::type_id::create("tr");
      assert(tr.randomize());
      start_item(tr);
      finish_item(tr);
    end
  endtask
endclass
