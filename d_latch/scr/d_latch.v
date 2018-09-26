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


//              File Name : d_latch.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Fri 28 Jul 2017 07:39:41 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//*******************************description*********************************//
//	1.dut is d_latch
//	2.if en is high, then output follows input
//	3. if en is low, then output is previous value.
//	4. if en is z or x the output is x only.
//********************************DUT****************************************//
//
module d_latch(input enable,data,
								output reg q);
	always@(data or enable)
		begin:alw_blk
			case(enable)				//different cases
				1'b1:
					begin:en1_blk
						q=data;
					end	//en1_blk
				1'b0:
					begin:en0_blk
						q=q;
					end	//en0_blk
				default:
					begin:enxz_blk
						q='bx;
					end	//enxz_blk
				endcase								//end different cases
	end	//alw_blk
endmodule