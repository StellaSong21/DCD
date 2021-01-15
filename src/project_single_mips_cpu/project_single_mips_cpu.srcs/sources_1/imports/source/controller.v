`timescale 1ns / 1ps

//controller
module controller(op, funct, zero, memtoreg, memwrite, 
	pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
  input [5:0] op, funct;
  output memtoreg, memwrite, alusrc, regdst, regwrite, jump;
  output pcsrc;
  input zero;
  output [2:0] alucontrol;
  
  wire [2:0] aluop;
  wire branch;
  
    /* 
  	regwrite：写入寄存器
  	regdst：第二个操作数在寄存器中
  	alusrc：
  	branch：只有BEQ为1，需要得到zero
  	memwrite：写入内存
  	memtoreg：从内存加载到寄存器
  	jump：是否为跳转指令
  	aluop：aluoperation
   */
  
  maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
  aludec ad(funct, aluop, alucontrol);
  
  assign pcsrc = branch & zero;
endmodule
