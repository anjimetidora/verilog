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


//              File Name : FIFO.v
//              File Type: Verilog                                 
//              Creation Date : 10-11-2016
//              Last Modified : Mon 11 Dec 2017 02:19:31 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module FIFO #(parameter W_WIDTH=8,
							parameter D_WIDTH=8,
							parameter P_WIDTH=4)
						 (input clk,
							input rst_n,
							input push,
							input pop,
							input [W_WIDTH-1:0]in_data,
							output reg [D_WIDTH-1:0]data_out,
							output reg full,
							output reg empty,
							output reg push_count,pop_count,
							output reg push_err_on_full,
							output reg pop_err_on_empty);

	reg[P_WIDTH-1:0]wrt_ptr;
	reg[P_WIDTH-1:0]red_ptr;
	reg [W_WIDTH-1:0] mem[D_WIDTH-1:0];
	always @(posedge clk)
		begin:alw_blk
			if(!rst_n)
				begin:reset_blk
					data_out<='bx;
					full<='b0;
					empty<='b1;
					push_err_on_full<='b0;
					pop_err_on_empty<='b0;
					red_ptr<='b0;
					wrt_ptr<='b0;
				end	//reset_blk
			else
				begin:reset_1
					if(push ==1 && pop ==0)
						begin:push_blk
							if((wrt_ptr[3] !=red_ptr[3]) && (wrt_ptr[2:0] ==red_ptr[2:0]))
							begin:if_depth_full
								if(push_count<'d1)
									begin:push_count0
										push_count<='b1;
										full<='b1;
									end	//push_count1
								else
									begin:push_count1
										push_err_on_full<='b1;
									end	//push_count1
								end	//if_depth_full
							else
								begin:if_depth_notfull
									mem[wrt_ptr[2:0]]<=in_data;
									wrt_ptr<=wrt_ptr+'d1;
									full<='b0;
									empty<='b0;
									push_count<='d0;
									pop_err_on_empty<='d0;
									push_err_on_full<='d0;
								end	//if_depth_notfull
							end	//push_blk
						else if(push ==0 && pop ==1)
							begin:pop_blk
								if((wrt_ptr[3] == red_ptr[3]) && (wrt_ptr[2:0] == red_ptr[2:0]))
									begin:depth_empty
										if(pop_count<'d1)
											begin:pop_count0
												empty<='b1;
												pop_count<='b1;
											end	//pop_count0
										else
											begin:pop_count1
												pop_err_on_empty<='b1;
											end	//pop_count1
									end	//depth_empty
								else
									begin:depth_not_empty
										data_out<=mem[red_ptr[2:0]];
										red_ptr<=red_ptr+'d1;
										empty<='b0;
										pop_err_on_empty<='b0;
										push_err_on_full<='b0;
										full<='b0;
										pop_count<='d0;
									end	//depth_not_empty
							end	//pop_blk
						else
							begin:if_push_pop_x
								mem[wrt_ptr[2:0]]<=mem[wrt_ptr[2:0]];
								mem[red_ptr[2:0]]<=mem[red_ptr[2:0]];
								wrt_ptr<=wrt_ptr;
								red_ptr<=red_ptr;
							end	//if_push_pop_x
						end	//reset_1
			end	//alw_blk	
	endmodule


									




					
