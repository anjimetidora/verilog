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


//              File Name : Rx.v
//              File Type: Verilog                                 
//              Creation Date : 18-11-2016
//              Last Modified : Mon 21 Nov 2016 03:01:03 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
	module Rx	#(parameter R_WIDTH=8,
							parameter RX_READY=2'b00,
							parameter RX_REQ=2'b01,
							parameter RX_RECIV=2'b10)
						 (input rx_req,
							input rx_rst,
							input rx_clk,
							input rx_ready,
						  input [R_WIDTH-1:0]rx_datain,
							output reg [R_WIDTH-1:0]rx_dataout,
							output reg rx_ack);
			reg [R_WIDTH-7:0]cst,nst;
		reg temp_sa;
			always@(*)
				begin:alw_blk
					case(cst)
						RX_READY:
							begin:rx_ready_blk
								if(rx_ready)
									begin:rx_ready_1
										nst=RX_REQ;
									end	//rx_ready_blk
								else
									begin:rx_ready_0
										nst=RX_READY;
									end	//rx_ready_0
							end	//rx_ready_blk
						RX_REQ:
							begin:rx_re
								if(rx_req)
									begin:rx_req_1
									//	rx_ack='b1;
										temp_sa='b1;
										nst=RX_RECIV;
										$display("rx_req_1");
									end	//rx_req_1
								else
									begin:rx_req_0
										//rx_ack='b0;
										temp_sa='b0;
										nst=RX_READY;
									end	//rx_req_0
							end	//rx_req
						RX_RECIV:
							begin:rx_recive
								$display("received");
								rx_dataout=rx_datain;
								nst=RX_REQ;
							//	temp_sa='b0;
							end	//rx_recive
						endcase
				end	//alw_blk
							always @(posedge rx_clk)
								begin:alw_blkkk
									if(!rx_rst)
										begin:rst_0
											cst<=RX_READY;
											rx_dataout<='d0;
										end	//rst_0
									else
										begin:rst_1
											cst<=nst;
											rx_ack<=temp_sa;
										end	//rst_1
								end	//alw_blkkk
						
	endmodule
