//***************************************************************************//
//***************************************************************************//
//***************************************************************************//
//**************                                          *******************//
//**************                                          *******************//
//**************      (c) SASIC Technologies Pvt Ltd      *******************//
//**************          (c) Verilogic Solutions         *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************           www.sasictek.com               *******************//
//**************          www.verilog-ic.com              *******************//
//**************                                          *******************//
//**************           Twitter:@sasictek              *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//***************************************************************************//
//***************************************************************************//


//              File Name : mem_cont_tb.v
//              File Type: Verilog                                 
//              Creation Date : 15-11-2016
//              Last Modified : Tue 15 Nov 2016 07:06:16 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
	module tb;
	parameter W_WIDTH=8;
	parameter D_WIDTH=8;
	parameter P_WIDTH=3;
	reg clk,rst_n;
	reg [W_WIDTH-1:0]wr_data;
	reg [P_WIDTH-1:0]mem_addr;
	reg rd_wr_valid,rd_wr_mem;
	wire [W_WIDTH-1:0]rd_data;
	
	mem_cont dut_insta(.clk(clk),.wr_data(wr_data),.mem_addr(mem_addr),.rd_wr_valid(rd_wr_valid),.rd_wr_mem(rd_wr_mem),.rd_data(rd_data),.rst_n(rst_n));

	initial
		begin:clk_blk
			clk=1'b0;
			forever #5 clk=~clk;
		end	//clk_blk
	initial
		begin:test_cases
			reset(1'b0);
			reset(1'b1);
			wr_rd(1'b1,1'b1,'d6,'d1);
			wr_rd(1'b1,1'b1,'d9,'d2);
			wr_rd(1'b1,1'b1,'d1,'d3);
			wr_rd(1'b1,1'b0,'d6,'d1);
			wr_rd(1'b1,1'b0,'d6,'d2);
			wr_rd(1'b1,1'b0,'d6,'d3);
			wr_rd(1'b1,1'b1,'d7,'d7);
			wr_rd(1'b1,1'b1,'d3,'d6);
			wr_rd(1'bx,1'b1,'d6,'d1);
			wr_rd(1'bx,1'b1,'d6,'d1);
			wr_rd(1'bx,1'b1,'d6,'d1);
			wr_rd(1'b1,1'b1,'d3,'d6);
			wr_rd(1'b1,1'b0,'d3,'d6);
			wr_rd(1'b1,1'b1,'d3,'d6);
			#20 $finish;
		end	//test_cases
		task reset(input task_reset);
			begin:res_task
				@(negedge clk); rst_n=task_reset;
			end	//rseet_blk
		endtask	//reset

		task wr_rd(input task_valid,task_rd_wr,[W_WIDTH-1:0]task_wr,task_mem);
			begin:wr_rd_task
				@(negedge clk); rd_wr_valid=task_valid; rd_wr_mem=task_rd_wr; wr_data=task_wr; mem_addr=task_mem;
			end	//wr_rd_task
		endtask	//wr_rd

		initial
			begin:mon_blk
				$monitor("%m time=%0t, clk=%0b, rst=%0b, rdwr_valid=%0b, rdwr_mem=%0b, mem_add=%0d, wr_data=%0d, rd_data=%0d",$time,clk,rst_n,rd_wr_valid,rd_wr_mem,mem_addr,wr_data,rd_data);
			end	//mon_blk
endmodule
