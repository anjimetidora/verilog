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


//              File Name : Tx.v
//              File Type: Verilog                                 
//              Creation Date : 18-11-2016
//              Last Modified : Fri 30 Dec 2016 08:52:38 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
	module Tx #(parameter T_WIDTH=8,
							parameter TX_READY=2'b00,
							parameter TX_REQ=2'b01,
							parameter TX_SEND=2'b10)
						 (input tx_clk,
							input tx_rst,
						 	input [T_WIDTH-1:0]tx_datain,
							input tx_ready,
							input tx_ack,
							output reg tx_req,
							output reg [T_WIDTH-1:0]tx_dataout);

	reg [T_WIDTH-7:0]cst,nst;
	reg temp_tx;
	always @(*)
		begin:alw_blk
			case(cst)
				TX_READY:
					begin:tx_redy_blk
						if(tx_ready)
							begin:tx_redy_1
								//tx_req='b1;
								temp_tx='b1;
								nst=TX_REQ;
							end
						else
							begin:tx_redy_0
								nst=TX_READY;
							end	//tx_redy_0
						end	//tx_redy_blk
				TX_REQ:
					begin:tx_re
						if(tx_ack)
							begin:tx_req_1
								$display("tx_ack_1");
								nst=TX_SEND;
							//	tx_req='b0;
								temp_tx='b0;
							end	//tx_req_1
						else
							begin:tx_req_0
								nst=TX_READY;
							end	//tx_req_0
					end	//tx_req
				TX_SEND:
					begin:tx_send
						 tx_dataout=tx_datain;
						 $display("tx");
						 //tx_ack='b0;
						 nst=TX_REQ;
					end	//tx_send
				endcase
		end	//alw_blk


					always @(posedge tx_clk)
						begin:alw_blkk
							if(!tx_rst)
								begin:tx_rst_blk
									cst<=TX_READY;
									tx_dataout<='d0;
								end	//tx_rst_blk
								else 
									begin:else_part
										cst<=nst;
										tx_req<=temp_tx;
									end	//else_part
						end	//alw_blkk

	endmodule
