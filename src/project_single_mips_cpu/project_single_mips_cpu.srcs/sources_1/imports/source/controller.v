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
  	regwrite��д��Ĵ���
  	regdst���ڶ����������ڼĴ�����
  	alusrc��
  	branch��ֻ��BEQΪ1����Ҫ�õ�zero
  	memwrite��д���ڴ�
  	memtoreg�����ڴ���ص��Ĵ���
  	jump���Ƿ�Ϊ��תָ��
  	aluop��aluoperation
   */
  
  maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
  aludec ad(funct, aluop, alucontrol);
  
  assign pcsrc = branch & zero;
endmodule
