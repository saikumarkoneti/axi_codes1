`define COMP \
function new(string name,uvm_component parent); \
  super.new(name,parent); \
endfunction

`define OBJ \
function new(string name=""); \
  super.new(name); \
endfunction

class ethmac_common;
 static bit [31:0] regmaskA[20:0];
 static bit int_o_generated;
 static bit [6:0] expected_intsrc_value;
 //typedef bit[3:0] nibble_t;
  function new();
    regmaskA[0]={15'h0,17'h1ffff};
    regmaskA[1]={25'h0,7'h7f};
    regmaskA[2]={25'h0,7'h7f};
    regmaskA[3]={25'h0,7'h7f};
    regmaskA[4]={25'h0,7'h7f};
    regmaskA[5]={25'h0,17'h7f};
    regmaskA[6]={32'hffffffff};
    regmaskA[7]={12'h0,4'hf,10'h0,6'h3f};
    regmaskA[8]={24'h0,8'hff};
    regmaskA[9]={29'h0,3'h7};
    regmaskA[10]={23'h0,9'h1ff};
    regmaskA[11]={29'h0,3'h7};
    regmaskA[12]={19'h0,5'h1f,3'h0,5'h1f};
    regmaskA[13]={16'h0,16'hffff};
    regmaskA[14]={16'h0,16'hffff};
    regmaskA[15]={29'h0,3'h7};
    regmaskA[16]={32'hffff};
    regmaskA[17]={16'h0,16'h1ffff};
    regmaskA[18]={32'hffff_ffff};
    regmaskA[19]={32'hffff_ffff};
    regmaskA[20]={15'h0,17'h1ffff};
  endfunction
endclass
