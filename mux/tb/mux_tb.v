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


//              File Name : mux_tb.v
//              File Type: Verilog                                 
//              Creation Date : 04-10-2016
//              Last Modified : Tue 18 Oct 2016 07:27:35 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//*********************************test bench********************************//
//
module tb;
		reg [1:0] sel;
		reg in0,in1,in2,in3;
		wire mux_out;
		mux dut_ista(.sel(sel),.in0(in0),.in1(in1),.in2(in2),.in3(in3),.mux_out(mux_out));
//***********************************test cases******************************//
		initial
			begin:test_cases
						sel=2'b00;	in1=1'b1;	in2=1'b0;	in3=1'b1;								//if select is 00 ,but input is not given,it gives the unknown 
				#5  sel=2'b00;	in0=1'b0; in1=1'b1;	in2=1'b0;	in3=1'b1;			//if select is 00 ,then inputs are toggle,,it follows the input	
				#5	sel=2'b00;	in0=1'b0; in1=1'b1;	in2=1'b0;	in3=1'b1;		
				#5	sel=2'b00;	in0=1'bx; in1=1'b1;	in2=1'b0;	in3=1'b1;		
				#5	sel=2'b00;	in0=1'bz; in1=1'b1;	in2=1'b0;	in3=1'b1;		
				#5	sel=2'b01;	in0=1'b0; in2=1'b0;	in3=1'b1;								//if select is 01 ,but input is not given, it gives the unknown 
				#5	sel=2'b01;	in0=1'b0; in1=1'b1;	in2=1'b0;	in3=1'b1;			//if select is 01 ,then input are toggle ,it follows the input
				#5	sel=2'b01;	in0=1'b0; in1=1'b0;	in2=1'b1;	in3=1'b1;			
				#5	sel=2'b01;	in0=1'b0; in1=1'bz;	in2=1'b1;	in3=1'b1;		
				#5	sel=2'b01;	in0=1'b1; in1=1'b1;	in2=1'b0;	in3=1'b1;			
				#5	sel=2'b10;	in0=1'b1; in1=1'bx;	in3=1'b1;								//if select is 10 ,but input is not given,it gives the unknown 
				#5	sel=2'b10;	in0=1'b1; in1=1'bx;	in2=1'bz;	in3=1'b1;			//if select is 10 ,then input are toggle ,it follows the input
				#5	sel=2'b10;	in0=1'b1; in1=1'b0;	in2=1'bx;	in3=1'b1;		
				#5	sel=2'b10;	in0=1'b0; in1=1'b1;	in2=1'b0;	in3=1'b1;		
				#5	sel=2'b10;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'b1;		
				#5	sel=2'b11;	in0=1'b0; in1=1'b1;	in2=1'b1;								//if select is 11 ,but input is not given,it gives the unknown 
				#5	sel=2'b11;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'bx;			//if select is 11, then input are toggle ,it follows the input
				#5	sel=2'b11;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b1;		
				#5	sel=2'b11;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'bx;		
				#5	sel=2'b11;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'b1x;	in0=1'b1; in1=1'b0;	in2=1'b0;	in3=1'b1;		//if selection is unknown state and inputs are also toggle,it ouput will be unknown state.
				#5	sel=2'bx1;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'b0x;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'bzz;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'b1z;	in0=1'b1; in1=1'b0;	in2=1'b0;	in3=1'b0;		
				#5	sel=2'bz0;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'b11;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		//if select 11 ,then inputs are toggle
				#5	sel=2'bxx;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		//if selection is unknown state and inputs are also toggle,,it ouput will be unknown state. 
				#5	sel=2'b1x;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'b00;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'b0z;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'bxx;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'bzx;	in0=1'b1; in1=1'b1;	in2=1'b0;	in3=1'b0;		
				#5	sel=2'bxz;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'bzz;	in0=1'b0; in1=1'b0;	in2=1'b0;	in3=1'b0;		
				#5	sel=2'b1x;	in0=1'b1; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'bx0;	in0=1'b0; in1=1'b1;	in2=1'b1;	in3=1'b0;		
				#5	sel=2'bz1;	in0=1'b0; in1=1'b0;	in2=1'b0;	in3=1'b0;		
				#100 $finish;
			end		//test_cases
		initial
			begin:monitor_blk
				$monitor("%m time=%t,	sel=%b,	ino=%b,	in1=%b,	in2=%b,	in3=%b, out=%d",$time,sel,in0,in1,in2,in3,mux_out);
			end	//monitor_blk
endmodule


//************************************end test bench*************************//

