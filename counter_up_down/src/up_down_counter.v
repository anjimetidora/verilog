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


//              File Name : up_down_counter.v
//              File Type: Verilog                                 
//              Creation Date : 06-10-2016
//              Last Modified : Thu 20 Oct 2016 11:09:11 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
`define WIDTH 8
module up_down_counter #(parameter WIDTH=8)
											(input clk,
											 input rst_n,
										 	 input en,
											 input load_n,
										 	 input up_dn,
										 	 input [`WIDTH-1:0]data_in,
										 	 output reg[`WIDTH-1:0]data_out);
	always @(posedge clk)
		begin//:always_blocks
			if(!rst_n)
				begin//:reset_block
					data_out<=1'b0;
				end//:end_reset
			else
				begin:else_blk
					case(load_n)								//load_case{
						1'b1:
								case(en)            //case_enable {
									1'b1:
										case(up_dn)			//updn_case {
											1'b1:
												begin:up_dn1_blk
													data_out<=data_out+1'b1;
												end	//up_dn1_blk
											1'b0:
												begin:up_dn0_blk
													if(data_out == 1'b0)
														begin:dn_least
															data_out<=1'b0;
														end	//dn_least
														else
															begin:data_out_not0
																data_out<=data_out-1'b1;
															end	//data_out_not0
															//default logic?
												end	//up_dn0_blk
											default:
												begin:default_blk
													data_out<=data_out;
												end	//default_blk
										endcase	//updn_case }
									default:
										begin:def_blk
											data_out<=data_out;
										end	//def_blk
									endcase		//case_enable }
						1'b0:
							begin:en0_blk
								data_out<=data_in;
							end	//en0_blk
						default:
							begin:load_default_blk
							data_out<=data_out;
							end	//load_default_blk
					endcase								//load_case}
															//default logic?
				end
			end
	 endmodule


