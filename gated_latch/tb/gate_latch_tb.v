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


//              File Name : gate_latch_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 18 Oct 2016 07:34:37 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	reg enable,gate,d;
	wire q;
	gate_latch dut_insta(.enable(enable),.d(d),.gate(gate),.q(q));
	initial
		begin:test_cases
					enable=1'b0; gate=1'b0; d=1'b0;	//enable and gate are different combinations ,inputs are low,it holds the previous.
			 #5 enable=1'b0; gate=1'b1; d=1'b0;
			 #5 enable=1'b1; gate=1'b0; d=1'b0;
			 #5 enable=1'b1; gate=1'b1; d=1'b0;
			 #5 enable=1'b0; gate=1'b0; d=1'b1;	//enable and gate are different combination ,inputs are high,it holds the previous
			 #5 enable=1'b0; gate=1'b1; d=1'b1;
			 #5 enable=1'b1; gate=1'b0; d=1'b1;
			 #5 enable=1'b1; gate=1'b1; d=1'b1;
			 #5 enable=1'b0; gate=1'b0; d=1'bx;	//enable and gate are different combination ,inputs are unknown
			 #5 enable=1'b0; gate=1'b1; d=1'bx;
			 #5 enable=1'bz; gate=1'b0; d=1'b1;
			 #5 enable=1'b1; gate=1'b0; d=1'bx;
			 #5 enable=1'b1; gate=1'b1; d=1'bx;
			 #5 enable=1'b0; gate=1'b0; d=1'bz;	//enable and gate are different combination ,inputs are z
			 #5 enable=1'b0; gate=1'b1; d=1'bz;
			 #5 enable=1'b1; gate=1'b0; d=1'bz;
			 #5 enable=1'b1; gate=1'b1; d=1'bz;
			 #5 enable=1'bx; gate=1'bx; d=1'b1;	//different enable and gate combinations
			 #5 enable=1'bx; gate=1'bz; d=1'b1;
			 #5 enable=1'bz; gate=1'bx; d=1'b1;
			 #5 enable=1'bz; gate=1'bz; d=1'b1;
			 #5 enable=1'bz; gate=1'b1; d=1'b1;
			 #5 enable=1'bx; gate=1'b0; d=1'b1;
			 #5 enable=1'bz; gate=1'b0; d=1'b1;
			 #5 enable=1'bx; gate=1'b1; d=1'b1;
			 #5 enable=1'b0; gate=1'bx; d=1'b1;
			 #5 enable=1'b1; gate=1'bx; d=1'b1;
			 #5 enable=1'b0; gate=1'bz; d=1'b1;
			 #5 enable=1'b1; gate=1'b1; d=1'b1;	//if continuously give enable and gate as high
			 #5 enable=1'b1; gate=1'b1; d=1'b1;
			 #5 enable=1'b1; gate=1'b1; d=1'b1;
			 #5 enable=1'b1; gate=1'b1; d=1'b1;
			 #5 enable=1'b1; gate=1'bx; d=1'b1;	//if gate will be unknown state
			 #50 $finish;
			end	//test_cases
	initial
		begin:monitor_blk
				$monitor("%m time=%t,	en=%b,	gate=%b,	din=%b,	q=%b",$time,enable,gate,d,q);
			end	//monitor_blk
endmodule

