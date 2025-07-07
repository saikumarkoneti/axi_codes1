class wb_proc_base_seq extends uvm_sequence#(wb_tx);
 `uvm_object_utils(wb_proc_base_seq)
 `OBJ
endclass

class wb_reg_read_seq extends wb_proc_base_seq;
  `uvm_object_utils(wb_reg_read_seq)
  `OBJ
  task body();
    for(int i=0;i<21;i++) begin
      `uvm_do_with(req,{req.wr_rd==0;req.addr==i;})
    end
  endtask
endclass

//regsiter write read register test
class wb_reg_write_read_seq extends wb_proc_base_seq;
  `uvm_object_utils(wb_reg_write_read_seq)
  `OBJ
  reg [31:0] data_i;
  task body();
    for(int i=0;i<21;i++) begin
      data_i=$random&ethmac_common::regmaskA[i];//for masking reserved bits
      `uvm_do_with(req,{req.wr_rd==1;req.addr==i;req.data==data_i;})
    end
    for(int i=0;i<21;i++) begin
      `uvm_do_with(req,{req.wr_rd==0;req.addr==i;})
    end
  endtask
endclass

//Reg model write read register test 
class wb_reg_wr_rd_rm_seq extends wb_proc_base_seq;
  `uvm_object_utils(wb_reg_wr_rd_rm_seq)
  `OBJ
  uvm_reg mac_regs[$]; // Array of registers
  uvm_reg_data_t ref_data;
  rand uvm_reg_data_t data;
  uvm_reg_data_t mii_command_data;
  uvm_status_e status;
  task body();
    ethmac_reg_block mac_rm;
    int errors;
    super.body();
    uvm_resource_db#(ethmac_reg_block)::read_by_name("GLOBAL","MAC_RM",mac_rm,this);
    // Set up the data register handle array
    mac_rm.get_registers(mac_regs);
    //set error
    errors=0;
    //mac_regs.shuffle();
    repeat(10) begin
    mac_regs.shuffle();
    foreach(mac_regs[i]) begin
      // Randomize register content and then update
      if(!this.randomize()) begin
        `uvm_error("body", "randomization failed")
      end
      if(mac_regs[i].get_name()=="txbdnum")
        mac_regs[i].write(status, 'h10, .parent(this));
      else if(mac_regs[i].get_name()=="miicommand") begin
	mac_regs[i].write(status,data,.parent(this));
        mii_command_data=data;
      end
      else
	mac_regs[i].write(status,data,.parent(this));
    end
    if(mii_command_data[0]==1) begin
      mac_rm.miistatus.predict(3'b110);
    end
    mac_regs.shuffle();
    foreach(mac_regs[i]) begin
      ref_data=mac_regs[i].get();
      mac_regs[i].read(status,data,.parent(this));
      if(ref_data!=data) begin
         `uvm_error("REG_TEST_SEQ:",$sformatf("get/read:READ error for %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data))
	 errors++;
      end
      if(ref_data==data) begin
         `uvm_info("PASS:",$sformatf("get/read:READ passed %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data),UVM_NONE)
      end
    end
    end
  endtask: body
endclass



class wb_reg_wr_rd_bd_rm_seq extends wb_proc_base_seq;
  `uvm_object_utils(wb_reg_wr_rd_bd_rm_seq)
  `OBJ
  uvm_reg mac_regs[$]; // Array of registers
  uvm_reg_data_t ref_data;
  rand uvm_reg_data_t data;
  uvm_status_e status;
  task body();
    ethmac_reg_block mac_rm;
    int errors;
    super.body();
    uvm_resource_db#(ethmac_reg_block)::read_by_name("GLOBAL","MAC_RM",mac_rm,this);
    // Set up the data register handle array
    mac_rm.get_registers(mac_regs);
    //set error
    errors=0;
    //mac_regs.shuffle();
    //repeat(3) begin
    mac_regs.shuffle();
    foreach(mac_regs[i]) begin
	    $display("hi");
      // Randomize register content and then update
      if(!this.randomize()) begin
        `uvm_error("body", "randomization failed")
      end
      if(mac_regs[i].get_name()=="txbdnum")
        mac_regs[i].poke(status, 'h10, .parent(this));
      else if(mac_regs[i].get_name()=="miistatus")
	mac_regs[i].poke(status,'h3, .parent(this));
      else
	mac_regs[i].poke(status,data, .parent(this));
          end
    //mac_regs.shuffle();
    foreach(mac_regs[i]) begin
      ref_data=mac_regs[i].get();
      mac_regs[i].peek(status,data,.parent(this));
      if(ref_data!=data) begin
         `uvm_error("REG_TEST_SEQ:",$sformatf("get/read:READ error for %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data))
	 errors++;
      end
      if(ref_data==data) begin
         `uvm_info("PASS:",$sformatf("get/read:READ error for %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data),UVM_NONE)
      end
    end
    //end
  endtask: body
endclass



class wb_reg_read_rm_seq extends wb_proc_base_seq;
  `uvm_object_utils(wb_reg_read_rm_seq)
  `OBJ
  uvm_reg mac_regs[$]; // Array of registers
  uvm_reg_data_t ref_data;
  rand uvm_reg_data_t data;
  uvm_status_e status;
  task body();
    ethmac_reg_block mac_rm;
    int errors;
    super.body();
    uvm_resource_db#(ethmac_reg_block)::read_by_name("GLOBAL","MAC_RM",mac_rm,this);
    // Set up the data register handle array
    mac_rm.get_registers(mac_regs);
    //set error
    errors=0;
    mac_regs.shuffle();
    foreach(mac_regs[i]) begin
      ref_data=mac_regs[i].get_reset();
      mac_regs[i].read(status,data,.parent(this));
      if(ref_data!=data) begin
         `uvm_error("FRONT DOOR READ:",$sformatf("get/read:READ error for %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data))
	 errors++;
      end
      if(ref_data==data) begin
         `uvm_info("FRONT DOOR READ:",$sformatf("get/read:READ passed %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data),UVM_NONE)
      end
    end

  endtask: body
endclass


class mac_fd_tx_seq extends wb_proc_base_seq;
  `uvm_object_utils(mac_fd_tx_seq)
  `OBJ
  rand uvm_reg_data_t moder_data;
  bit[31:0] data_t;
  bit [31:0] mask_data;
  uvm_status_e status;
  task body();
    ethmac_reg_block mac_rm;
    int errors;
    super.body();
    uvm_resource_db#(ethmac_reg_block)::read_by_name("GLOBAL","MAC_RM",mac_rm,this);
    // Set up the data register handle array
    for(int i=0;i<17;i++) begin
      if(i==10)//FULLDUPLEX MODE
	 moder_data[i]=1;
      else 
	 moder_data[i]=0;
    end
    mask_data[0]=1'b1;
    mac_rm.intmask.write(status,mask_data);
    mac_rm.moder.write(status,moder_data);
    data_t={16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};//512 bytes
   `uvm_do_with(req,{req.addr==10'h100;req.data==data_t;req.wr_rd==1'b1;})
    data_t=32'h1000_0000;
   `uvm_do_with(req,{req.addr==10'h101;req.data==data_t;req.wr_rd==1'b1;})
    moder_data[1]=1;//TXEN=1
    mac_rm.moder.write(status,moder_data);
  endtask: body
endclass

class mac_fd_rx_seq extends wb_proc_base_seq;
  `uvm_object_utils(mac_fd_rx_seq)
  `OBJ
  rand uvm_reg_data_t moder_data;
  bit[31:0] data_t;
  bit [31:0] mask_data;
  uvm_status_e status;
  task body();
    ethmac_reg_block mac_rm;
    int errors;
    super.body();
    uvm_resource_db#(ethmac_reg_block)::read_by_name("GLOBAL","MAC_RM",mac_rm,this);
    // Set up the data register handle array
    for(int i=0;i<17;i++) begin
      if(i==10|i==5)//FULLDUPLEX MODE+Regardless of incoming address receive (promiscous mode)
	 moder_data[i]=1;
      else 
	 moder_data[i]=0;
    end
    mask_data[2]=1'b1;
    mac_rm.intmask.write(status,mask_data);
    mac_rm.moder.write(status,moder_data);
    data_t={16'd128,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};//128 bytes
   `uvm_do_with(req,{req.addr==10'h180;req.data==data_t;req.wr_rd==1'b1;})
    data_t=32'h2000_0000;
   `uvm_do_with(req,{req.addr==10'h181;req.data==data_t;req.wr_rd==1'b1;})
    moder_data[0]=1;//RXEN=1
    mac_rm.moder.write(status,moder_data);
  endtask: body
endclass



class mac_isr_seq extends wb_proc_base_seq;
  `uvm_object_utils(mac_isr_seq)
  `OBJ
  task body();
    uvm_status_e status;
    ethmac_reg_block mac_rm;
    uvm_reg_data_t int_src_data;
    uvm_resource_db#(ethmac_reg_block)::read_by_name("GLOBAL","MAC_RM",mac_rm,this);
    forever begin
      wait(ethmac_common::int_o_generated==1)
      `uvm_warning("INT_SRC","int_o generated")
      mac_rm.intsrc.read(status,int_src_data);
      $display(int_src_data,ethmac_common::int_o_generated);
      if(int_src_data!=ethmac_common::expected_intsrc_value)
	 `uvm_error("INT_SRC","Interrupt is generated not matched")
      else begin
          mac_rm.intsrc.write(status,int_src_data);
      end
      end
  endtask: body
endclass











  //mac_regs.shuffle();
    //repeat(3) begin
  //  mac_regs.shuffle();
  //  foreach(mac_regs[i]) begin
  //    // Randomize register content and then update
  //    if(!this.randomize()) begin
  //      `uvm_error("body", "randomization failed")
  //    end
  //    if(mac_regs[i].get_name()=="txbdnum")
  //      mac_regs[i].poke(status, 'h10, .parent(this));
  //    else if(mac_regs[i].get_name()=="miistatus")
  //      mac_regs[i].poke(status,'h3, .parent(this));
  //    else
  //      mac_regs[i].poke(status,data, .parent(this));
  //     `uvm_info("BACK DOOR WRITE:",$sformatf("poke/write:INFO for %s:Actual_dut_backdoor:%0h",mac_regs[i].get_name(),data),UVM_NONE)
  //  end
    //mac_regs.shuffle();
  //  foreach(mac_regs[i]) begin
  //    ref_data=mac_regs[i].get();
  //    mac_regs[i].peek(status,data,.parent(this));
  //    if(ref_data!=data) begin
  //       `uvm_error("REG_TEST_SEQ:",$sformatf("get/read:READ error for %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data))
  //       errors++;
  //    end
  //    if(ref_data==data) begin
  //       `uvm_info("PASS:",$sformatf("get/read:READ error for %s:Expected_rm:%0h Actual_dut:%0h",mac_regs[i].get_name(),ref_data,data),UVM_NONE)
  //    end
  //  end

