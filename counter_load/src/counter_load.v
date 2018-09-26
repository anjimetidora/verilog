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


//              File Name : counter_load.v
//              File Type: Verilog                                 
//              Creation Date : 06-10-2016
//              Last Modified : Tue 15 Nov 2016 02:01:41 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module counter_load #(parameter I_WIDTH=8,
											parameter	O_WIDTH=8)
								 	 	(input clk,
										 input reset_n,
									 	 input enable,
									 	 input load,
										 output reg [O_WIDTH-1:0]data_out,
									 	 input [I_WIDTH-1:0]data_in,
									 	 output reg cout);
	always@(posedge clk)
		begin					//counter start
			if(!reset_n)
				begin//not_reset start
					data_out<=1'b0;
				end						//not_reset end
			else
				begin:else_blk
					case(enable)
						1'b1:
							begin:enable1_blk
								data_out<=data_out+1'b1;
							if(load)
								begin:load_blk
									data_out<=data_in;
								end	//load_blk
							else
								begin:load_x_z_0
									data_out<=data_out+1'b1;
								end	//load_x_z_o
							end	//enable1_blk
						1'b0:
							begin:enable0_blk
								data_out<=data_out;
							end	//enable0_blk
						default:
							begin:enable_unknown
								data_out<=data_out;
							end	//enable_unknown
						endcase
				end	//else_blk
		end	//alw_blk
	always@(posedge clk)
		begin:alw_blk
			if(data_out =='d255)
				begin:data_out_255
					cout<=1'b1;
				end	//data_out_255
			else 
				begin:cout_blk
					cout<=1'b0;
				end	//cout_blk
		end
endmodule


