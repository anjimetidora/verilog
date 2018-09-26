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


//              File Name : QOS_tb.v
//              File Type: Verilog                                 
//              Creation Date : 16-11-2016
//              Last Modified : Thu 17 Nov 2016 10:37:15 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
	module tb;
	parameter R_WIDTH=4;
	parameter A_WIDTH=8;
	reg clk,rst;
	reg new_pkt;
	reg [R_WIDTH-1:0]recharge;
	wire [A_WIDTH-1:0]available_credit;
	wire no_available_credit;


	qos dut_insta(.clk(clk),.recharge(recharge),.available_credit(available_credit),.no_available_credit(no_available_credit),.rst(rst),.new_pkt(new_pkt));

	initial
		begin:clk_blk
			clk='b0;
			forever #5 clk=~clk;
		end	//clk_blk

		initial
			begin:test_cases
				reset(1'b0);
				reset(1'b0);
				reset(1'b1);
				recharg(1'b1,'d10);
				repeat (6)recharg(1'b0,'d10);
				repeat (30)recharg(1'b1,'d0);
				repeat (10)recharg(1'b1,'d3);
				repeat (120)recharg(1'b0,'d15);
				recharg(1'b1,'d10);
				repeat (10)recharg(1'b1,'d0);
				repeat (10)recharg(1'b1,'d12);
				repeat (10)recharg(1'b1,'dx);
				repeat (10)recharg(1'bx,'d10);
				#10 $finish;
			end	//test_cases

			task reset(input task_reset);
				begin:task_rset
					@(negedge clk); rst=task_reset;
				end	//task_rset
			endtask

			task recharg(input task_newpkt,[R_WIDTH-1:0]task_recharge);
				begin:recharge_blk
					@(negedge clk); new_pkt=task_newpkt;	recharge=task_recharge;
				end	//recharge_blk
			endtask

			initial
				begin:mon_blk
					$monitor("%m time=%0t, clk=%0b, rst=%0b, new_pkt=%0b, recharge=%0d, available_credit=%0d, no_available_credit=%0b, count=%0d",$time,clk,rst,new_pkt,recharge,available_credit,no_available_credit,tb.dut_insta.count);
				end	//mon_blk
				endmodule
