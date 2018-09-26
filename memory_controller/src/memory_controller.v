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


//              File Name : memory_controller.v
//              File Type: Verilog                                 
//              Creation Date : 15-11-2016
//              Last Modified : Tue 15 Nov 2016 07:07:50 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
	module mem_cont #(parameter W_WIDTH=8,
										parameter D_WIDTH=8,
										parameter P_WIDTH=3)
									 (input clk,
										input [W_WIDTH-1:0]wr_data,
										input rst_n,
										input rd_wr_valid,
										input rd_wr_mem,
										input [P_WIDTH-1:0]mem_addr,
										output reg [W_WIDTH-1:0] rd_data);
	
	reg [W_WIDTH-1:0]mem[D_WIDTH-1:0];
	always @(posedge clk)
		begin:alw_blk
			if(!rst_n)
				begin:rst_blk
					rd_data<=1'b0;
				end	//rst_blk
			else
				begin:rst_not
					if(rd_wr_valid)
						begin:rd_valid
							if(rd_wr_mem == 1'b1)
								begin:rd_mem_wrt
									mem[mem_addr]<=wr_data;
								end	//rd_mem_wrt
							else
								begin:read_oprn
									if(rd_wr_mem == 1'b0)
										begin
											rd_data <= mem[mem_addr];
										end
									else
										begin
											mem[mem_addr] <= mem[mem_addr];
										end
								end  // end for read_opern
						end	//rd_valid
					else
						begin:else_valid
							mem[mem_addr]<=mem[mem_addr];
						end	//else_valid
				end	//rst_not
			end	// alw_blk
	endmodule

