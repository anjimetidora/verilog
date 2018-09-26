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


//              File Name : d_asyn_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 18 Oct 2016 07:16:03 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	reg enable,reset,data;
	wire q;
	d_latch_async dut_insta(.enable(enable),.reset(reset),.data(data),.q(q));
	initial
		begin:test_cases							//different test cases
			reset=1'b0; 								//if reset is low,it reset the everything
		#5	enable=1'b0;	data=1'b1;	//different enable and data combinations
		#5	enable=1'b1;	data=1'b1;
		#5	enable=1'bz;	data=1'b1;
		#5	enable=1'bx;	data=1'b1;	//if enable is unknown ,it holds the previous data.
		#5	enable=1'b0;	data=1'b0;
		#5	enable=1'b1;	data=1'b0;	//if enable is high ,it follows the data.
		#5	enable=1'bz;	data=1'b0;	
		#5	enable=1'bx;	data=1'b0;
		#5	enable=1'b1;	data=1'bx;
		#5	enable=1'b1;	data=1'bz;
		#5	enable=1'b0;	data=1'bx;
		#5	enable=1'b0;	data=1'bz;
		#5	enable=1'bx;	data=1'bx;
		#5	enable=1'bz;	data=1'bx;
		#5	reset=1'b1;								//if reset is high,it can't reset,because active low.
		#5	enable=1'b0;	data=1'b1;	//different enable and data combinations
		#5  enable=1'b1;	data=1'b1;
    #5  enable=1'bz;	data=1'b1;
    #5  enable=1'bx;	data=1'b1;
		#5  reset=1'b0;									//if reset is low,it reset the everything.
    #5  enable=1'b0;	data=1'b0;
    #5  enable=1'b1;	data=1'b0;
    #5  enable=1'bz;	data=1'b0;
    #5  enable=1'bx;	data=1'b0;
		#5  reset=1'b1;									//after some time reset ,it can't reset.
		#5	enable=1'b1;	data=1'bx;
		#5	enable=1'b1;	data=1'bz;		//if enable is high ,it follows the data.
		#5	enable=1'b0;	data=1'bx;		//if enable is low ,it holds the previous data.
		#5	enable=1'b0;	data=1'bz;
		#5	enable=1'bx;	data=1'bx;		//if enable is unknown ,it holds the previous data.
		#5	enable=1'bz;	data=1'bx;			
    #5  enable=1'b0;	data=1'b0;
    #5  enable=1'b1;	data=1'b0;
    #5  enable=1'bz;	data=1'b0;
    #5  enable=1'bx;	data=1'b0;
			#50 $finish;
		end	//test_cases						//end different test cases
	initial
		begin:monitor_blk
			$monitor("%m time=%t,	enable=%b,	reset=%b,	data=%b,	q=%b",$time,enable,reset,data,q);
		end	//monitor_blk
endmodule

