class ethmac_base_test extends uvm_test;
 `uvm_component_utils(ethmac_base_test)
 `COMP
  ethmac_env env;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=ethmac_env::type_id::create("env",this);
  endfunction
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

endclass
class ethmac_reg_read_test extends ethmac_base_test;
  `uvm_component_utils(ethmac_reg_read_test)
  `COMP
  wb_reg_read_seq read_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  task run_phase(uvm_phase phase);
   read_seq=wb_reg_read_seq::type_id::create("read_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,100);
   read_seq.start(env.proc_agent_i.sqr);
   phase.drop_objection(this);
  endtask
endclass

class ethmac_reg_write_read_test extends ethmac_base_test;
  `uvm_component_utils(ethmac_reg_write_read_test)
  `COMP
  wb_reg_write_read_seq write_read_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  task run_phase(uvm_phase phase);
   write_read_seq=wb_reg_write_read_seq::type_id::create("write_read_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,100);
   write_read_seq.start(env.proc_agent_i.sqr);
   phase.drop_objection(this);
  endtask
endclass


class mac_reg_wr_rd_rm_test extends ethmac_base_test;
  `uvm_component_utils(mac_reg_wr_rd_rm_test)
  `COMP
  wb_reg_wr_rd_rm_seq write_read_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
   write_read_seq=wb_reg_wr_rd_rm_seq::type_id::create("write_read_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,100);
   write_read_seq.start(env.proc_agent_i.sqr);
   phase.drop_objection(this);
  endtask
endclass


class mac_reg_wr_rd_bd_rm_test extends ethmac_base_test;
  `uvm_component_utils(mac_reg_wr_rd_bd_rm_test)
  `COMP
  wb_reg_wr_rd_bd_rm_seq write_read_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
   write_read_seq=wb_reg_wr_rd_bd_rm_seq::type_id::create("write_read_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,100);
   write_read_seq.start(env.proc_agent_i.sqr);
   phase.drop_objection(this);
  endtask
endclass


class mac_reg_read_rm_test extends ethmac_base_test;
  `uvm_component_utils(mac_reg_read_rm_test)
  `COMP
  wb_reg_read_rm_seq write_read_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
   write_read_seq=wb_reg_read_rm_seq::type_id::create("write_read_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,100);
   write_read_seq.start(env.proc_agent_i.sqr);
   phase.drop_objection(this);
  endtask
endclass


//class mac_10mbps_fd_tx_test extends ethmac_base_test;
//  `uvm_component_utils(mac_10mbps_fd_tx_test)
//  `COMP
//  mac_fd_tx_seq fd_tx_seq;
//  function void build_phase(uvm_phase phase);
//    super.build_phase(phase);
//    //10MHZ
//    uvm_config_db#(real)::set(this,"*","PHY_CLK_TP",400);
//  endfunction
//
//  task run_phase(uvm_phase phase);
//   fd_tx_seq =mac_fd_tx_seq::type_id::create("fd_tx_seq");
//   phase.raise_objection(this);
//   phase.phase_done.set_drain_time(this,100);
//   fd_tx_seq.start(env.proc_agent_i.sqr);
//   #100000;//TODO
//   phase.drop_objection(this);
//  endtask
//endclass



class mac_fd_tx_test extends ethmac_base_test;
  `uvm_component_utils(mac_fd_tx_test)
  `COMP
  mac_fd_tx_seq fd_tx_seq; 
  mac_isr_seq isr_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //100Mbps
    //uvm_config_db#(real)::set(this,"*","PHY_CLK_TP",40);
    //10Mbps
    uvm_config_db#(real)::set(this,"*","PHY_CLK_TP",400);

    ethmac_common::expected_intsrc_value=7'b0000_0001;
  endfunction

  task run_phase(uvm_phase phase);
   fd_tx_seq =mac_fd_tx_seq::type_id::create("fd_tx_seq");
   isr_seq=mac_isr_seq::type_id::create("isr_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,500);
   fork
     isr_seq.start(env.proc_agent_i.sqr);
   join_none
   fd_tx_seq.start(env.proc_agent_i.sqr);
   wait(ethmac_common::int_o_generated==1)
   ethmac_common::int_o_generated=0;
   phase.drop_objection(this);
  endtask
endclass


class mac_fd_rx_test extends ethmac_base_test;
  `uvm_component_utils(mac_fd_rx_test)
  `COMP
  mac_fd_rx_seq  fd_rx_seq;
  phy_rx_gen_frame_seq rx_frame;
  mac_isr_seq isr_seq;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //100Mbps
    //uvm_config_db#(real)::set(this,"*","PHY_CLK_TP",40);
    //10Mbps
    uvm_config_db#(real)::set(this,"*","PHY_CLK_TP",400);

    ethmac_common::expected_intsrc_value=7'b0000_0001;
  endfunction

  task run_phase(uvm_phase phase);
   fd_rx_seq =mac_fd_rx_seq::type_id::create("fd_rx_seq");
   rx_frame=phy_rx_gen_frame_seq::type_id::create("rx_frame");
   isr_seq=mac_isr_seq::type_id::create("isr_seq");
   phase.raise_objection(this);
   phase.phase_done.set_drain_time(this,500);
   fork
     isr_seq.start(env.proc_agent_i.sqr);
   join_none
   fd_rx_seq.start(env.proc_agent_i.sqr);
   rx_frame.start(env.phy_rx_agent_i.rx_sqr);
   wait(ethmac_common::int_o_generated==1)
   ethmac_common::int_o_generated=0;
   phase.drop_objection(this);
  endtask
endclass


















  //we did raiPHY_INTFse obejction in prebody also but this down v are not using so it
  //will not be triggered
  //function void build_phase(uvm_phase phase);
  //uvm_config_db#(uvm_object_wrapper)::set(this,
  //"env.proc_agent_i.sqr.run_phase","default_sequence",wb_reg_read_seq::
  //get_type());
  //endfunction















  //we did raise obejction in prebody also but this down v are not using so it
  //will not be triggered
  //function void build_phase(uvm_phase phase);
  //uvm_config_db#(uvm_object_wrapper)::set(this,
  //"env.proc_agent_i.sqr.run_phase","default_sequence",wb_reg_read_seq::
  //get_type());
  //endfunction
