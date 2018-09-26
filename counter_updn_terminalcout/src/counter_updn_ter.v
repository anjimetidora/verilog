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


//              File Name : counter_updn_ter.v
//              File Type: Verilog                                 
//              Creation Date : 07-10-2016
//              Last Modified : Mon 24 Jul 2017 06:49:39 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
`define WIDTH 8
module up_down_counter(input clk,
											 input rst_n,
										 	 input en,
											 input load_n,
										 	 input up_dn,
										 	 input [`WIDTH-1:0]data_in,
											 output reg cout,
										 	 output reg [`WIDTH-1:0]data_out);
	always @(posedge clk)
		begin//:always_blocks
			if(!rst_n)
				begin//:reset_block
					data_out<=1'b0;
				end//:end_reset
			else
				begin:else_blk
					case(load_n)								//enable_case
						1'b1:
								case(en)
									1'b1://case_updn
										case(up_dn)			//updn_case
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
												end	//up_dn0_blk
											default:
												begin:updn_default_blk
													data_out<=data_out;
												end	//default_blk
										endcase	//updn_case
									default:
										begin:en_def_blk
											data_out<=data_out;
										end	//en_def_blk
							endcase		//case_enable
					1'b0:
						begin:load0_blk
							data_out<=data_in;
						end	//load0_blk
					default:
							begin:en_1
								data_out<=data_out;
							end
					endcase								//load_case
				end
			end
	 always@(posedge clk)
	 	begin:alwys_blk
			if((up_dn==1'b1) && (data_out=='d255))
				begin:if_blk
					cout<=1'b1;
				end	//if_blk
			else if((up_dn==1'b0) && (data_out=='b0))
				begin:els_blk
					cout<=1'b1;
				end	//els_blk
			else
				begin:else_blk
					cout<=1'b0;
				end	//else_blk
		end	//alwys_blk
endmodule



