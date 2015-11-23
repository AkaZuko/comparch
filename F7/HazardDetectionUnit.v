module HazardDetectionUnit(input Branch, input ID_EX_RegWrite, output reg IF_ID_Write, output reg PCWrite,
                           output reg CntrlSel,
                           input ID_EX_RegWrite2, input EX_MEM_RegWrite2,
                           input ID_EX_MemRead, input [2:0] ID_EX_Rd2, input [2:0] IF_ID_inst1_Rm,
                           input AluSrcB, input [2:0] IF_ID_inst1_Rn, input [2:0] IF_ID_inst1_Rd,
                           input [2:0] IF_ID_inst2_Rm, input [2:0] IF_ID_inst2_Rn, input [2:0] IF_ID_inst2_Rd, input EX_MEM_MemRead);
  // THE ASSUMPTION IS THAT A CHANGE IN THE SENSITIVITY LIST WILL ALWAYS BE THERE
  always@(Branch, ID_EX_RegWrite, ID_EX_RegWrite2, EX_MEM_RegWrite2, ID_EX_MemRead, ID_EX_Rd2, IF_ID_inst1_Rm, AluSrcB, IF_ID_inst1_Rn, IF_ID_inst1_Rd, IF_ID_inst2_Rm, IF_ID_inst2_Rn, IF_ID_inst2_Rd, EX_MEM_MemRead)
  begin 
    IF_ID_Write = 1'b1;
    PCWrite = 1'b1;
    CntrlSel=1'b0;
  
    /*First*/
    if(Branch == 1'b1 && ID_EX_RegWrite == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Second*/
    if(Branch == 1'b1 && ID_EX_RegWrite2 == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    if(Branch == 1'b1 && EX_MEM_RegWrite2 == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Third*/
    if(ID_EX_MemRead == 1'b1 && ID_EX_Rd2 == IF_ID_inst1_Rm)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Fourth*/
    if(ID_EX_MemRead == 1'b1 && AluSrcB == 1'b0 && ID_EX_Rd2 == IF_ID_inst1_Rn)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    if(ID_EX_MemRead == 1'b1 && AluSrcB == 1'b1 && ID_EX_Rd2 == IF_ID_inst1_Rd)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Fifth*/

    // if(ID_EX_MemRead == 1'b1 && (ID_EX_Rd2 == IF_ID_inst2_Rm || ID_EX_Rd2 == IF_ID_inst2_Rn || ID_EX_Rd2 == IF_ID_inst2_Rd))
    if(ID_EX_MemRead == 1'b1 && (ID_EX_Rd2 == IF_ID_inst2_Rm || ID_EX_Rd2 == IF_ID_inst2_Rn))
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Sixth*/
    if(Branch == 1'b1 && EX_MEM_MemRead == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
  end
endmodule