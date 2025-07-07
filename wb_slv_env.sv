class wb_slv_env;
wb_slv_mon mon=new;
task run();
  $display("wb_slv_env::run");
  //no BFM is require :as v connect actual sram memory
  //only monitor is required
  mon.run();
endtask     
endclass         
             
