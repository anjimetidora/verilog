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


//              File Name : decoder.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 18 Oct 2016 11:49:45 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//*****************************description***************************************//
// 1. it is a 3:8 decoder module.
// 2.	if enable the circuit follows the input.
// 3. if din is 000, then output is 1.
// 4. if din is 001, then output is 2.
// 5. if din is 010, then output is 4.
// 6. if din is 011, then output is 8.
// 7. if din is 100, then output is 16.
// 8. if din is 101, then output is 32.
// 9. if din is 110, then output is 64.
// 10. if din is 111, then output is 128.
// 11. if din is z or x,then output is x only.  
//******************************DUT******************************************//
//
module decoder #(parameter I_WIDTH=3,
								 parameter O_WIDTH=8)
								(input en,
								input [I_WIDTH-1:0]din,
								output [O_WIDTH-1:0]d_out);
	reg [O_WIDTH-1:0]dout;
	assign d_out=dout;
	always@(din or en)
		begin:alw_blk
			if(en)
				begin:en_blk			//din
					case(din)				//different cases
						3'b000:
							begin:din0_blk
								dout='d1;
							end	//din0_blk
						3'b001:
							begin:din1_blk
								dout='d2;
							end	//din1_blk
						3'b010:
							begin:din2_blk
								dout='d4;
							end	//din2_blk
						3'b011:
							begin:din3_blk
								dout='d8;
							end	//din3_blk
						3'b100:
							begin:din4_blk
								dout='d16;
							end	//din4_blk
						3'b101:
							begin:din5_blk
								dout='d32;
							end	//din5_blk
						3'b110:
							begin:din6_blk
								dout='d64;
							end	//din6_blk
						3'b111:
							begin:din7_blk
								dout='d128;
							end	//din7_blk
						default:
							begin:dinxz_blk
								dout='dx;
							end	//dinxz_blk
					endcase					//end different cases
				end	//en_blk				end enable
			else
				begin:en0_blk
					dout='d0;
				end	//en0_blk
		end	//alw_blk
endmodule

//*********************************end DUT **********************************//
