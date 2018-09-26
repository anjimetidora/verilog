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


//              File Name : stack.v
//              File Type: Verilog                                 
//              Creation Date : 20-10-2016
//              Last Modified : Thu 03 Nov 2016 11:33:05 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
//
module stack #(parameter W_WIDTH=8,
							 parameter D_WIDTH=8,
						 	 parameter P_WIDTH=3)
							(input reset_n,
							 input wr_data,
							 input clk,
							 input push_pop,
							 input [W_WIDTH-1:0]data_in,
							 output reg [W_WIDTH-1:0]data_out,
							 output reg empty,
							 output reg full,
							 output reg push_err_on_full,
							 output reg pop_err_on_empty
							);
							
	reg [P_WIDTH-1:0]ptr;
	reg [W_WIDTH-1:0]mem[D_WIDTH-1:0];
	always@(posedge clk)
		begin:alw_blk
			if(!reset_n)
				begin:reset0_blk
					ptr<=1'b0;
					full<=1'b0;
					empty<=1'b0;
					push_err_on_full<=1'b0;
					pop_err_on_empty<=1'b0;
				end	//reset_blk
			else
					begin:reset_else_blk
						case(push_pop)	//push_pop_case
							1'b1:
								begin:push_blk
									if(ptr == (D_WIDTH-1))
										begin:if_blk
											mem[ptr]<=data_in;
											full<=1'b1;
											//$display("if stack is full");
										end	//if_blk
									else
										begin:else_blk
											mem[ptr]<=data_in;
											ptr<=ptr+1'b1;
											full<=1'b0;
											empty<=1'b0;
											push_err_on_full<=1'b0;
											pop_err_on_empty<=1'b0;
										end	//else_blk
								end	//push_blk
							1'b0:
								begin:pop_blk
									if(ptr == 'd0)
										begin:if_blk
											ptr<=ptr-1'b1;
											empty<=1'b1;
										end	//if_blk
									else
										begin:else_blk
											data_out<=mem[ptr];
											ptr<=ptr-1'b1;
											empty<=1'b0;
											full<=1'b0;
											pop_err_on_empty<=1'b0;
											push_err_on_full<=1'b0;
										end	//else_blk
								end	//pop_blk
							default:
								begin:push_pop_default_blk
									ptr<=ptr;
								end	//push_pop_default_blk
						endcase	//push_pop_case
					end	//reset_else_blk	
				end	//alw_blk
	always@(posedge clk)
		begin:alww_blk
			case(full)
				1'b1:
					begin:full_1
						if(push_pop)	//if_push is giving
							begin:if_blk
								push_err_on_full<=1'b1;
							end	//if_blk
						end	//if_push is giving
				default:
					begin:full_0
						push_err_on_full<=1'b0;
					end	//full_0
				endcase	//full
			case(empty)
					1'b1:
						begin:empty_1
							if(push_pop)	//if_pop 1
								begin:if_blk
									pop_err_on_empty<=1'b1;
								end	//if_blk
							end	//if_blk
					default:
						begin:empty_0
							pop_err_on_empty<=1'b0;
						end	//emdpty_0
					endcase	//empty
				end	//alw_blk
	/*always@(posedge clk)
		begin:al_blk
			if(ptr==(D_WIDTH-1))
				begin:depth
					ptr<=ptr;
					ptr<=ptr-1'b1;
					data_out<=mem[ptr];
				end	//depth
			else if(ptr==1'b0)
				begin:ptr_0
					ptr<=ptr;
					data_out<=mem[ptr];
				end
			else
				begin:not_depth
					ptr<=ptr-1;
					data_out<=mem[ptr];
				end	//not_depth
		end*/
endmodule



