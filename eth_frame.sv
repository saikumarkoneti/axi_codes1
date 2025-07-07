class eth_frame extends uvm_sequence_item;
  `OBJ
   rand bit [55:0] preamble;
   rand bit [7:0] sfd;
   //Current MAC,frames doesn't have a destination and source address and
   //length field
   rand int len;
   rand bit [7:0] payload[$];
   bit [31:0] crc;
   `uvm_object_utils_begin(eth_frame)
    `uvm_field_int(preamble,UVM_ALL_ON)
    `uvm_field_int(sfd,UVM_ALL_ON)
    `uvm_field_int(len,UVM_ALL_ON|UVM_NOPACK)//Excluded in packing and unpacking
    `uvm_field_queue_int(payload,UVM_ALL_ON)
    `uvm_field_int(crc,UVM_ALL_ON)
   `uvm_object_utils_end
  constraint soft_c{ 
	  preamble ==56'h55_5555_5555_5555;
	  sfd==8'hd5;
	  len inside {[46:1500]};}
 constraint pay_load_c {
	 payload.size()==len;
	 }
  function void post_randomize();
     crc=32'h1234_5678;
     //ve need to vrite a logic for this
  endfunction
endclass
