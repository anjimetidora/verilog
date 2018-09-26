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


//              File Name : gate_latch.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Mon 14 Nov 2016 03:32:20 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module gate_latch(input enable,gate,d,
									output reg q);
		wire and_out;
		assign and_out=(enable & gate);
		always@(and_out or d)
			begin:alw_blk
				case(and_out)								//different test cases
					1'b1:
						begin:and_out1_blk
							q=d;
							end	//and_out1_blk
					1'b0:
						begin:and_out0_blk
							q=1'bx;
						end	//and_out0_blk
					default:
						begin:and_outxz_blk
							q=q;
						end	//and_outxz_blk
				endcase										//end different test cases
			end	//alw_blk
endmodule