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


//              File Name : tri_tb.v
//              File Type: Verilog                                 
//              Creation Date : 13-10-2016
//              Last Modified : Sat 12 Nov 2016 01:42:03 PM IST

                             
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
	reg in0,enable;
	wire out;
	tri_state dut_insta(.in0(in0),.enable(enable),.out(out));
	initial
		begin:test_casesa
			enable =1'b0;	
			#5 enable =1'b1;	in0=1'b1;		//To check output when enable is high 
			#5 enable =1'b0;	in0=1'b0;		//to check output when enable is low
			#5 enable =1'b1;	in0=1'b0;		//to check output enable is toggle and input also toggle 
			#5 enable =1'b0;	in0=1'b1;	
			#5 enable =1'bx;	in0=1'b0;		//enable as unknown and input as high,output will be unknown.
			#5 enable =1'b1;	in0=1'b1;		
			#5 enable =1'b1;	in0=1'b1;		//enable is high and inputs are toggle ,it follows the inputs
			#5 enable =1'b1;	in0=1'b0;
			#5 enable =1'b0;	in0=1'b0;		//if enable is low ,the output will be z.
			#5 enable =1'b1;	in0=1'b1;		
			#5 enable =1'b0;	in0=1'b1;		
			#5 enable =1'b1;	in0=1'b0;
			#5 enable =1'bx;	in0=1'b1;
			#5 enable =1'bz;	in0=1'b0;
			#5 enable =1'b0;	in0=1'b1;		//if enable is low ,the output will be z. 
			#5 enable =1'b0;	in0=1'b1;		
			#5 enable =1'b0;	in0=1'b1;	
			#5 enable =1'b0;	in0=1'b1;	
			#5 enable =1'b1;	in0=1'b1;		//if enable is suddenly changed into high,it follows the inputs
			#5 enable =1'b0;	in0=1'b1;		// again enable is toggle,the output will be z.
			#5 enable =1'bz;	in0=1'b1;		// if enable is unknown state,the output will be unknown.
			#5 enable =1'bx;	in0=1'b1;	
			#5 enable =1'b0;	in0=1'b1;		//if enable is low,the output will be z.
			#5 enable =1'b1;	in0=1'bx;		//if enable is suddenly changed into high,it follows the inputs
			#5 enable =1'b1;	in0=1'bz;		//if enable is suddenly changed into high,it follows the inputs
			#50 $finish;
		end	//test_cases
	initial
		begin:monitor_blk
			$monitor("%m time=%0t,	in0=%b,	enable=%b,	out=%b",$time,in0,enable,out);
		end	//monitor_blk
endmodule

