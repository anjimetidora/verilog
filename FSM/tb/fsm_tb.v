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


//              File Name : fsm.v
//              File Type: Verilog                                 
//              Creation Date : 08-10-2016
//              Last Modified : Wed 09 Nov 2016 12:23:53 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//

module tb;
	parameter WIDTH=2;
	reg rst,clk;
	reg [WIDTH-1:0] in;
	reg [WIDTH-1:0] in1_1;
	wire out;
	fsm dut_inst(.in(in),.clk(clk),.rst(rst),.out(out));
	initial
		begin:clk_blk
			clk = 1'b0;
			forever #5 clk = ~clk;
		end	//clk_blk
	initial
		begin:test_blk
			fsm(1'b0,2'b00);	//if reset is low ,it reset the everything.
			fsm(1'b1,2'b11);	//if input is 11, then next is s2.
			fsm(1'b1,2'b0x);  //if input is 0x, then next is s1  
			fsm(1'b1,2'b00);  //if input is 00, then next is s0
			fsm(1'b1,2'b01);  //if input is 01, then next is s4
			fsm(1'b1,2'b0x);  //if input is 0x, then next is s0
			fsm(1'b1,2'b11);  //if input is 11, then next is s2
			fsm(1'b1,2'b1x);  //if input is 1x, then next is s3
			fsm(1'b1,2'bx1);  //if input is x1, then next is s4
			fsm(1'b1,2'b0x);  //if input is 0x, then next is s0
			fsm(1'b1,2'b00);  //if input is 00, then next is s0
			fsm(1'b1,2'b10);  //if input is 10, then next is s1
			fsm(1'b1,2'b00);  //if input is x1, then next is s1
			fsm(1'b1,2'b01);  //if input is x1, then next is s1
			fsm(1'b1,2'b10);  //if input is x1, then next is s1
			#100 $finish;
		end	//test_blk
	task fsm(input task_rst,[WIDTH-1:0]in_1);
		begin:task_blk
			 @(negedge clk); in=in_1;rst=task_rst;
		 end	//task_blk
	endtask
	initial
		begin:mon_blk
			$monitor("%m time = %0t,in = %b,clk = %b,rst = %b,cst=st%0d, nst=st%0d, out = %b",$time,in,clk,rst,tb.dut_inst.cst,tb.dut_inst.nst,out);
		end	//mon_blk
endmodule
