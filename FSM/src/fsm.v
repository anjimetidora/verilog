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


//              File Name : fsm.v
//              File Type: Verilog                                 
//              Creation Date : 08-10-2016
//              Last Modified : Thu 17 Nov 2016 03:33:45 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module fsm #(parameter I_WIDTH=2,
						 parameter O_WIDTH=3,
						 parameter s0=3'b000,
						 parameter s1=3'b001,
						 parameter s2=3'b010,
						 parameter s3=3'b011,
						 parameter s4=3'b100)
						(input rst,
					   input clk,
				 	   input [I_WIDTH-1:0]in,
				 	 	 output reg out);
	reg [O_WIDTH-1:0] cst,nst;
	reg out_1;
	always@(in or cst)
		begin:alw_blk
			case(cst)
				s0:
					case(in)
						2'b00:
							begin:in0_blk
								nst=s0;
								out_1  = 1'b0;
							end	//in0_blk
						2'b10:
							begin:in10_blk
								nst=s1;
								out_1  = 1'b1;
							end	//in10_blk
						2'b11:
							begin:in11_blk
								nst=s2;
								out_1  = 1'b1;
							end	//in11_blk
						2'b01:
							begin:in01_blk
								nst=s4;
								out_1  = 1'b1;
							end	//in01_blk
						default:
						begin:so_state
							nst=s0;
							out_1=1'b0;
						end	//s0_state
						endcase	//s0_case
				s1:
					casex(in)
						2'bx1:
							begin:inx1_blk
								nst=s1;
								out_1  = 1'b0;
							end	//inx1_blk
						2'b10:
							begin:in1_blk
								nst=s2;
								out_1  = 1'b0;
							end	//in10_blk
						2'b00:
							begin:in00_blk
								nst=s0;
								out_1  = 1'b0;
							end	//in00_blk
						default:
							begin:s1_state
								nst=s1;
								out_1=1'b0;
							end	//s1_state
						endcase	//s1_case
				s2:
					casex(in)
						2'b1x:
							begin:in1x_blk
								nst=s3;
								out_1  = 1'b1;
							end	//in1x_blk
						2'b0x:
							begin:in0x_blk
								nst=s1;
								out_1  = 1'b0;
								$display("hello");
							end	//in0x_blk
						default:
							begin:s2_state
								nst=s2;
								out_1=1'b0;
								//$display("s2 state");
							end	//s2_state
						endcase	//s2_case
				s3:
					casex(in)
						2'bx0:
							begin:inx0_blk
								nst=s3;
								out_1  = 1'b1;
							end	//inx0_blk
						2'bx1:
							begin:inxx1_blk
								nst=s4;
								out_1  = 1'b1;
							end	//inx1_blk
						default:
							begin:s3_state
								nst=s3;
								out_1=1'b0;
							end	//s3_state
						endcase	//s3_case
				s4:
					casex(in)
						2'b11:
							begin:in111_blk
								nst=s4;
								out_1  = 1'b1;
							end	//in1_blk
						2'b0x:
							begin:in00x_blk
								nst=s0;
								out_1  = 1'b0;
							end	//in0x_blk
						2'b10:
							begin:in100_blk
								nst=s0;
								out_1  = 1'b1;
							end	//in10_blk
						default:
							begin:s4_state
								nst=s4;
								out_1=1'b0;
							end	//s4_state
						endcase	//s4_case
					default:
						begin:cst_def
							nst=s0;
						end	//cst_def
			endcase	//cst_case
		end	//alw_blk
	always@(posedge clk)
		begin:alw2_blk
			if(!rst)
				begin:reset_blk
					cst<=s0;
					out<=1'b0;
				end	//reset_blk
			else
				begin:reset1_blk
					cst<=nst;
					out<=out_1;
				end	//reset0_blk
		end	//alw2_blk
		endmodule












/*	parameter s0=3'b001,	s1=3'b001,	s2=3'b010,	s3=3'b011,	s4=3'b100;
	reg [2:0] cst,nst;
	reg out_1;
	always@(in or cst)
		begin
			casex(cst)
				s0:
					begin:s0_blk
						if(in==2'b00)
							begin
								nst=s0;
								out_1  = 1'b0;
							end
						else if(in==2'b10)
							begin
								nst=s1;
								out_1  = 1'b1;
							end
						else if(in==2'b11)
							begin
								nst=s2;
								out_1  = 1'b1;
							end
						else if(in==2'b01)
							begin
								nst=s4;
								out_1  = 1'b1;
							end
					 end:s0_blk
				s1:
					begin:s1_blk
						if(in===2'bx1)
							begin
								nst=s1;
								out_1  = 1'b0;
							end
						else if(in==2'b10)
							begin
								nst=s2;
								out_1  = 1'b0;
							end
						else if(in==2'b00)
							begin
								nst=s0;
								out_1  = 1'b0;
							end
						end:s1_blk
				s2:
					begin:s2_blk
						if(in===2'b1x)
							begin
								nst=s3;
								out_1  = 1'b1;
							end
						else if(in===2'b0x)
							begin
								nst=s1;
								out_1  = 1'b0;
							end
						end:s2_blk
				s3:
					begin:s3_blk
						if(in===2'bx0)
							begin
								nst=s3;
								out_1  = 1'b1;
							end
						else if(in===2'bx1)
							begin
								nst=s4;
								out_1  = 1'b1;
							end
						end:s3_blk
				s4:
					begin:s4_blk
						if(in==2'b11)
							begin
								nst=s4;
								out_1  = 1'b1;
							end
						else if(in===2'b0x)
							begin
								nst=s0;
								out_1  = 1'b0;
							end
						else if(in==2'b10)
							begin
								nst=s0;
								out_1  = 1'b1;
							end
						end:s4_blk
					default:
						begin
							nst=s0;
						end
			endcase
		end
	always@(posedge clk)
		begin
			if(!rst)
				begin
					cst<=s0;
					out<=1'b0;
				end
			else
				begin
					cst<=nst;
					out<= out_1 ;
				end
		end
endmodule*/














