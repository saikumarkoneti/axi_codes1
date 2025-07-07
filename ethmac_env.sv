
class ethmac_env extends uvm_env;
 `uvm_component_utils(ethmac_env)
 `COMP
  wb_proc_agent   proc_agent_i;
  wb_mem_agent    mem_agent_i;
  phy_tx_agent   phy_tx_agent_i;
  phy_rx_agent   phy_rx_agent_i;
  mii_agent       mii_agent_i;
  ethmac_reg_block mac_reg_block;
  wb_adapter adapter;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    proc_agent_i   =wb_proc_agent::type_id::create("proc_agent_i",this);  
    mem_agent_i   =wb_mem_agent::type_id::create("mem_agent_i",this);
    phy_tx_agent_i=phy_tx_agent::type_id::create("phy_tx_agent_i",this);
    phy_rx_agent_i=phy_rx_agent::type_id::create("phy_rx_agent_i",this);
    mii_agent_i   =mii_agent::type_id::create("mii_agent_i",this);
    mac_reg_block=ethmac_reg_block::type_id::create("mac_reg_block",this);
    adapter=wb_adapter::type_id::create("adapter");
    mac_reg_block.build();
    uvm_resource_db#(ethmac_reg_block)::set("GLOBAL","MAC_RM",mac_reg_block,this);
  endfunction  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mac_reg_block.wb_map.set_sequencer(proc_agent_i.sqr,adapter);
  endfunction
 endclass 
