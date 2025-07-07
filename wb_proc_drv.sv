class  wb_proc_drv extends uvm_driver#(wb_tx);
 `uvm_component_utils(wb_proc_drv)
 `COMP
 virtual wb_proc_intf vif;
 wb_tx tx;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual interface wb_proc_intf)::get(this,"","PROC_INTF",vif))
      `uvm_error(get_name(),"wishbone slave interface not set properly")
  endfunction
  task run_phase(uvm_phase phase);
    fork 
    forever begin
      seq_item_port.get_next_item(req);
      //req.print();
      drive(req);
      seq_item_port.item_done();
    end
    forever begin
      @(posedge vif.int_o);
      ethmac_common::int_o_generated=1;
    end
    join_none
  endtask 
  task drive(wb_tx tx);
    @(posedge vif.wb_clk_i);
    vif.wb_adr_i<=tx.addr;
    vif.wb_we_i<=tx.wr_rd;
    if(tx.wr_rd==1) vif.wb_dat_i<=tx.data;
    vif.wb_sel_i<=4'hf;
    vif.wb_cyc_i<=1'b1;
    vif.wb_stb_i<=1'b1;
    wait(vif.wb_ack_o==1)
    if(tx.wr_rd==0) tx.data=vif.wb_dat_o;
    //`uvm_info("REG_TEST",$psprintf("%s:addr=%h,data=%h",tx.wr_rd?"WRITE":"READ",tx.addr,tx.data),UVM_NONE)
    @(posedge vif.wb_clk_i);
    reset_signal();
  endtask
  task reset_signal(); 
    vif.wb_adr_i<=0;
    vif.wb_we_i<=0;
    vif.wb_dat_i<=0;
    vif.wb_sel_i<=0;
    vif.wb_cyc_i<=0;
    vif.wb_stb_i<=0;
  endtask
endclass
