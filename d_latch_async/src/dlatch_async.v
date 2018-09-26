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


//              File Name : dlatch_async.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 25 Oct 2016 05:51:05 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//*********************************description*******************************//
//	1. This DUT is d_latch with asynchronous.
//	2. if reset is low, thenable whatever the input the output will be 0;
//	3. if enable low the output will follows previous.
//	5.if enable is high output follows input
//	4. if enable is x or z ,then output will be x only.
//
//************************************DUT************************************//
//
module d_latch_async(input enable,reset,data,
											output reg q);
	always@(data or reset or enable)
		begin:alw_blk
			if(!reset)							//reset is active low
				begin:rst_blk
					q=1'b0;
				end	//rst_blk
			else
				begin:enable_blk
					case(enable)					//different test cases
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
								q=1'b0;
							end	//enxz_blk
					endcase								//end different test cases
			end	//enable_blk
		end	//alw_blk
endmodule

