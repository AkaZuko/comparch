module TopModule(input clk, input reset, output Result_aluOut, output Result_MemOut);
	
	// .....................................................related to EXMEM Pipeline
	wire P3_C,P3_N,P3_V,P3_Z,P3_MemRead, P3_MemWrite, P3_RegWrite1, P3_RegWrite2;
	wire [2:0] P3_rd1, P3_rd2;
	wire [31:0]  P3_aluOut, P3_MemAdderOut;
	wire [7:0] P3_RegRd2;

	// .....................................................related to MEM WB pipeline
	wire [2:0] P4_rd1, P4_rd2;
	wire [31:0] P4_aluOut, P4_MemOut;
	wire P4_C, P4_N, P4_Z,P4_V, P4_C2, P4_N2, P4_Z2, P4_V2, P4_RegWrite1, P4_RegWrite2;

	// .....................................................EX stage
	wire n_out, N, Z, C, V;
	wire [1:0] ForwardA1, ForwardA2,ForwardB1,ForwardB2, ForwardC2;
	wire ForwardD2;
	wire [31:0] aluOut,SrcAMuxOut, SrcBMuxOut, FwdB1MuxOut,FwdA1MuxOut,MemAdderOut, FwdA2MuxOut, FwdB2MuxOut, FwdC2MuxOut;
	wire[2:0] RdSelMuxOut;
	
	// .....................................................IF
	wire [31:0] BranchOut, JumpSExtShiftedValue,ExceptionAdd;
	wire PcWrite;
	wire [1:0] PcSrc;
	wire [31:0] PcMuxOut,PcOut,PcAdderOut;
	wire [31:0] IMOut;

	mux4to1_32bits pcmux01(PcAdderOut,BranchOut, {PcOut[31:28],JumpSExtShiftedValue[27:0]}, ExceptionAdd, PcSrc, PcMuxOut);
	register32bit_normal pc01( clk,reset, PcWrite, 1'b1, PcMuxOut, PcOut );
	adder adderpc01(PcOut, 32'd4, PcAdderOut);
	IM_Mem im01(clk,reset,1'b0,1'b1, PcOut, 32'd0, IMOut);

	// .....................................................IF/ID pipeline
	wire IFIDWrite;
	wire [31:0] P1_PcAdderOut;
	wire [15:0] Inst1, Inst2;
	IFID_pipeline p1(clk, reset, 1'b1, IMOut, PcAdderOut, IFIDWrite, P1_PcAdderOut,  Inst1, Inst2);

	// .....................................................ID
	wire [31:0] BranchSExt,JumpSExt,BranchSExtShiftedValue,SubSExt;

	//wire z1Write, Z1flag, Z1out,n1Write, N1flag, N1out,c1Write,C1flag, C1out,v1Write,V1flag, V1out,z2Write,Z2flag,n2Write, N2flag,c2Write,C2flag,v2Write,V2flag;
	wire z1Write, Z1out,n1Write, N1out,c1Write, C1out,v1Write, V1out,z2Write,n2Write,c2Write,v2Write;

	//wire [2:0] destReg1,destReg2;
	wire [31:0] Regrm1, Regrd1_1, Regrd1_2, Regrm2, Regrn2, Regrd2;
	wire regWrite1,regWrite2,branch,memRead, memWrite,aluSrcA, aluSrcB;
	wire [1:0]aluOp;
	wire [8:0] Instr1SigOut;
	wire [6:0] Instr2SigOut;
	wire CntrlSel;
	wire [8:0] P2_Instr1SigOut;
	wire [6:0] P2_Instr2SigOut;
	wire P4_N_signal,P4_Z_signal, P4_C_signal, P4_V_signal;
	wire P4_N2_signal, P4_Z2_signal, P4_C2_signal, P4_V2_signal;

	signExt8to32 branchsext01( Inst2[15:8], BranchSExt);
	signExt11to32 jumpsext01( Inst2[15:5], JumpSExt);
	leftshiftby1 left01(BranchSExt, BranchSExtShiftedValue);
	leftshiftby1 left02(JumpSExt, JumpSExtShiftedValue);

	adder branchAdder01(P1_PcAdderOut, BranchSExtShiftedValue, BranchOut);

	// ..................................................... REGISTER FILE
	registerFile regfile01(clk, reset,Inst1[15:13], Inst1[12:10], Inst1[7:5],Inst2[15:13], Inst2[12:10], Inst2[9:7],P4_RegWrite1, P4_RegWrite2,P4_rd1, P4_rd2, P4_aluOut, P4_MemOut, Regrm1, Regrd1_1, Regrd1_2, Regrm2, Regrn2, Regrd2);
	signExt8to32 subSExt01( Inst1[15:8], SubSExt);

	// .....................................................FLAGS
	register1bit_normal z1flag01(clk, reset,  P4_Z2_signal | P4_Z_signal, 1'b1, P4_Z | P4_Z2, Z1out);
	register1bit_normal n1flag01(clk, reset,  P4_N2_signal | P4_N_signal, 1'b1, P4_N | P4_N2, N1out);
	register1bit_normal c1flag01(clk, reset,  P4_C2_signal | P4_C_signal, 1'b1, P4_C | P4_C2, C1out);
	register1bit_normal v1flag01(clk, reset,  P4_V2_signal | P4_V_signal, 1'b1, P4_V | P4_V2, V1out);

	wire [2:0] P2_rd1_2, P2_rd1_1, P2_rm1, P2_rm2, P2_rn2, P2_rd2;
	wire P3_N_signal, P3_Z_signal, P3_C_signal, P3_V_signal;

	/// ??? previously : branch & n_out
	HazardDetectionUnit hazard01(branch, P2_Instr1SigOut[8], IFIDWrite,PcWrite,CntrlSel,P2_Instr2SigOut[6], P3_RegWrite2, P2_Instr2SigOut[4], P2_rd2, Inst1[15:13], aluSrcB, Inst1[12:10], Inst1[7:5],Inst2[15:13],Inst2[12:10], Inst2[9:7],P3_MemRead);

	// .....................................................CONTROL CKT
	// ??? PcWrite was also generated next to branch signal
	CntrlCkt cc01({Inst2, Inst1},n_out, regWrite1,regWrite2,z1Write, n1Write,c1Write, v1Write,z2Write, n2Write,c2Write,v2Write,aluOp, branch, PcSrc,memRead, memWrite,aluSrcA, aluSrcB);
	
	//2 muxes for control signals
	mux2to1_9bits idm1({regWrite1, aluSrcA, aluSrcB, aluOp,z1Write, n1Write,c1Write, v1Write} , 9'd0,CntrlSel, Instr1SigOut);
	mux2to1_7bits idm2({regWrite2,memRead, memWrite,z2Write, n2Write,c2Write,v2Write},7'd0,CntrlSel, Instr2SigOut);

	// .....................................................IDEX pipeline

	wire [31:0] P2_Regrm1,  P2_Regrd1_1, P2_Regrd1_2, P2_Regrm2 ,  P2_Regrn2, P2_Regrd2,P2_subImmExt;
	IDEX_pipeline p2( 	clk, reset, 1'b1, 1'b1,
						Instr1SigOut, Instr2SigOut,
						SubSExt, Inst1[7:5], Inst1[12:10],Inst1[15:13],
						Regrm1, Regrd1_1, Regrd1_2, 
           				Regrm2, Regrn2, Regrd2,
           				Inst2[15:13], Inst2[12:10], Inst2[9:7],

           				P2_Instr1SigOut,P2_Instr2SigOut, P2_subImmExt,
           				P2_rd1_2, P2_rd1_1, P2_rm1, 
           				P2_Regrm1,  P2_Regrd1_1, P2_Regrd1_2, 
           				P2_Regrm2 ,  P2_Regrn2, P2_Regrd2,
           				P2_rm2, P2_rn2, P2_rd2);

	// .....................................................EX stage

	ForwardingUnit fu01(P2_rm1,P3_rd1,P4_RegWrite1, P4_rd1,P2_rd1_1,P2_Instr1SigOut[6],P2_rd1_2, P3_RegWrite1,P2_rm2,P2_rd2,P2_rn2,P4_RegWrite2,P4_rd2, P3_rd2, P3_N,P4_N2 | P4_N, n_out,ForwardA1,ForwardA2,ForwardB1,ForwardB2, ForwardC2, ForwardD2);

	alu alu01( SrcAMuxOut, FwdB1MuxOut, P3_C,  P2_Instr1SigOut[5:4], aluOut,  N, Z, C, V);

	adder lwadder01(FwdA2MuxOut, FwdB2MuxOut, MemAdderOut);

	mux4to1_32bits fwda1mux01(P2_Regrm1, P4_aluOut,P3_aluOut,P4_MemOut, ForwardA1, FwdA1MuxOut);
	mux2to1_32bits muxalusrcA01(P2_subImmExt, FwdA1MuxOut,P2_Instr1SigOut[7],SrcAMuxOut );
	mux2to1_32bits muxalusrcB01(P2_Regrd1_1,P2_Regrd1_2,P2_Instr1SigOut[6],SrcBMuxOut );
	mux4to1_32bits fwdb1mux01(SrcBMuxOut, P4_aluOut, P3_aluOut,P4_MemOut,ForwardB1, FwdB1MuxOut);
	mux4to1_32bits fwda2mux01(P2_Regrm2, P4_aluOut, P3_aluOut,P4_MemOut, ForwardA2, FwdA2MuxOut);
	mux4to1_32bits fwdb2mux01(P2_Regrn2, P4_aluOut, P3_aluOut,P4_MemOut, ForwardB2, FwdB2MuxOut);
	mux4to1_32bits fwdc2mux01(P2_Regrd2, P4_aluOut, P3_aluOut,P4_MemOut, ForwardC2, FwdC2MuxOut);
	mux2to1_3bits rd1mux01(P2_rd1_1, P2_rd1_2,P2_Instr1SigOut[6], RdSelMuxOut);

	// .....................................................EX_MEM pipeline
 	wire P3_N2_signal, P3_Z2_signal, P3_C2_signal, P3_V2_signal;
	ex_mem p3(	clk, reset,   P2_Instr1SigOut[8],  P2_Instr2SigOut[6], RdSelMuxOut,
			  	N, Z, C, V,
			  	P2_Instr1SigOut[2], P2_Instr1SigOut[3], P2_Instr1SigOut[1], P2_Instr1SigOut[0],
			  	P2_Instr2SigOut[2], P2_Instr2SigOut[3], P2_Instr2SigOut[1], P2_Instr2SigOut[0],
			  	P2_Regrd2[7:0],
			  	P2_rd2, aluOut, MemAdderOut, P2_Instr2SigOut[5], P2_Instr2SigOut[4], 
				P3_N, P3_Z, P3_C, P3_V,
				P3_N_signal, P3_Z_signal, P3_C_signal, P3_V_signal,
				P3_N2_signal, P3_Z2_signal, P3_C2_signal, P3_V2_signal,
				P3_rd1, P3_rd2, P3_RegRd2, P3_aluOut,P3_MemAdderOut,
				P3_MemRead, P3_MemWrite,P3_RegWrite1, P3_RegWrite2);



	// .....................................................MEM stage
	wire [7:0] MemDataInput,dataMemOut;
	wire [31:0] zeroExtOffset;
	wire N2, Z2, C2, V2;

	mux2to1_8bits meminmux01(P3_RegRd2, P4_MemOut[7:0],ForwardD2, MemDataInput);
	Mem dm01( clk, reset,P3_MemWrite,P3_MemRead, P3_aluOut, MemDataInput,dataMemOut );
	zeroExt8to32 zext01(dataMemOut, zeroExtOffset);
	flag_generator fg01(clk,reset,zeroExtOffset[7:0],N2, Z2, C2, V2);

	// .....................................................MEM WB pipeline
	MEM_WB memwb01( clk, reset, 1'b1, 1'b1, P3_RegWrite1, P3_RegWrite2, P3_rd1, P3_aluOut,
				P3_N, P3_Z, P3_C, P3_V,
				P3_N_signal, P3_Z_signal, P3_C_signal, P3_V_signal,
				N2,Z2, C2,V2,
				P3_N2_signal, P3_Z2_signal, P3_C2_signal, P3_V2_signal,
				P3_rd2, zeroExtOffset, P4_rd1, P4_aluOut,
				P4_N,P4_Z, P4_C, P4_V,
				P4_N_signal,P4_Z_signal, P4_C_signal, P4_V_signal,
				P4_N2, P4_Z2, P4_C2, P4_V2,
				P4_N2_signal, P4_Z2_signal, P4_C2_signal, P4_V2_signal,
				P4_MemOut, P4_rd2, P4_RegWrite1, P4_RegWrite2);


endmodule



module pipeline_COMP_TestBench;
	reg clk;
	reg reset;
	wire [31:0] Result1, Result2;
	pipeline uut (.clk(clk), .reset(reset), .Result_MemOut(Result1), .Result_aluOut(Result2));

	always
	#5 clk=~clk;
	
	initial
	begin
		clk=0; reset=1;
		#8  reset=0;	
		
		//#210 $finish; 
	end
endmodule