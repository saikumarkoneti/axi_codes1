class phy_rx_base_seq extends uvm_sequence#(eth_frame);
 `uvm_object_utils(phy_rx_base_seq)
 `OBJ
endclass

class phy_rx_gen_frame_seq extends phy_rx_base_seq;
  `uvm_object_utils(phy_rx_gen_frame_seq)
  `OBJ
  task body();
    `uvm_do_with(req,{req.len==128;})
  endtask
endclass

