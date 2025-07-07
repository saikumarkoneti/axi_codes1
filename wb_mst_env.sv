class wb_mst_env;
   wb_mst_drv wb_mst_drv_i=new();
   wb_mst_gen wb_mst_gen_i=new();
   wb_mst_mon wb_mst_mon_i=new();
   wb_mst_cov wb_mst_cov_i=new();
   task run();
     $display("wb_mst_env");
    fork
       wb_mst_drv_i.run();
       wb_mst_gen_i.run();
       wb_mst_mon_i.run();
       wb_mst_cov_i.run();
    join
   endtask
endclass


