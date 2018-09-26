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


//              File Name : shift.v
//              File Type: Verilog                                 
//              Creation Date : 27-10-2016
//              Last Modified : Thu 27 Oct 2016 04:50:47 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
//
//
module shift(input [7:0]din,
						 input clk,rst,
					 	 input enable,
					 	 output reg out);
reg [7:0]temp;
reg [2:0]i;

always@(posedge clk)
	begin:alw_blk
		if(rst)
		 begin
      i<='d8;
			out<='d0;
			temp<='d0;
		 end
 else begin
   if (enable)
   begin:en_blk
	     temp<=din;
				$display("temp:%b din:%b",temp,din);
				if(i>=0)
	    	begin
				temp<={1'b0,temp[7:1]};
				out<=temp[0];
				//{temp,out}<={{0,temp[7:1]},temp[0]};

				//$display("temp:%b i:%d",temp,i);
				i<=i-1;
			end
			else begin
				i<=0;
			end
			end	//en_blk
		else
			begin:en0_blk
				temp<=temp;
			end	//en0_blk
		end
		end	//alw_blk
endmodule





module tb;
reg [7:0]din;
	reg clk,enable,rst;
wire out;

shift dut_insta(.din(din),.clk(clk),.out(out),.enable(enable),.rst(rst));

initial
	begin:clk_gen
		clk=1'b0;
		forever #5 clk=~clk;
	end	//clk_gen

initial
	begin:test_cases
		@(negedge clk);rst=1'b1;//enable=1'b1;din='b11110101;
	repeat(2) @(negedge clk);
	@(negedge clk);rst=1'b0;enable=1'b1;din=8'b11110101;
		#100 $finish;
	end

	initial
	begin
		$monitor("%m time=%0t,	clk:%b,din=%b,	out=%b",$time,clk,din,out);
	end
	endmodule
