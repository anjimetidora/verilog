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


//              File Name : QOS.v
//              File Type: Verilog                                 
//              Creation Date : 16-11-2016
//              Last Modified : Wed 16 Nov 2016 03:27:23 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
		module qos #(parameter R_WIDTH=4,	//recharge width
								 parameter A_WIDTH=8)	//available credit
								(input clk,
								 input rst,
							 	 input new_pkt,
							 	 input [R_WIDTH-1:0]recharge,
								 output reg [A_WIDTH-1:0]available_credit,
								 output reg no_available_credit);
			reg [R_WIDTH-1:0]count;
			wire [A_WIDTH-1:0]total;
			assign total=available_credit+recharge;
			always @(posedge clk)
				begin:alw_blk
					if(!rst)
						begin:rst_0
							available_credit<='b0;
							no_available_credit<='b0;
							count<='b0;
						end	//rst_0
					else
						begin:rst_1
							if(available_credit>'d0)
								begin:avail_credit_1
									if(new_pkt)
										begin:new_pkt_1
											available_credit<=available_credit-1'b1;
									    no_available_credit<='b0;
											count<=count+'d1;
											if(total<'d255)
												begin:credit_255
													if(count=='d5)
														begin:count_5
															$display("count_5");
															available_credit<=available_credit+recharge;
															no_available_credit<='b0;
															count<='d0;
														end	//count_5
													else
														begin:else_blk
															available_credit<=available_credit;
															no_available_credit<='b0;
														end	//else_blk
												end	//credi_255
											else
												begin:credit_0
													available_credit<=available_credit;
												end	//credit_0
										end	//new_pkt_blk
									else
										begin:new_pkt_0
											available_credit<=available_credit;
									    no_available_credit<='b0;
											count<=count+'d1;
											if(total<'d255)
												begin:credit_255
													if(count=='d5)
														begin:count_5
															$display("count_5");
															available_credit<=available_credit+recharge;
															no_available_credit<='b0;
															count<='d0;
														end	//count_5
													else
														begin:else_blk
															available_credit<=available_credit;
															no_available_credit<='b0;
														end	//else_blk
												end	//credi_255
											else
												begin:credit_0
													available_credit<=available_credit;
												end	//credit_0
								$display("avaible_credit_1");
									end	//new_pkt_0
								end	//avail_credit_1
							else
								begin:avaible_credit_0
									available_credit<=available_credit;
									no_available_credit<='b1;
									count<=count+'d1;
					if(total<'d255)
						begin:credit_255
							if(count=='d5)
								begin:count_5
									$display("count_5");
									available_credit<=available_credit+recharge;
									no_available_credit<='b0;
									count<='d0;
								end	//count_5
							else
								begin:else_blk
									available_credit<=available_credit;
									no_available_credit<='b0;
								end	//else_blk
						end	//credi_255
					else
						begin:credit_0
							available_credit<=available_credit;
						end	//credit_0
									$display("avaible_credit_0");
								end	//avaible_credit_0
						end	//rst_1
					end	//alw_blk
		/*	always @(posedge clk)
				begin:alw_blk2
					if(total<'d255)
						begin:credit_255
							if(count=='d5)
								begin:count_5
									$display("count_5");
									available_credit<=available_credit+recharge;
									no_available_credit<='b0;
									count<='d0;
								end	//count_5
							else
								begin:else_blk
									available_credit<=available_credit;
									no_available_credit<='b0;
								end	//else_blk
						end	//credi_255
					else
						begin:credit_0
							available_credit<=available_credit;
						end	//credit_0
			 end	//alw_blk2*/
 endmodule

