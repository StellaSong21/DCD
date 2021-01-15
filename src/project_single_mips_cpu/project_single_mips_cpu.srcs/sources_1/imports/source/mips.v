`timescale 1ns / 1ps

//mips
module mips(clk, reset, pc, instr, memwrite, aluout, writedata, readdata);
  input clk, reset;
  input [31:0] instr, readdata;
  output [31:0] pc, aluout, writedata;
  output memwrite;
  
  wire memtoreg, branch, pcsrc, zero, alusrc, regdst, regwrite, jump;
  wire [2:0] alucontrol;
  
  controller c(instr[31:26], instr[5:0], zero, 
  memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
  /*
  	op：
  	funct：
  	zero：是datapath生成的，当zero为1且branch为1
  	regwrite：写入寄存器
  	regdst：第二个操作数在寄存器中
  	alusrc：
  	branch：只有BEQ比较为1，需要得到zero
  	memwrite：写入内存
  	memtoreg：从内存加载到寄存器
  	jump：是否为跳转指令
   */
  datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, 
  	regwrite, jump, alucontrol,
   	zero, pc,  /* 输出 */
   	instr,
   	aluout, writedata, /*  输出 */
    readdata);
endmodule
