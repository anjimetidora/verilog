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


//              File Name : alu.v
//              File Type: Verilog                                 
//              Creation Date : 07-10-2016
//              Last Modified : Wed 26 Oct 2016 11:07:21 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module alu	#(parameter WIDTH1=8,
							parameter WIDTH2=4,
							parameter WIDTH=16)
							(input [WIDTH1-1:0]in1,
							 input [WIDTH1-1:0]in2,
						 	 input clk,
						 	 input rst,
							 /*output reg [2:0]count,*/
							 input [WIDTH2-1:0]alu_cmd,
						 	 output reg[WIDTH-1:0]out1);
	//reg [`WIDTH-1:0]q,q1;
	//reg [`WIDTH-1:0]out_temp;
	//reg [`WIDTH-1:0]out1;
	//assign out = out_temp;
	always @(in1 or in2 or alu_cmd)
		begin:alw_blk
			case(alu_cmd)
				4'b0000://addition
					begin
						out1=in1+in2;
					end
				4'b0001://subtraction
					begin
						out1=in1-in2;
					end
				4'b0010://left shifting
					begin
						out1=in1<<in2;
					end
				4'b0100://right shifting
					begin
						out1=in1>>in2;
					end
				4'b0101://bit wise operator
					begin
						out1=in1 | in2;
					end
				4'b0110://logical and
					begin
						out1=in1 && in2;
					end
				4'b0111://bit wise xor operator
					begin
						out1=in1 ^ in2;
					end
				4'b1000://logical or operator
					begin
						out1=in1 || in2;
					end
				4'b1001://reduction xnor operator
					begin
						out1=(~^in1);
					end
				4'b1011://bit wise xor operator
					begin
						out1=(^in1);
					end
				4'b1100://multiplication
					begin
						out1=in1*in2;
					end
				4'b1101://division
					begin
						out1=in1/in2;
					end
				4'b1110://modulus
					begin
						out1=in1%in2;
					end
					default:
						begin
							out1=1'bx;
						end
				endcase
			end:alw_blk
	/*	always@(posedge clk)
			begin:alwy_blk
				if(!rst)
					begin:if_blk
						out_temp<=1'b0;
					end:if_blk
				else
					begin:else_blk
						q <= out1;
						q1 <= q;
						out_temp <= q1;
						if(count<'d2)
							begin
								count <= count + 'd1;
							end
						else
							begin
								count <= 1;
								out_temp<=out_temp;
							end
				end:else_blk
		end:alwy_blk*/
endmodule






