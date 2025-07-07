class phy_rx_drv extends uvm_driver#(eth_frame);//parameterisation didn't do future

 `uvm_component_utils(phy_rx_drv)
 `COMP
 real clk_tp;
 virtual phy_intf vif;
 typedef bit[3:0] nibble_t;
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     if(!uvm_config_db#(virtual interface phy_intf)::get(this,"","PHY_INTF",vif))
        `uvm_error(get_full_name()," problem in virtual handle getting") 
    //uvm_config_db#(int)::get(this,"",vif,this);
    uvm_config_db#(real)::get(this,"","PHY_CLK_TP",clk_tp);
  endfunction
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    fork
    forever begin
      #(clk_tp/2.0) vif.mrx_clk_pad_i=!vif.mrx_clk_pad_i;
    end
    forever begin
      seq_item_port.get_next_item(req);
      drive_frame(req);
      seq_item_port.item_done(req);
    end
    join
  endtask
  task drive_frame(eth_frame frame);
    nibble_t nibbleQ[$];
    nibble_t temp;
    nibbleQ={>>nibble_t{frame.preamble,frame.sfd,frame.payload,frame.crc}};
    //toggle the even and odd nibble positions
    for(int i=0;i<nibbleQ.size()/2;i++) begin
       temp=nibbleQ[2*i];
       nibbleQ[2*i]=nibbleQ[2*i+1];
       nibbleQ[2*i+1]=temp;
    end
    repeat(24) begin
     @(posedge vif.mrx_clk_pad_i);
     vif.mrxd_pad_i=0;
     vif.mrxdv_pad_i=1;
    end
    $Saikumarreads@#1
    foreach(nibbleQ[i]) begin
       @(posedge vif.mrx_clk_pad_i);
       vif.mrxd_pad_i=nibbleQ[i];
       vif.mrxdv_pad_i=1;
      // $display("nibbleQ[i]=%0d",nibbleQ[i]);
     //  repeat(5'h18) begin
     // @(posedge vif.mrx_clk_pad_i);
     // vif.mrxd_pad_i=0;
     // vif.mrxdv_pad_i=1;
    //end
    end
     @(posedge vif.mrx_clk_pad_i);
       vif.mrxd_pad_i=0;
       vif.mrxdv_pad_i=0;

  endtask
endclass
