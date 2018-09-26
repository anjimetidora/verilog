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


//              File Name : dlatch_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Sat 12 Nov 2016 06:04:50 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	reg enable,data;
	wire q;
	d_latch dut_insta(.enable(enable),.data(data),.q(q));
	initial
		begin:test_blk
				 enable=1'b0;							//enable is low,it holds previous value
			#5 enable=1'b1;data=1'b1;		//enable is high and inputs are toggle
			#5 enable=1'b1;data=1'bz;
			#5 enable=1'b1;data=1'b0;
			#5 enable=1'bz;data=1'b1;
			#5 data=1'b0; enable=1'b1;	//enable is high inputs are toggle ,it follows the input
			#5 data=1'b1; enable=1'b0;	//enable is toggle inputs are also toggle
			#5 data=1'b1; enable=1'b0;
			#5 data=1'b1; enable=1'b1;
			#5 data=1'b1; enable=1'b0;
			#5 data=1'bx; enable=1'b1;
			#5 data=1'bz; enable=1'b1;
			#5 data=1'bx; enable=1'b1;
			#5 data=1'b1; enable=1'bz;
			#5 data=1'b0; enable=1'bx;	//if enable is unknown state,it holds the previous value
			#5 data=1'b0; enable=1'bx;	//different input combination
			#5 data=1'b0; enable=1'bx;
			#5 data=1'bz; enable=1'bx;
			#5 data=1'b0; enable=1'bz;	//if enable is z,it holds the previous value
			#5 data=1'b1; enable=1'bz;	//different input combination
			#5 data=1'bx; enable=1'bz;
			#5 data=1'bz; enable=1'bz;
			#5 data=1'b1; enable=1'b0;	//if enable is low
			#5 data=1'b0; enable=1'b0;	//different input combination
			#5 data=1'bz; enable=1'b0;
			#5 data=1'bx; enable=1'b0;
			#5 $finish;
		end	//test_blk
	initial
		begin:monitor_blk
			$monitor("%m time=%t,	enable=%b,	data=%b,	q=%b",$time,enable,data,q);
		end	//monitor_blk
endmodule
