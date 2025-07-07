class phy_rx_agent extends uvm_agent;
 phy_rx_drv rx_drv;
 phy_rx_seqr rx_sqr;
 `uvm_component_utils(phy_rx_agent)
 `COMP
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rx_drv=phy_rx_drv::type_id::create("rx_drv",this);
    rx_sqr=phy_rx_seqr::type_id::create("rx_sqr",this);
  endfunction
  function void connect_phase(uvm_phase phase);
    rx_drv.seq_item_port.connect(rx_sqr.seq_item_export);
  endfunction
endclass
