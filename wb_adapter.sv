class wb_adapter extends uvm_reg_adapter;
`uvm_object_utils(wb_adapter)
 `OBJ
 virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
   wb_tx ub=wb_tx::type_id::create("ub");
   ub.wr_rd=(rw.kind==UVM_READ)?'b0:'b1;
   ub.addr=rw.addr;
   ub.data=rw.data;
   return ub;
 endfunction
virtual function void bus2reg(uvm_sequence_item  bus_item, ref uvm_reg_bus_op rw); // 2 arguments	
   wb_tx itm;						// instance of xtn class
  
  if(!$cast(itm, bus_item)) begin
   `uvm_fatal("NOT UB_TYPE","Provided bus item is not correct")
   return ;
  end	  // to get correct child class  
  rw.kind = (itm.wr_rd) ? UVM_WRITE : UVM_READ;			// updating the reg txn with bus txn
  rw.data = itm.data;
  rw.addr = itm.addr;
  rw.status = UVM_IS_OK;
endfunction: bus2reg 
endclass	
