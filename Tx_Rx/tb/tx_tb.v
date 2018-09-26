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


//              File Name : tx_tb.v
//              File Type: Verilog                                 
//              Creation Date : 19-11-2016
//              Last Modified : Sat 19 Nov 2016 04:18:43 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
//

	module tb;
	parameter TB_WIDTH=8;
	reg tb_clk,tb_rst,tb_ack;
	reg [TB_WIDTH-1:0]tb_datain;
	wire [TB_WIDTH-1:0]tb_dataout;
	wire tb_tx_req;
	reg tb_tx_ready,tb_rx_ready;

	Tx dut_insta(.tx_clk(tb_clk),.tx_rst(tb_rst),.tx_datain(tb_datain),.tx_dataout(tb_dataout),.tx_ready(tb_tx_ready),.tx_ack(tb_ack),.tx_req(tb_tx_req));
	initial
		begin:clk_blk
			tb_clk=1'b0;
			forever #5 tb_clk=~tb_clk;
		end	//clk_blk
	initial 
		begin:test_cases
			reset(1'b0);
			reset(1'b1);
			tx_ready(1'b1);
			tx_ackn(1'b1);
			//rx_ready(1'b1);
			datain('d70);
			#100 $finish;
		end	//test_cases

	task reset(input task_reset);
		begin:reset_blk
			@(negedge tb_clk); tb_rst=task_reset;
		end	//reset_blk
	endtask	//reset_task

	task datain(input [TB_WIDTH-1:0]task_datain);
		begin:datain_blk
			@(negedge tb_clk); tb_datain=task_datain;
		end	//datain_blk
	endtask	//datain_task

	task tx_ready(input task_tx_ready);
		begin:tx_ready_blk
			@(negedge tb_clk); tb_tx_ready=task_tx_ready;
		end	//tx_ready_blk
	endtask	//tx_ready_blk

	task tx_ackn(input task_tx_acknol);
		begin:rx_ready_blk
			@(negedge tb_clk); tb_ack=task_tx_acknol;
		end	//rx_ready_blk
	endtask	//rx_ready_task

	initial 
		begin:mon_blk
			$monitor("%m time=%0t, clk=%0b, rst=%0b, tx_ready=%0b, rx_ready=%0b, datain=%0b, dataout=%0b",$time,tb_clk,tb_rst,tb_tx_ready,tb_rx_ready,tb_datain,tb_dataout);
		end	//mon_blk
		endmodule



