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


//              File Name : tb.v
//              File Type: Verilog                                 
//              Creation Date : 18-11-2016
//              Last Modified : Mon 26 Jun 2017 05:20:45 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
	module tb;
	parameter TB_WIDTH=8;
	reg tb_clk,tb_rst;
	reg [TB_WIDTH-1:0]tb_datain;
	wire [TB_WIDTH-1:0]tb_dataout;
	reg tb_tx_ready,tb_rx_ready;

	top dut_insta(.top_clk(tb_clk),.top_rst(tb_rst),.top_datain(tb_datain),.top_dataout(tb_dataout),.top_tx_ready(tb_tx_ready),.top_rx_ready(tb_rx_ready));
	initial
		begin:clk_blk
			tb_clk=1'b0;
			forever #5 tb_clk=~tb_clk;
		end	//clk_blk
	initial 
		begin:test_cases
			reset(1'b0);
			reset(1'b1);
		@(negedge tb_clk)	tx_rx_ready(1'b1,1'b1);datain('d7);
		@(negedge tb_clk)	tx_rx_ready(1'b1,1'b1);datain('d4);
		@(negedge tb_clk)	tx_rx_ready(1'b1,1'b1);datain('d2);
		@(negedge tb_clk)	tx_rx_ready(1'b1,1'b1);datain('d3);
		@(negedge tb_clk)	tx_rx_ready(1'b1,1'b1);datain('d8);
		@(negedge tb_clk)	tx_rx_ready(1'b1,1'b1);datain('d1);
			#500 $finish;
		end	//test_cases

	task reset(input task_reset);
		begin:reset_blk
			@(negedge tb_clk); tb_rst<=task_reset;
		end	//reset_blk
	endtask	//reset_task

	task datain(input [TB_WIDTH-1:0]task_datain);
		begin:datain_blk
			@(negedge tb_clk); tb_datain<=task_datain;
		end	//datain_blk
	endtask	//datain_task

	task tx_rx_ready(input task_tx_ready,task_rx_ready);
		begin:tx_ready_blk
			@(negedge tb_clk); tb_tx_ready<=task_tx_ready; tb_rx_ready<=task_rx_ready;
		end	//tx_ready_blk
	endtask	//tx_ready_blk

	/*task rx_ready(input task_rx_ready);
		begin:rx_ready_blk
			@(negedge tb_clk); tb_rx_ready=task_rx_ready;
		end	//rx_ready_blk
	endtask	//rx_ready_task*/

	initial 
		begin:mon_blk
			$monitor("%m time=%0t, clk=%0b, rst=%0b, tx_ready=%0b, rx_ready=%0b, datain=%0d, dataout=%0d, rx_ack=%0b, rx_datain=%0d",$time,tb_clk,tb_rst,tb_tx_ready,tb_rx_ready,tb_datain,tb_dataout,tb.dut_insta.temp_ack,tb.dut_insta.temp_datain);
		end	//mon_blk
		endmodule



