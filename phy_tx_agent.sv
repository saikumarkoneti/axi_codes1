class  phy_tx_agent extends uvm_agent;
 `uvm_component_utils(phy_tx_agent)
 `COMP
  phy_tx_drv tx_drv;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     tx_drv=phy_tx_drv::type_id::create("tx_drv",this);
  endfunction

endclass
