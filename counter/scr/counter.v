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


//              File Name : counter.v
//              File Type: Verilog                                 
//              Creation Date : 06-10-2016
//              Last Modified : Tue 15 Nov 2016 11:58:55 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module counter #(parameter O_WIDTH=8)
								(input rst,
								 input clk,
								 input en,
								 output reg cout,
						 	 	 output [O_WIDTH-1:0]count);
	
	reg [O_WIDTH-1:0]tem_count;
	assign count = tem_count;							
  always@(posedge clk)
	begin:alw_blk						//counter
		if(!rst) begin//not_reset input
			tem_count<=1'b0;
		end						//end not_reset
		else 
			begin:else_blk
				case(en)		//enable_case{
					1'b1:
						begin:en1_blk
							tem_count<=tem_count+1'b1;
						end
					default:
						begin:en_unknown
							tem_count<=tem_count;
						end	//en_unknown
				endcase	//enable_case}
			end	//else_blk
		end	//alw_blk
 endmodule
