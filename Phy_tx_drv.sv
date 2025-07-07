
class phy_tx_drv extends uvm_driver;//parameterisation didn't do future

 `uvm_component_utils(phy_tx_drv)
 `COMP
 real clk_tp;
 virtual phy_intf vif;
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     if(!uvm_config_db#(virtual interface phy_intf)::get(this,"","PHY_INTF",vif))
        `uvm_error(get_full_name()," problem in virtual handle getting") 
      uvm_config_db#(real)::get(this,"","PHY_CLK_TP",clk_tp);
  endfunction
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
      forever begin
      #(clk_tp/2.0) vif.mtx_clk_pad_i=~vif.mtx_clk_pad_i;
      end
  endtask
endclass
