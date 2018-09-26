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


//              File Name : decoder_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 18 Oct 2016 07:34:35 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//************************************test bench*****************************//
//
module tb;
	parameter I_WIDTH=3,O_WIDTH=8;
	reg en;
	reg [I_WIDTH-1:0]din;
	wire [O_WIDTH-1:0]d_out;
	decoder dut_insta(.en(en),.din(din),.d_out(d_out));
//******************************test cases***********************************//
	initial
		begin
			en=1'b0;					//initially enable is low,it reset the everything. 
			#1 en=1'b1;				//after some time enable is high
			 	 din=3'b000;		//then input is 000
			#1 din=3'b001;		//inputs are keep on toggling for checking outputs
			#1 din=3'b010;		
			#1 din=3'b011;
			#1 din=3'b100;
			#1 din=3'b101;
			#1 en=1'b0;				//enable is toggle 
			#1 din=3'b110;		//inputs are toggle for checking outputs
			#1 din=3'b111;
			#1 en=1'b1;				//enable is toggle
			#1 din=3'bxxx;		//if inputs are unknown state
			#1 din=3'bzzz;		
			#1 din=3'b110;		
			#1 din=3'b111;		
			#1 en=1'bx;				//if enable is unknown state
			#1 din=3'b011;		//inputs are toggle
			#1 en=1'bz;				//if enable is z
			#1 din=3'b010;		//inputs are toggle
			#1 en=1'b0;				//enable is toggle 
			#1 din=3'b111;
			#1 din=3'b101;
			#1 din=3'b111;
			#1 din=3'b011;
			#1 en=1'b1;				//enable is high,it follows the input 
			#1 din=3'b100;
			#1 din=3'b1x1;
			#1 din=3'b001;
			#1 din=3'bxxx;
			#1 en=1'bx;				//if enable is unknown state,the output will be unknown
			#1 din=3'b111;
			#1 din=3'b101;
			#1 din=3'b111;
			#1 din=3'b011;
			#1 en=1'bz;				//if enable is z,the output will be unknown.
			#1 din=3'b100;
			#1 en=1'b0;				
			#1 en=1'b1;				//after some time enable is high,it follows the inputs
			#1 din=3'bzzz;		
			#1 din=3'b110;		
			#1 din=3'b111;		
			#1 en=1'b0;				//enable is low,the output is low only.
			#1 en=1'bx;				//if enable is unknown state,the output will be unknown state
			#1 en=1'b1;				//if enable is high,it follows the inputs
			#1 din=3'bx01;		//different input combination
			#1 din=3'bx1x;
			#1 din=3'b0x0;
			#1 din=3'bx0x;
			#1 din=3'b10x;
			#1 din=3'bxx0;
			#1 din=3'b0xx;
			#1 din=3'bxzz;
			#1 din=3'bxz1;
			#1 din=3'bx1z;
			#1 din=3'bz01;
			#1 din=3'bz10;
			#1 din=3'bzz0;
			#1 din=3'b0zz;
			#1 din=3'bz11;
			#1 din=3'b001;		//inputs are keep on toggling 
			#1 din=3'b010;		
			#1 din=3'b011;
			#1 din=3'b100;
			#1 din=3'b101;
			#1 din=3'b110;		
			#1 din=3'b111;		
			#1 en=1'b0;				//if enable is low,the output will be low only.
			#1 din=3'bx01;		//different input unknown ,the output will be unknown only.
			#1 din=3'bx1x;
			#1 din=3'b0x0;
			#1 din=3'bx0x;
			#1 din=3'b10x;
			#1 din=3'bxx0;
			#1 din=3'b0xx;
			#1 din=3'bxzz;
			#1 din=3'bxz1;
			#1 din=3'bx1z;
			#1 en=1'b1;				//if enable is high
			#1 din=3'bz01;
			#1 din=3'bz10;
			#1 din=3'bzz0;
			#1 din=3'b001;		//inputs are keep on toggling 
			#1 din=3'b010;		
			#1 din=3'b011;
			#1 din=3'b100;
			#1 din=3'b101;
			#1 din=3'b110;		
			#1 din=3'b111;		
			#30 $finish;
		end		//test_cases
	initial
		begin:monitor_blk 
			$monitor("%m time=%0t,	en=%b,	din=%b,	d_out=%b",$time,en,din,d_out);
		end	//monitor_blk
endmodule


//****************************end test bench*********************************//
