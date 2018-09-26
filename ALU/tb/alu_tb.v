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


//              File Name : alu_tb.v
//              File Type: Verilog                                 
//              Creation Date : 07-10-2016
//              Last Modified : Wed 16 Nov 2016 06:13:52 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	parameter WIDTH1=8;
	parameter WIDTH2=4;
	parameter WIDTH=16;
	reg clk,rst;
	reg [WIDTH1-1:0]in1,in2;
	reg [WIDTH2-1:0]alu_cmd;
	wire [WIDTH-1:0]out1;
	//reg [15:0]alu_cmd_1,in1_1,in2_1;
alu dut_insta(.clk(clk),.rst(rst),.in1(in1),.in2(in2),.alu_cmd(alu_cmd),.out1(out1));
	initial
		begin
			reset_task(1'b0);
			reset_task(1'b1);
			airthmatic(4'b0000,'d4,'d8);
			airthmatic(4'b0001,'d8,'d2);
			airthmatic(4'b0010,'d2,'d2);
			airthmatic(4'b0100,'d8,'d2);
			airthmatic(4'b0101,'d7,'d8);
			airthmatic(4'b0110,'d4,'d4);
			airthmatic(4'b0111,'d4,'d8);
			airthmatic(4'b1000,'d4,'d4);
			airthmatic(4'b1001,'d4,'d8);
			airthmatic(4'b1011,'d4,'d8);
			airthmatic(4'b1100,'d4,'d8);
			airthmatic(4'b1101,'d8,'d4);
			airthmatic(4'b1110,'d9,'d2);
			#1150 $finish;
		end
	initial
		begin
			clk=1'b0;
			forever #5 clk=~clk;
		end
	task airthmatic(input [8:0]alu_cmd_1,[31:0]in1_1,[31:0]in2_1);
		begin
			@(negedge clk) alu_cmd = alu_cmd_1;  in1 = in1_1; in2 = in2_1;
		end
	endtask
	task reset_task(input reset_1);
		begin
			@(negedge clk) rst = reset_1;
		end
	endtask
	

	initial
		begin:mnt_blk
			$monitor("%m time=%0t,rst=%0b,in1=%0d,in2=%0d,alu_cmd=%0d,out1=%0d,",$time,rst,in1,in2,alu_cmd,out1);
		end	//monitor_blk
endmodule

