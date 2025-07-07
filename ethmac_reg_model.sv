class moder_reg extends uvm_reg;
 `uvm_object_utils(moder_reg)
  uvm_reg_field recsmall;
  uvm_reg_field pad;
  uvm_reg_field hugen;
  uvm_reg_field crcen;
  uvm_reg_field dlycrcen;
  uvm_reg_field fulld;
  uvm_reg_field exdfren;
  uvm_reg_field nobckof;
  uvm_reg_field loopbck;
  uvm_reg_field reserved;
  uvm_reg_field ifg;
  uvm_reg_field pro;
  uvm_reg_field iam;
  uvm_reg_field bro;
  uvm_reg_field nopre;
  uvm_reg_field txen;
  uvm_reg_field rxen;
  function new(string name="moder_reg");
     super.new(name,17,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   recsmall  =uvm_reg_field::type_id::create("recsmall");
   pad       =uvm_reg_field::type_id::create("pad");
   hugen     =uvm_reg_field::type_id::create("hugen");
   crcen     =uvm_reg_field::type_id::create("crcen");
   dlycrcen  =uvm_reg_field::type_id::create("dlycrcen");
   fulld     =uvm_reg_field::type_id::create("fulld");
   exdfren   =uvm_reg_field::type_id::create("exdfren");
   nobckof   =uvm_reg_field::type_id::create("nobckof");
   loopbck   =uvm_reg_field::type_id::create("loopbck");
   reserved  =uvm_reg_field::type_id::create("reserved");
   ifg       =uvm_reg_field::type_id::create("ifg");
   pro       =uvm_reg_field::type_id::create("pro");
   iam       =uvm_reg_field::type_id::create("iam");
   bro       =uvm_reg_field::type_id::create("bro");
   nopre     =uvm_reg_field::type_id::create("nopre");
   txen      =uvm_reg_field::type_id::create("txen");
   rxen      =uvm_reg_field::type_id::create("rxen");
   //configure method
   recsmall.configure(.parent(this),.size(1),.lsb_pos(16),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   pad.configure(     .parent(this),.size(1),.lsb_pos(15),.access("RW"),.volatile(1),.reset(1'h1),.has_reset(1),.is_rand(1),.individually_accessible(0));
   hugen.configure(   .parent(this),.size(1),.lsb_pos(14),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   crcen.configure(   .parent(this),.size(1),.lsb_pos(13),.access("RW"),.volatile(1),.reset(1'h1),.has_reset(1),.is_rand(1),.individually_accessible(0));
   dlycrcen.configure(.parent(this),.size(1),.lsb_pos(12),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   reserved.configure(.parent(this),.size(1),.lsb_pos(11),.access("WO"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));//RTL BUG
   fulld.configure(   .parent(this),.size(1),.lsb_pos(10),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   exdfren.configure( .parent(this),.size(1),.lsb_pos(9),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   nobckof.configure( .parent(this),.size(1),.lsb_pos(8),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   loopbck.configure( .parent(this),.size(1),.lsb_pos(7),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   ifg.configure(     .parent(this),.size(1),.lsb_pos(6),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   pro.configure(     .parent(this),.size(1),.lsb_pos(5),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   iam.configure(     .parent(this),.size(1),.lsb_pos(4),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   bro.configure(     .parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   nopre.configure(   .parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   txen.configure(    .parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   rxen.configure(    .parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass


class intsrc_reg extends uvm_reg;
 `uvm_object_utils(intsrc_reg)
uvm_reg_field rxc;
uvm_reg_field txc;
uvm_reg_field busy;
uvm_reg_field rxe;
uvm_reg_field rxb;
uvm_reg_field txe;
uvm_reg_field txb;
function new(string name="intsrc_reg");
   super.new(name,7,UVM_NO_COVERAGE);
