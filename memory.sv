class memory extends uvm_component;
  
  `uvm_component_utils(memory)
  `COMP
  bit [31:0] mem[int];
  virtual wb_mem_intf  vif; 
  function void build_phase(uvm_phase phase);
     if(!uvm_config_db#(virtual interface wb_mem_intf)::get(this,"","MEM_INTF",vif))
        `uvm_error(get_full_name()," problem in virtual handle getting") 
  endfunction 
  
  function void start_of_simulation_phase(uvm_phase phase);
     super.start_of_simulation_phase(phase);
     for(int i=0;i<512/4;i++) begin
       mem[32'h1000_0000+4*i]=$random;
     end
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
     @(posedge vif.slave_cb);
     if(vif.slave_cb.m_wb_cyc_o && vif.m_wb_stb_o) begin
        vif.slave_cb.m_wb_ack_i<=1'b1;
        if(vif.slave_cb.m_wb_we_o==1'b1) begin
         mem[vif.slave_cb.m_wb_adr_o] = vif.m_wb_dat_o;
        end
        else begin
           if(mem.exists(vif.slave_cb.m_wb_adr_o)) begin
              vif.slave_cb.m_wb_dat_i<=mem[vif.m_wb_adr_o];
              //$display(vif.slave_cb.m_wb_adr_o);
           end
           else begin  
	      $display("read is happening but not from intended location");
	      $display(vif.m_wb_adr_o);
              //vif.m_wb_dat_i=32'h68;
            end
        end
     end
     else begin
       vif.m_wb_ack_i=1'b0;
       vif.m_wb_dat_i=0;
     end
    end
  endtask
endclass
