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


//              File Name : mux.v
//              File Type: Verilog                                 
//              Creation Date : 04-10-2016
//              Last Modified : Thu 29 Dec 2016 11:53:38 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//*******************************description*********************************//
//	1. the module is 4:1 mux with select lines.
//	2. if select 00 ,the output will be in0.
//	3. if select 01 ,the output will be in1.
//	4. if select 10 ,the output will be in2.
//	5.if select 11, the output will be in3.
//	6. if select xx or zz, the out will be x only.
//
//*******************************DUT*****************************************//
//
module mux(input [1:0]sel,
					 input in0,in1,in2,in3,
					 output mux_out);
	reg out;
	assign mux_out=out;
	always@(*)
		begin:alw_blk
			case(sel)
				2'b00:
					begin:sel0_blk			//if sel is 00
						out=in0;
					end	//sel0_blk
				2'b01:
					begin:sel1_blk			//if sel is 01
						out=in1;
					end	//sel1_blk
				2'b10:
					begin:sel2_blk			//if sel is 10
						out=in2;
					end	//sel2_blk
				2'b11:
					begin:sel3_blk			//if sel is 11
						out=in3;
					end	//sel3_blk
					default:
						begin:selxz_blk		//other than any of these it goes into default
							out=1'bx;
						end	//selxz_blk
				endcase
				end	//alw_blk
endmodule

//**********************************end DUT *********************************//