endfunction
virtual function void build();
 rxc=uvm_reg_field::type_id::create("rxc");
 txc=uvm_reg_field::type_id::create("txc");
 busy=uvm_reg_field::type_id::create("busy");
 rxe=uvm_reg_field::type_id::create("rxe");
 rxb=uvm_reg_field::type_id::create("rxb");
 txe=uvm_reg_field::type_id::create("txe");
 txb=uvm_reg_field::type_id::create("txb");
 //configure method
 rxc.configure( .parent(this),.size(1),.lsb_pos(6),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
 txc.configure( .parent(this),.size(1),.lsb_pos(5),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
 busy.configure(.parent(this),.size(1),.lsb_pos(4),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
 rxe.configure( .parent(this),.size(1),.lsb_pos(3),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
 rxb.configure( .parent(this),.size(1),.lsb_pos(2),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
 txe.configure( .parent(this),.size(1),.lsb_pos(1),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
 txb.configure( .parent(this),.size(1),.lsb_pos(0),.access("W1C"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
endfunction

endclass


class intmask_reg extends uvm_reg;
 `uvm_object_utils(intmask_reg)
  uvm_reg_field rxc_m;
  uvm_reg_field txc_m;
  uvm_reg_field busy_m;
  uvm_reg_field rxe_m;
  uvm_reg_field rxb_m;
  uvm_reg_field txe_m;
  uvm_reg_field txb_m;
  function new(string name="intmask_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   rxc_m=uvm_reg_field::type_id::create("rxc_m");
   txc_m=uvm_reg_field::type_id::create("txc_m");
   busy_m=uvm_reg_field::type_id::create("busy_m");
   rxe_m=uvm_reg_field::type_id::create("rxe_m");
   rxb_m=uvm_reg_field::type_id::create("rxb_m");
   txe_m=uvm_reg_field::type_id::create("txe_m");
   txb_m=uvm_reg_field::type_id::create("txb_m");
   //configure method
   rxc_m.configure( .parent(this),.size(1),.lsb_pos(6),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   txc_m.configure( .parent(this),.size(1),.lsb_pos(5),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   busy_m.configure(.parent(this),.size(1),.lsb_pos(4),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   rxe_m.configure( .parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   rxb_m.configure( .parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   txe_m.configure( .parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   txb_m.configure( .parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(1),.reset(1'h0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass


//4
class ipgt_reg extends uvm_reg;
 `uvm_object_utils(ipgt_reg)
  uvm_reg_field ipgt;
  function new(string name="intmsk_reg");
     super.new(name,7,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   ipgt=uvm_reg_field::type_id::create("ipgt");
   //configure method
   ipgt.configure( .parent(this),.size(7),.lsb_pos(0),.access("RW"),.volatile(1),.reset(7'h12),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass



//5
class ipgr1_reg extends uvm_reg;
 `uvm_object_utils(ipgr1_reg)
  uvm_reg_field ipgr1;
  function new(string name="ipgr1_reg");
     super.new(name,7,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   ipgr1=uvm_reg_field::type_id::create("ipgr1");
   //configure method
   ipgr1.configure( .parent(this),.size(7),.lsb_pos(0),.access("RW"),.volatile(1),.reset(7'h0c),.has_reset(1),.is_rand(1),.individually_accessible(0));
endfunction

endclass

//6
class ipgr2_reg extends uvm_reg;
 `uvm_object_utils(ipgr2_reg)
  uvm_reg_field ipgr2;
  function new(string name="ipgr2_reg");
     super.new(name,7,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   ipgr2=uvm_reg_field::type_id::create("ipgr2");
   //configure method
   ipgr2.configure( .parent(this),.size(7),.lsb_pos(0),.access("RW"),.volatile(1),.reset(7'h12),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass

//7
class packlen_reg extends uvm_reg;
 `uvm_object_utils(packlen_reg)
  uvm_reg_field minfl;
  uvm_reg_field maxfl;
  function new(string name="packlen_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   minfl=uvm_reg_field::type_id::create("minfl");
   maxfl=uvm_reg_field::type_id::create("maxfl");
   //configure method
   minfl.configure( .parent(this),.size(16),.lsb_pos(16),.access("RW"),.volatile(1),.reset(16'h40),.has_reset(1),.is_rand(1),.individually_accessible(0));
   maxfl.configure( .parent(this),.size(16),.lsb_pos(0),.access("RW"),.volatile(1),.reset(16'h600),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass


class collconf_reg extends uvm_reg;
 `uvm_object_utils(collconf_reg)
  uvm_reg_field maxret;
  uvm_reg_field collvalid;
  function new(string name="collconf_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   maxret=uvm_reg_field::type_id::create("maxret");
   collvalid=uvm_reg_field::type_id::create("collvalid");
   //configure method
   maxret.configure( .parent(this),.size(4),.lsb_pos(16),.access("RW"),.volatile(1),.reset(4'hf),.has_reset(1),.is_rand(1),.individually_accessible(0));
   collvalid.configure( .parent(this),.size(6),.lsb_pos(0),.access("RW"),.volatile(1),.reset(6'h3f),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass

//9
class txbdnum_reg extends uvm_reg;
 `uvm_object_utils(txbdnum_reg)
  uvm_reg_field txbd;
  function new(string name="tx_bd_num_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   txbd=uvm_reg_field::type_id::create("txbd");
   //configure method
   txbd.configure( .parent(this),.size(8),.lsb_pos(0),.access("RW"),.volatile(1),.reset(8'h40),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass

//10

class ctrlmoder_reg extends uvm_reg;
 `uvm_object_utils(ctrlmoder_reg)
  uvm_reg_field txflow;
  uvm_reg_field rxflow;
  uvm_reg_field passall;
  function new(string name="ctrlmoder_reg");
     super.new(name,3,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   txflow=uvm_reg_field::type_id::create("txflow");
   rxflow=uvm_reg_field::type_id::create("rxflow");
   passall=uvm_reg_field::type_id::create("passall");
   //configure method
   txflow.configure( .parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   rxflow.configure( .parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   passall.configure( .parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass

//11

class miimoder_reg extends uvm_reg;
 `uvm_object_utils(miimoder_reg)
  uvm_reg_field miinopre;
  uvm_reg_field clkdiv;
  function new(string name="miimoder_reg");
     super.new(name,9,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   miinopre=uvm_reg_field::type_id::create("miinopre");
   clkdiv=uvm_reg_field::type_id::create("clkdiv");
   //configure method
   miinopre.configure( .parent(this),.size(1),.lsb_pos(8),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   clkdiv.configure( .parent(this),.size(8),.lsb_pos(0),.access("RW"),.volatile(1),.reset(8'h64),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass

//12

class miicommand_reg extends uvm_reg;
 `uvm_object_utils(miicommand_reg)
  uvm_reg_field wctrldata;
  uvm_reg_field rstat;
  uvm_reg_field scanstat;
  function new(string name="miicommand_reg");
     super.new(name,3,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   wctrldata=uvm_reg_field::type_id::create("wctrldata");
   rstat=uvm_reg_field::type_id::create("rstat");
   scanstat=uvm_reg_field::type_id::create("scanstat");
   //configure method
   wctrldata.configure( .parent(this),.size(1),.lsb_pos(2),.access("W1C"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   rstat.configure( .parent(this),.size(1),.lsb_pos(1),.access("W1C"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   scanstat.configure( .parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction

endclass

//13
class miiaddress_reg extends uvm_reg;
 `uvm_object_utils(miiaddress_reg)
  uvm_reg_field rgad;
  uvm_reg_field fiad;
  function new(string name="miiaddress_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   rgad=uvm_reg_field::type_id::create("rgad");
   fiad=uvm_reg_field::type_id::create("fiad");
   //configure method
   rgad.configure( .parent(this),.size(5),.lsb_pos(8),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   fiad.configure( .parent(this),.size(5),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass

//14
class miitx_data_reg extends uvm_reg;
 `uvm_object_utils(miitx_data_reg)
  uvm_reg_field ctrldata;
  function new(string name="miitx_data_reg");
     super.new(name,16,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   ctrldata=uvm_reg_field::type_id::create("ctrldata");
   //configure method
   ctrldata.configure( .parent(this),.size(16),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass

//15
class miirx_data_reg extends uvm_reg;
 `uvm_object_utils(miirx_data_reg)
  uvm_reg_field prsd;
  function new(string name="miirx_data_reg");
     super.new(name,16,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   prsd=uvm_reg_field::type_id::create("prsd");
   //configure method
   prsd.configure( .parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass

//16
class miistatus_reg extends uvm_reg;
 `uvm_object_utils(miistatus_reg)
  uvm_reg_field nvalid;
  uvm_reg_field busy;
  uvm_reg_field linkfail;
  function new(string name="miistatus_reg");
     super.new(name,3,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   nvalid=uvm_reg_field::type_id::create("nvalid");
   busy=uvm_reg_field::type_id::create("busy");
   linkfail=uvm_reg_field::type_id::create("linkfail");
   //configure method
   nvalid.configure( .parent(this),.size(1),.lsb_pos(2),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   busy.configure( .parent(this),.size(1),.lsb_pos(1),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   linkfail.configure( .parent(this),.size(1),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass
//17
class mac_addr0_reg extends uvm_reg;
 `uvm_object_utils(mac_addr0_reg)
  uvm_reg_field byte_2;
  uvm_reg_field byte_3;
  uvm_reg_field byte_4;
  uvm_reg_field byte_5;
  
  function new(string name="mac_addr0_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
  byte_2=uvm_reg_field::type_id::create("byte_2");
  byte_3=uvm_reg_field::type_id::create("byte_3");
  byte_4=uvm_reg_field::type_id::create("byte_4");
  byte_5=uvm_reg_field::type_id::create("byte_5");
   //configure method
   byte_2.configure( .parent(this),.size(8),.lsb_pos(24),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   byte_3.configure( .parent(this),.size(8),.lsb_pos(16),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   byte_4.configure( .parent(this),.size(8),.lsb_pos(8),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   byte_5.configure( .parent(this),.size(8),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass
//18
class mac_addr1_reg extends uvm_reg;
 `uvm_object_utils(mac_addr1_reg)
  uvm_reg_field byte_0;
  uvm_reg_field byte_1;
  function new(string name="mac_addr1_reg");
     super.new(name,16,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   byte_0=uvm_reg_field::type_id::create("byte_0");
   byte_1=uvm_reg_field::type_id::create("byte_1");
   //configure method
   byte_0.configure( .parent(this),.size(8),.lsb_pos(8),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   byte_1.configure( .parent(this),.size(8),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass
//19
class hash0_reg extends uvm_reg;
 `uvm_object_utils(hash0_reg)
  uvm_reg_field hash0;
  function new(string name="hash0_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   hash0=uvm_reg_field::type_id::create("rgad");
   //configure method
   hash0.configure( .parent(this),.size(32),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass
//20
class hash1_reg extends uvm_reg;
 `uvm_object_utils(hash1_reg)
  uvm_reg_field hash1;
  function new(string name="hash1_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   hash1=uvm_reg_field::type_id::create("hash1");
   //configure method
   hash1.configure( .parent(this),.size(32),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass
//21
class txctrl_reg extends uvm_reg;
 `uvm_object_utils(txctrl_reg)
  uvm_reg_field txpauserq;
  uvm_reg_field txpausetv;
  function new(string name="txctrl_reg");
     super.new(name,32,UVM_NO_COVERAGE);
  endfunction
  virtual function void build();
   txpauserq=uvm_reg_field::type_id::create("txpauserq");
   txpausetv=uvm_reg_field::type_id::create("txpausetv");
   //configure method
   txpauserq.configure( .parent(this),.size(1),.lsb_pos(16),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
   txpausetv.configure( .parent(this),.size(16),.lsb_pos(0),.access("RW"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(0));
  endfunction
endclass

class ethmac_reg_block extends uvm_reg_block;
  `uvm_object_utils(ethmac_reg_block)
  moder_reg moder;
  intsrc_reg intsrc;
  intmask_reg intmask;
  ipgt_reg ipgt;
  ipgr1_reg ipgr1;
  ipgr2_reg ipgr2;
  packlen_reg packlen;
  collconf_reg collconf;
  txbdnum_reg txbdnum;
  ctrlmoder_reg ctrlmoder;
  miimoder_reg miimoder;
  miicommand_reg miicommand;
  miiaddress_reg miiaddress;
  miitx_data_reg miitx_data;
  miirx_data_reg miirx_data;
  miistatus_reg miistatus;
  mac_addr0_reg mac_addr0;
  mac_addr1_reg mac_addr1;
  hash0_reg hash0;
  hash1_reg hash1;
  txctrl_reg txctrl;
   uvm_reg_map wb_map;
   function new(string name="ethmac_reg_block");
     super.new(name,build_coverage(UVM_CVR_ADDR_MAP));
   endfunction
   virtual function void build();
     string s;
     moder=moder_reg::type_id::create("moder");
     moder.configure(this,null);
     moder.build();
     for(int i=0;i<17;i++) begin
       $sformat(s,"MODEROut[%0d]",i);
       moder.add_hdl_path_slice(s,i,1);
     end
     intsrc=intsrc_reg::type_id::create("intsrc");
     intsrc.configure(this,null);
     intsrc.build();
     for(int i=0;i<7;i++) begin
       $sformat(s,"INT_SOURCEOut[%0d]",i);
       intsrc.add_hdl_path_slice(s,i,1);
     end
     intmask=intmask_reg::type_id::create("intmask");
     intmask.configure(this,null);
     intmask.build();
     for(int i=0;i<7;i++) begin
       $sformat(s,"INT_MASKOut[%0d]",i);
       intmask.add_hdl_path_slice(s,i,1);
     end
  
     ipgt=ipgt_reg::type_id::create("ipgt");
     ipgt.configure(this,null);
     ipgt.build();
     for(int i=0;i<7;i++) begin
       $sformat(s,"IPGTOut[%0d]",i);
       ipgt.add_hdl_path_slice(s,i,1);
     end
  
     ipgr1=ipgr1_reg::type_id::create("ipgr1");
     ipgr1.configure(this,null);
     ipgr1.build();
     for(int i=0;i<7;i++) begin
       $sformat(s,"IPGR1Out[%0d]",i);
       ipgr1.add_hdl_path_slice(s,i,1);
     end
  
     ipgr2=ipgr2_reg::type_id::create("ipgr2");
     ipgr2.configure(this,null);
     ipgr2.build();
     for(int i=0;i<7;i++) begin
       $sformat(s,"IPGR2Out[%0d]",i);
       ipgr2.add_hdl_path_slice(s,i,1);
     end
  
     packlen=packlen_reg::type_id::create("packlen");
     packlen.configure(this,null);
     packlen.build();
     for(int i=0;i<32;i++) begin
       $sformat(s,"PACKETLENOut[%0d]",i);
       packlen.add_hdl_path_slice(s,i,1);
     end
  
     collconf=collconf_reg::type_id::create("collconf");
     collconf.configure(this,null);
     collconf.build();
     for(int i=0;i<20;i++) begin
       $sformat(s,"COLLCONFOut[%0d]",i);
       collconf.add_hdl_path_slice(s,i,1);
     end
  
     ctrlmoder=ctrlmoder_reg::type_id::create("ctrlmoder");
     ctrlmoder.configure(this,null);
     ctrlmoder.build();
     for(int i=0;i<3;i++) begin
       $sformat(s,"CTRLMODEROut[%0d]",i);
       ctrlmoder.add_hdl_path_slice(s,i,1);
     end
  
     miimoder=miimoder_reg::type_id::create("miimoder");
     miimoder.configure(this,null);
     miimoder.build();
     for(int i=0;i<9;i++) begin
       $sformat(s,"MIIMODEROut[%0d]",i);
       miimoder.add_hdl_path_slice(s,i,1);
     end
  
     miicommand=miicommand_reg::type_id::create("miicommand");
     miicommand.configure(this,null);
     miicommand.build();
     for(int i=0;i<3;i++) begin
       $sformat(s,"MIICOMMANDOut[%0d]",i);
       miicommand.add_hdl_path_slice(s,i,1);
     end
  
     miiaddress=miiaddress_reg::type_id::create("miiaddress");
     miiaddress.configure(this,null);
     miiaddress.build();
     for(int i=0;i<13;i++) begin
       $sformat(s,"MIIADDRESSOut[%0d]",i);
       miiaddress.add_hdl_path_slice(s,i,1);
     end
  
     miitx_data=miitx_data_reg::type_id::create("miitx_data");
     miitx_data.configure(this,null);
     miitx_data.build();
     for(int i=0;i<16;i++) begin
       $sformat(s,"MIITX_DATAOut[%0d]",i);
       miitx_data.add_hdl_path_slice(s,i,1);
     end
  
     miirx_data=miirx_data_reg::type_id::create("miirx_data");
     miirx_data.configure(this,null);
     miirx_data.build();
     for(int i=0;i<16;i++) begin
       $sformat(s,"MIIRX_DATAOut[%0d]",i);
       miirx_data.add_hdl_path_slice(s,i,1);
     end
  
     miistatus=miistatus_reg::type_id::create("miistatus");
     miistatus.configure(this,null);
     miistatus.build();
     for(int i=0;i<3;i++) begin
       $sformat(s,"MIISTATUSOut[%0d]",i);
       miistatus.add_hdl_path_slice(s,i,1);
     end
  
     mac_addr0=mac_addr0_reg::type_id::create("mac_addr0");
     mac_addr0.configure(this,null);
     mac_addr0.build();
     for(int i=0;i<32;i++) begin
       $sformat(s,"MAC_ADDR0Out[%0d]",i);
       mac_addr0.add_hdl_path_slice(s,i,1);
     end
  
     mac_addr1=mac_addr1_reg::type_id::create("mac_addr1");
     mac_addr1.configure(this,null);
     mac_addr1.build();
     for(int i=0;i<16;i++) begin
       $sformat(s,"MAC_ADDR1Out[%0d]",i);
       mac_addr1.add_hdl_path_slice(s,i,1);
     end
     
     txbdnum=txbdnum_reg::type_id::create("txbdnum");
     txbdnum.configure(this,null);
     txbdnum.build();
     for(int i=0;i<8;i++) begin
       $sformat(s,"TX_BD_NUMOut[%0d]",i);
       txbdnum.add_hdl_path_slice(s,i,1);
     end
     
     hash0=hash0_reg::type_id::create("hash0");
     hash0.configure(this,null);
     hash0.build();
     for(int i=0;i<32;i++) begin
       $sformat(s,"HASH0Out[%0d]",i);
       hash0.add_hdl_path_slice(s,i,1);
     end
  
     hash1=hash1_reg::type_id::create("hash1");
     hash1.configure(this,null);
     hash1.build();
     for(int i=0;i<32;i++) begin
       $sformat(s,"HASH1Out[%0d]",i);
       hash1.add_hdl_path_slice(s,i,1);
     end
  
     txctrl=txctrl_reg::type_id::create("txctrl");
     txctrl.configure(this,null);
     txctrl.build();
     for(int i=0;i<17;i++) begin
       $sformat(s,"TXCTRLOut[%0d]",i);
       txctrl.add_hdl_path_slice(s,i,1);
     end
  
     wb_map = create_map("wb_block_map", 'h0, 4, UVM_LITTLE_ENDIAN, 1);  
     wb_map.add_reg(moder,'h0,"RW");
     wb_map.add_reg(intsrc ,'h1,"RW");
     wb_map.add_reg(intmask ,'h2,"RW");
     wb_map.add_reg(ipgt,'h3,"RW");
     wb_map.add_reg(ipgr1,'h4,"RW");
     wb_map.add_reg(ipgr2,'h5,"RW");
     wb_map.add_reg(packlen,'h6,"RW");
     wb_map.add_reg(collconf,'h7,"RW");
     wb_map.add_reg(txbdnum,'h8,"RW");
     wb_map.add_reg(ctrlmoder,'h9,"RW");
     wb_map.add_reg(miimoder,'ha,"RW");
     wb_map.add_reg(miicommand,'hb,"RW");
     wb_map.add_reg(miiaddress,'hc,"RW");
     wb_map.add_reg(miitx_data,'hd,"RW");
     wb_map.add_reg(miirx_data,'he,"RW");
     wb_map.add_reg(miistatus,'hf,"RO");
     wb_map.add_reg(mac_addr0,'h10,"RW");
     wb_map.add_reg(mac_addr1,'h11,"RW");
     wb_map.add_reg(hash0,'h12,"RW");
     wb_map.add_reg(hash1,'h13,"RW");
     wb_map.add_reg(txctrl,'h14,"RW");
     add_hdl_path("top_tb.dut.ethreg1","RTL");
     lock_model();   
   endfunction
 endclass
