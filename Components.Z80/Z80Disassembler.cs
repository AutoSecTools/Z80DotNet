using Components;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    //file:///C:/Users/John/Downloads/UM0080.pdf

    public class Z80Disassembler
    {
        private BinaryReader _reader;

        private Dictionary<ushort, string> _symbols;

        public Z80Disassembler(BinaryReader reader)
            : this(reader, new Dictionary<ushort,string>())
        {
        }

        public Z80Disassembler(BinaryReader reader, Dictionary<ushort, string> symbols)
        {
            _reader = reader;
            _symbols = symbols;
        }

        public Dictionary<ushort, Z80Instruction> Disassemble()
        {
            var instructions = new Dictionary<ushort, Z80Instruction>();
            var unconditionalBranch = false;
            var branches = new List<ushort>();
            branches.AddRange(_symbols.Select(x => (ushort)x.Key));
            ushort lastAddress = 0;

            while (true)
            {
                var address = (ushort)_reader.BaseStream.Position;

                if (address != 0)
                {
                    var size = address - lastAddress;
                    _reader.BaseStream.Position -= size;
                    instructions.Last().Value.ObjectCode = _reader.ReadBytes(size);
                }

                var lastInst = instructions.LastOrDefault();

                var isRet = instructions.Any() &&
                    (lastInst.Value.Opcode == Z80Opcode.RET ||
                    lastInst.Value.OpcodeED == Z80OpcodeED.RETI ||
                    lastInst.Value.OpcodeED == Z80OpcodeED.RETN);

                if (unconditionalBranch ||
                    instructions.ContainsKey(address) ||
                    _reader.BaseStream.Length <= address ||
                    isRet)
                {
                    unconditionalBranch = false;
                    branches = branches
                        .Distinct()
                        .Where(x =>
                            !instructions.ContainsKey(x) &&
                            x < _reader.BaseStream.Length)
                        .ToList();

                    if (branches.Any())
                    {
                        _reader.BaseStream.Position = (int)branches[0];
                        address = branches[0];
                        branches.RemoveAt(0);
                    }
                    else
                    {
                        break;
                    }
                }

                lastAddress = address;

                var opcode = _reader.ReadEnum<Z80Opcode>();

                switch (opcode)
                {
                    ////////////////////////////////////////////////////////////////
                    #region [Opcode]
                    case Z80Opcode.NOP:
                    case Z80Opcode.LD_Ptr_BC_A:
                    case Z80Opcode.INC_BC:
                    case Z80Opcode.INC_B:
                    case Z80Opcode.DEC_B:
                    case Z80Opcode.RLCA:
                    case Z80Opcode.EX_AF_AF:
                    case Z80Opcode.ADD_HL_BC:
                    case Z80Opcode.LD_A_Ptr_BC:
                    case Z80Opcode.DEC_BC:
                    case Z80Opcode.INC_C:
                    case Z80Opcode.DEC_C:
                    case Z80Opcode.RRCA:
                    case Z80Opcode.LD_Ptr_DE_A:
                    case Z80Opcode.INC_DE:
                    case Z80Opcode.INC_D:
                    case Z80Opcode.DEC_D:
                    case Z80Opcode.RLA:
                    case Z80Opcode.ADD_HL_DE:
                    case Z80Opcode.LD_A_Ptr_DE:
                    case Z80Opcode.DEC_DE:
                    case Z80Opcode.INC_E:
                    case Z80Opcode.DEC_E:
                    case Z80Opcode.RRA:
                    case Z80Opcode.INC_HL:
                    case Z80Opcode.INC_H:
                    case Z80Opcode.DEC_H:
                    case Z80Opcode.DAA:
                    case Z80Opcode.ADD_HL_HL:
                    case Z80Opcode.DEC_HL:
                    case Z80Opcode.INC_L:
                    case Z80Opcode.DEC_L:
                    case Z80Opcode.CPL:
                    case Z80Opcode.INC_SP:
                    case Z80Opcode.INC_Ptr_HL:
                    case Z80Opcode.DEC_Ptr_HL:
                    case Z80Opcode.SCF:
                    case Z80Opcode.ADD_HL_SP:
                    case Z80Opcode.DEC_SP:
                    case Z80Opcode.INC_A:
                    case Z80Opcode.DEC_A:
                    case Z80Opcode.CCF:
                    case Z80Opcode.LD_B_B:
                    case Z80Opcode.LD_B_C:
                    case Z80Opcode.LD_B_D:
                    case Z80Opcode.LD_B_E:
                    case Z80Opcode.LD_B_H:
                    case Z80Opcode.LD_B_L:
                    case Z80Opcode.LD_B_Ptr_HL:
                    case Z80Opcode.LD_B_A:
                    case Z80Opcode.LD_C_B:
                    case Z80Opcode.LD_C_C:
                    case Z80Opcode.LD_C_D:
                    case Z80Opcode.LD_C_E:
                    case Z80Opcode.LD_C_H:
                    case Z80Opcode.LD_C_L:
                    case Z80Opcode.LD_C_Ptr_HL:
                    case Z80Opcode.LD_C_A:
                    case Z80Opcode.LD_D_B:
                    case Z80Opcode.LD_D_C:
                    case Z80Opcode.LD_D_D:
                    case Z80Opcode.LD_D_E:
                    case Z80Opcode.LD_D_H:
                    case Z80Opcode.LD_D_L:
                    case Z80Opcode.LD_D_Ptr_HL:
                    case Z80Opcode.LD_D_A:
                    case Z80Opcode.LD_E_B:
                    case Z80Opcode.LD_E_C:
                    case Z80Opcode.LD_E_D:
                    case Z80Opcode.LD_E_E:
                    case Z80Opcode.LD_E_H:
                    case Z80Opcode.LD_E_L:
                    case Z80Opcode.LD_E_Ptr_HL:
                    case Z80Opcode.LD_E_A:
                    case Z80Opcode.LD_H_B:
                    case Z80Opcode.LD_H_C:
                    case Z80Opcode.LD_H_D:
                    case Z80Opcode.LD_H_E:
                    case Z80Opcode.LD_H_H:
                    case Z80Opcode.LD_H_L:
                    case Z80Opcode.LD_H_Ptr_HL:
                    case Z80Opcode.LD_H_A:
                    case Z80Opcode.LD_L_B:
                    case Z80Opcode.LD_L_C:
                    case Z80Opcode.LD_L_D:
                    case Z80Opcode.LD_L_E:
                    case Z80Opcode.LD_L_H:
                    case Z80Opcode.LD_L_L:
                    case Z80Opcode.LD_L_Ptr_HL:
                    case Z80Opcode.LD_L_A:
                    case Z80Opcode.LD_Ptr_HL_B:
                    case Z80Opcode.LD_Ptr_HL_C:
                    case Z80Opcode.LD_Ptr_HL_D:
                    case Z80Opcode.LD_Ptr_HL_E:
                    case Z80Opcode.LD_Ptr_HL_H:
                    case Z80Opcode.LD_Ptr_HL_L:
                    case Z80Opcode.HALT:
                    case Z80Opcode.LD_Ptr_HL_A:
                    case Z80Opcode.LD_A_B:
                    case Z80Opcode.LD_A_C:
                    case Z80Opcode.LD_A_D:
                    case Z80Opcode.LD_A_E:
                    case Z80Opcode.LD_A_H:
                    case Z80Opcode.LD_A_L:
                    case Z80Opcode.LD_A_Ptr_HL:
                    case Z80Opcode.LD_A_A:
                    case Z80Opcode.ADD_A_B:
                    case Z80Opcode.ADD_A_C:
                    case Z80Opcode.ADD_A_D:
                    case Z80Opcode.ADD_A_E:
                    case Z80Opcode.ADD_A_H:
                    case Z80Opcode.ADD_A_L:
                    case Z80Opcode.ADD_A_Ptr_HL:
                    case Z80Opcode.ADD_A_A:
                    case Z80Opcode.ADC_A_B:
                    case Z80Opcode.ADC_A_C:
                    case Z80Opcode.ADC_A_D:
                    case Z80Opcode.ADC_A_E:
                    case Z80Opcode.ADC_A_H:
                    case Z80Opcode.ADC_A_L:
                    case Z80Opcode.ADC_A_Ptr_HL:
                    case Z80Opcode.ADC_A_A:
                    case Z80Opcode.SUB_B:
                    case Z80Opcode.SUB_C:
                    case Z80Opcode.SUB_D:
                    case Z80Opcode.SUB_E:
                    case Z80Opcode.SUB_H:
                    case Z80Opcode.SUB_L:
                    case Z80Opcode.SUB_Ptr_HL:
                    case Z80Opcode.SUB_A:
                    case Z80Opcode.SBC_B:
                    case Z80Opcode.SBC_C:
                    case Z80Opcode.SBC_D:
                    case Z80Opcode.SBC_E:
                    case Z80Opcode.SBC_H:
                    case Z80Opcode.SBC_L:
                    case Z80Opcode.SBC_Ptr_HL:
                    case Z80Opcode.SBC_A:
                    case Z80Opcode.AND_B:
                    case Z80Opcode.AND_C:
                    case Z80Opcode.AND_D:
                    case Z80Opcode.AND_E:
                    case Z80Opcode.AND_H:
                    case Z80Opcode.AND_L:
                    case Z80Opcode.AND_Ptr_HL:
                    case Z80Opcode.AND_A:
                    case Z80Opcode.XOR_B:
                    case Z80Opcode.XOR_C:
                    case Z80Opcode.XOR_D:
                    case Z80Opcode.XOR_E:
                    case Z80Opcode.XOR_H:
                    case Z80Opcode.XOR_L:
                    case Z80Opcode.XOR_Ptr_HL:
                    case Z80Opcode.XOR_A:
                    case Z80Opcode.OR_B:
                    case Z80Opcode.OR_C:
                    case Z80Opcode.OR_D:
                    case Z80Opcode.OR_E:
                    case Z80Opcode.OR_H:
                    case Z80Opcode.OR_L:
                    case Z80Opcode.OR_Ptr_HL:
                    case Z80Opcode.OR_A:
                    case Z80Opcode.CP_B:
                    case Z80Opcode.CP_C:
                    case Z80Opcode.CP_D:
                    case Z80Opcode.CP_E:
                    case Z80Opcode.CP_H:
                    case Z80Opcode.CP_L:
                    case Z80Opcode.CP_Ptr_HL:
                    case Z80Opcode.CP_A:
                    case Z80Opcode.RET_NZ:
                    case Z80Opcode.POP_BC:
                    case Z80Opcode.PUSH_BC:
                    case Z80Opcode.RST_0:
                    case Z80Opcode.RET_Z:
                    case Z80Opcode.RET:
                    case Z80Opcode.RST_8H:
                    case Z80Opcode.RET_NC:
                    case Z80Opcode.POP_DE:
                    case Z80Opcode.PUSH_DE:
                    case Z80Opcode.RST_10H:
                    case Z80Opcode.RET_C:
                    case Z80Opcode.EXX:
                    case Z80Opcode.RST_18H:
                    case Z80Opcode.RET_PO:
                    case Z80Opcode.POP_HL:
                    case Z80Opcode.EX_Ptr_SP_HL:
                    case Z80Opcode.PUSH_HL:
                    case Z80Opcode.RST_20H:
                    case Z80Opcode.RET_PE:
                    case Z80Opcode.JP_Ptr_HL:
                    case Z80Opcode.EX_DE_HL:
                    case Z80Opcode.RST_28H:
                    case Z80Opcode.RET_P:
                    case Z80Opcode.POP_AF:
                    case Z80Opcode.DI:
                    case Z80Opcode.PUSH_AF:
                    case Z80Opcode.RST_30H:
                    case Z80Opcode.RET_M:
                    case Z80Opcode.LD_SP_HL:
                    case Z80Opcode.EI:
                    case Z80Opcode.RST_38H:
                        instructions.Add(address, opcode);
                        break;
                    #endregion

                    ////////////////////////////////////////////////////////////////
                    #region [Opcode] [Imm 8]
                    case Z80Opcode.LD_B_N:
                    case Z80Opcode.LD_C_N:
                    case Z80Opcode.DJNZ_N:
                    case Z80Opcode.LD_D_N:
                    case Z80Opcode.JR_N:
                    case Z80Opcode.LD_E_N:
                    case Z80Opcode.JR_NZ_N:
                    case Z80Opcode.LD_H_N:
                    case Z80Opcode.JR_Z_N:
                    case Z80Opcode.LD_L_N:
                    case Z80Opcode.JR_NC_N:
                    case Z80Opcode.LD_Ptr_HL_N:
                    case Z80Opcode.JR_C_N:
                    case Z80Opcode.LD_A_N:
                    case Z80Opcode.ADD_A_N:
                    case Z80Opcode.ADC_A_N:
                    case Z80Opcode.OUT_Ptr_N_A:
                    case Z80Opcode.SUB_N:
                    case Z80Opcode.IN_A_Ptr_N:
                    case Z80Opcode.SBC_A_N:
                    case Z80Opcode.AND_N:
                    case Z80Opcode.XOR_N:
                    case Z80Opcode.OR_N:
                    case Z80Opcode.CP_N:
                        var instruction = new Z80Instruction(
                                opcode,
                                OperandType.Byte,
                                _reader.ReadByte());

                        instructions.Add(address, instruction);

                        if (opcode.ToString().StartsWith("JR"))
                        {
                            var offset = unchecked((sbyte)(byte)instruction.Immediate);
                            var branch = (ushort)(_reader.BaseStream.Position + offset);
                            branches.Add(branch);

                            if (opcode == Z80Opcode.JR_N)
                            {
                                unconditionalBranch = true;
                            }
                        }
                        break;
                    #endregion

                    ////////////////////////////////////////////////////////////////
                    #region [Opcode] [Imm 16]
                    case Z80Opcode.LD_BC_NN:
                    case Z80Opcode.LD_DE_NN:
                    case Z80Opcode.LD_HL_NN:
                    case Z80Opcode.LD_Ptr_NN_HL:
                    case Z80Opcode.LD_HL_Ptr_NN:
                    case Z80Opcode.LD_SP_NN:
                    case Z80Opcode.LD_Ptr_NN_A:
                    case Z80Opcode.LD_A_Ptr_NN:
                    case Z80Opcode.JP_NZ_NN:
                    case Z80Opcode.JP_NN:
                    case Z80Opcode.CALL_NZ_NN:
                    case Z80Opcode.JP_Z_NN:
                    case Z80Opcode.CALL_Z_NN:
                    case Z80Opcode.CALL_NN:
                    case Z80Opcode.JP_NC_NN:
                    case Z80Opcode.CALL_NC_NN:
                    case Z80Opcode.JP_C_NN:
                    case Z80Opcode.CALL_C_NN:
                    case Z80Opcode.JP_PO_NN:
                    case Z80Opcode.CALL_PO_NN:
                    case Z80Opcode.JP_PE_NN:
                    case Z80Opcode.CALL_PE_NN:
                    case Z80Opcode.JP_P_NN:
                    case Z80Opcode.CALL_P_NN:
                    case Z80Opcode.JP_M_NN:
                    case Z80Opcode.CALL_M_NN:
                        var inst = new Z80Instruction(
                            opcode,
                            OperandType.Word,
                            _reader.ReadUInt16());

                        instructions.Add(address, inst);

                        if (inst.Opcode.ToString().StartsWith("JP_"))
                        {
                            branches.Add(inst.Immediate);

                            if (opcode == Z80Opcode.JP_NN)
                            {
                                unconditionalBranch = true;
                            }
                        }
                        else if (inst.Opcode.ToString().StartsWith("CALL_"))
                        {
                            branches.Add(inst.Immediate);
                        }

                        break;
                    #endregion

                    #region ED Opcodes
                    case Z80Opcode.PrefixED:
                        var opcodeED = _reader.ReadEnum<Z80OpcodeED>();

                        switch (opcodeED)
                        {
                            ////////////////////////////////////////////////////////////////
                            #region [ED] [Opcode]
                            case Z80OpcodeED.IN_B_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_B:
                            case Z80OpcodeED.SBC_HL_BC:
                            case Z80OpcodeED.NEG:
                            case Z80OpcodeED.RETN:
                            case Z80OpcodeED.IM_0:
                            case Z80OpcodeED.LD_I_A:
                            case Z80OpcodeED.IN_C_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_C:
                            case Z80OpcodeED.ADC_HL_BC:
                            case Z80OpcodeED.RETI:
                            case Z80OpcodeED.IN_D_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_D:
                            case Z80OpcodeED.SBC_HL_DE:
                            case Z80OpcodeED.IM_1:
                            case Z80OpcodeED.LD_A_I:
                            case Z80OpcodeED.IN_E_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_E:
                            case Z80OpcodeED.ADC_HL_DE:
                            case Z80OpcodeED.IM_2:
                            case Z80OpcodeED.LD_A_R:
                            case Z80OpcodeED.IN_H_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_H:
                            case Z80OpcodeED.SBC_HL_HL:
                            case Z80OpcodeED.RRD:
                            case Z80OpcodeED.IN_L_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_L:
                            case Z80OpcodeED.ADC_HL_HL:
                            case Z80OpcodeED.RLD:
                            case Z80OpcodeED.SBC_HL_SP:
                            case Z80OpcodeED.IN_A_Ptr_C:
                            case Z80OpcodeED.OUT_Ptr_C_A:
                            case Z80OpcodeED.ADC_HL_SP:
                            case Z80OpcodeED.LDI:
                            case Z80OpcodeED.CPI:
                            case Z80OpcodeED.INI:
                            case Z80OpcodeED.OUTI:
                            case Z80OpcodeED.LDD:
                            case Z80OpcodeED.CPD:
                            case Z80OpcodeED.IND:
                            case Z80OpcodeED.OUTD:
                            case Z80OpcodeED.LDIR:
                            case Z80OpcodeED.CPIR:
                            case Z80OpcodeED.INIR:
                            case Z80OpcodeED.OTIR:
                            case Z80OpcodeED.LDDR:
                            case Z80OpcodeED.CPDR:
                            case Z80OpcodeED.INDR:
                            case Z80OpcodeED.OTDR:
                                instructions.Add(address, opcodeED);
                                break;
                            #endregion

                            ////////////////////////////////////////////////////////////////
                            #region [ED] [Opcode] [Imm16]
                            case Z80OpcodeED.LD_Ptr_NN_BC:
                            case Z80OpcodeED.LD_BC_Ptr_NN:
                            case Z80OpcodeED.LD_Ptr_NN_DE:
                            case Z80OpcodeED.LD_DE_Ptr_NN:
                            case Z80OpcodeED.LD_Ptr_NN_SP:
                            case Z80OpcodeED.LD_SP_Ptr_NN:
                                instructions.Add(
                                    address,
                                    new Z80Instruction(opcodeED, _reader.ReadUInt16()));
                                break;
                            #endregion

                            default:
                                throw new NotImplementedException();
                        }
                        break;
                    #endregion

                    #region DD Opcodes
                    case Z80Opcode.PrefixDD:
                        var opcodeDD = _reader.ReadEnum<Z80OpcodeDD>();

                        switch (opcodeDD)
                        {
                            ////////////////////////////////////////////////////////////////
                            #region [DD] [Opcode]
                            case Z80OpcodeDD.ADD_IX_BC:
                            case Z80OpcodeDD.ADD_IX_DE:
                            case Z80OpcodeDD.INC_IX:
                            case Z80OpcodeDD.ADD_IX_IX:
                            case Z80OpcodeDD.DEC_IX:
                            case Z80OpcodeDD.ADD_IX_SP:
                            case Z80OpcodeDD.POP_IX:
                            case Z80OpcodeDD.EX_Ptr_SP_IX:
                            case Z80OpcodeDD.PUSH_IX:
                            case Z80OpcodeDD.JP_Ptr_IX:
                            case Z80OpcodeDD.LD_SP_IX:
                                instructions.Add(address, opcodeDD);
                                break;
                            #endregion

                            ////////////////////////////////////////////////////////////////
                            #region [DD] [Opcode] [Imm8]
                            case Z80OpcodeDD.INC_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.DEC_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_B_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_C_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_D_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_E_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_H_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_L_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_B:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_C:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_D:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_E:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_H:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_L:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_A:
                            case Z80OpcodeDD.LD_A_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.ADD_A_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.ADC_A_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.SUB_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.SBC_A_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.AND_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.XOR_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.OR_Ptr_IX_Plus_N:
                            case Z80OpcodeDD.CP_Ptr_IX_Plus_N:
                                instructions.Add(
                                    address,
                                    new Z80Instruction(
                                        opcodeDD,
                                        OperandType.Byte,
                                        _reader.ReadByte()));
                                break;
                            #endregion

                            ////////////////////////////////////////////////////////////////
                            #region [DD] [Opcode] [Imm16]
                            case Z80OpcodeDD.LD_IX_NN:
                            case Z80OpcodeDD.LD_Ptr_NN_IX:
                            case Z80OpcodeDD.LD_IX_Ptr_NN:
                            case Z80OpcodeDD.LD_Ptr_IX_Plus_N_N:
                                instructions.Add(
                                    address,
                                    new Z80Instruction(
                                        opcodeDD,
                                        OperandType.Word,
                                        _reader.ReadUInt16()));
                                break;
                            #endregion

                            case Z80OpcodeDD.PrefixDDCB:
                                ////////////////////////////////////////////////////////////////
                                #region [DD] [CB] [Imm8] [Opcode]
                                var operand = _reader.ReadByte();
                                var opcodeDDCB = _reader.ReadEnum<Z80OpcodeDDCB>();

                                switch (opcodeDDCB)
                                {
                                    case Z80OpcodeDDCB.RLC_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RRC_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RL_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RR_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SLA_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SRA_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_0_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_1_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_2_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_3_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_4_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_5_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_6_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.BIT_7_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_0_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_1_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_2_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_3_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_4_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_5_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_6_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.RES_7_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_0_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_1_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_2_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_3_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_4_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_5_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_6_Ptr_IX_Plus_N:
                                    case Z80OpcodeDDCB.SET_7_Ptr_IX_Plus_N:
                                        instructions.Add(
                                            address,
                                            new Z80Instruction(opcodeDDCB, operand));
                                        break;
                                }
                                break;
                                #endregion

                            default:
                                throw new NotImplementedException();
                        }
                        break;
                    #endregion

                    #region CB Opcodes
                    case Z80Opcode.PrefixCB:
                        var opcodeCB = _reader.ReadEnum<Z80OpcodeCB>();

                        switch (opcodeCB)
                        {
                            ////////////////////////////////////////////////////////////////
                            #region [CB] [Opcode]
                            case Z80OpcodeCB.RLC_B:
                            case Z80OpcodeCB.RLC_C:
                            case Z80OpcodeCB.RLC_D:
                            case Z80OpcodeCB.RLC_E:
                            case Z80OpcodeCB.RLC_H:
                            case Z80OpcodeCB.RLC_L:
                            case Z80OpcodeCB.RLC_Ptr_HL:
                            case Z80OpcodeCB.RLC_A:
                            case Z80OpcodeCB.RRC_B:
                            case Z80OpcodeCB.RRC_C:
                            case Z80OpcodeCB.RRC_D:
                            case Z80OpcodeCB.RRC_E:
                            case Z80OpcodeCB.RRC_H:
                            case Z80OpcodeCB.RRC_L:
                            case Z80OpcodeCB.RRC_Ptr_HL:
                            case Z80OpcodeCB.RRC_A:
                            case Z80OpcodeCB.RL_B:
                            case Z80OpcodeCB.RL_C:
                            case Z80OpcodeCB.RL_D:
                            case Z80OpcodeCB.RL_E:
                            case Z80OpcodeCB.RL_H:
                            case Z80OpcodeCB.RL_L:
                            case Z80OpcodeCB.RL_Ptr_HL:
                            case Z80OpcodeCB.RL_A:
                            case Z80OpcodeCB.RR_B:
                            case Z80OpcodeCB.RR_C:
                            case Z80OpcodeCB.RR_D:
                            case Z80OpcodeCB.RR_E:
                            case Z80OpcodeCB.RR_H:
                            case Z80OpcodeCB.RR_L:
                            case Z80OpcodeCB.RR_Ptr_HL:
                            case Z80OpcodeCB.RR_A:
                            case Z80OpcodeCB.SLA_B:
                            case Z80OpcodeCB.SLA_C:
                            case Z80OpcodeCB.SLA_D:
                            case Z80OpcodeCB.SLA_E:
                            case Z80OpcodeCB.SLA_H:
                            case Z80OpcodeCB.SLA_L:
                            case Z80OpcodeCB.SLA_Ptr_HL:
                            case Z80OpcodeCB.SLA_A:
                            case Z80OpcodeCB.SRA_B:
                            case Z80OpcodeCB.SRA_C:
                            case Z80OpcodeCB.SRA_D:
                            case Z80OpcodeCB.SRA_E:
                            case Z80OpcodeCB.SRA_H:
                            case Z80OpcodeCB.SRA_L:
                            case Z80OpcodeCB.SRA_Ptr_HL:
                            case Z80OpcodeCB.SRA_A:
                            case Z80OpcodeCB.SRL_B:
                            case Z80OpcodeCB.SRL_C:
                            case Z80OpcodeCB.SRL_D:
                            case Z80OpcodeCB.SRL_E:
                            case Z80OpcodeCB.SRL_H:
                            case Z80OpcodeCB.SRL_L:
                            case Z80OpcodeCB.SRL_Ptr_HL:
                            case Z80OpcodeCB.SRL_A:
                            case Z80OpcodeCB.BIT_0_B:
                            case Z80OpcodeCB.BIT_0_C:
                            case Z80OpcodeCB.BIT_0_D:
                            case Z80OpcodeCB.BIT_0_E:
                            case Z80OpcodeCB.BIT_0_H:
                            case Z80OpcodeCB.BIT_0_L:
                            case Z80OpcodeCB.BIT_0_Ptr_HL:
                            case Z80OpcodeCB.BIT_0_A:
                            case Z80OpcodeCB.BIT_1_B:
                            case Z80OpcodeCB.BIT_1_C:
                            case Z80OpcodeCB.BIT_1_D:
                            case Z80OpcodeCB.BIT_1_E:
                            case Z80OpcodeCB.BIT_1_H:
                            case Z80OpcodeCB.BIT_1_L:
                            case Z80OpcodeCB.BIT_1_Ptr_HL:
                            case Z80OpcodeCB.BIT_1_A:
                            case Z80OpcodeCB.BIT_2_B:
                            case Z80OpcodeCB.BIT_2_C:
                            case Z80OpcodeCB.BIT_2_D:
                            case Z80OpcodeCB.BIT_2_E:
                            case Z80OpcodeCB.BIT_2_H:
                            case Z80OpcodeCB.BIT_2_L:
                            case Z80OpcodeCB.BIT_2_Ptr_HL:
                            case Z80OpcodeCB.BIT_2_A:
                            case Z80OpcodeCB.BIT_3_B:
                            case Z80OpcodeCB.BIT_3_C:
                            case Z80OpcodeCB.BIT_3_D:
                            case Z80OpcodeCB.BIT_3_E:
                            case Z80OpcodeCB.BIT_3_H:
                            case Z80OpcodeCB.BIT_3_L:
                            case Z80OpcodeCB.BIT_3_Ptr_HL:
                            case Z80OpcodeCB.BIT_3_A:
                            case Z80OpcodeCB.BIT_4_B:
                            case Z80OpcodeCB.BIT_4_C:
                            case Z80OpcodeCB.BIT_4_D:
                            case Z80OpcodeCB.BIT_4_E:
                            case Z80OpcodeCB.BIT_4_H:
                            case Z80OpcodeCB.BIT_4_L:
                            case Z80OpcodeCB.BIT_4_Ptr_HL:
                            case Z80OpcodeCB.BIT_4_A:
                            case Z80OpcodeCB.BIT_5_B:
                            case Z80OpcodeCB.BIT_5_C:
                            case Z80OpcodeCB.BIT_5_D:
                            case Z80OpcodeCB.BIT_5_E:
                            case Z80OpcodeCB.BIT_5_H:
                            case Z80OpcodeCB.BIT_5_L:
                            case Z80OpcodeCB.BIT_5_Ptr_HL:
                            case Z80OpcodeCB.BIT_5_A:
                            case Z80OpcodeCB.BIT_6_B:
                            case Z80OpcodeCB.BIT_6_C:
                            case Z80OpcodeCB.BIT_6_D:
                            case Z80OpcodeCB.BIT_6_E:
                            case Z80OpcodeCB.BIT_6_H:
                            case Z80OpcodeCB.BIT_6_L:
                            case Z80OpcodeCB.BIT_6_Ptr_HL:
                            case Z80OpcodeCB.BIT_6_A:
                            case Z80OpcodeCB.BIT_7_B:
                            case Z80OpcodeCB.BIT_7_C:
                            case Z80OpcodeCB.BIT_7_D:
                            case Z80OpcodeCB.BIT_7_E:
                            case Z80OpcodeCB.BIT_7_H:
                            case Z80OpcodeCB.BIT_7_L:
                            case Z80OpcodeCB.BIT_7_Ptr_HL:
                            case Z80OpcodeCB.BIT_7_A:
                            case Z80OpcodeCB.RES_0_B:
                            case Z80OpcodeCB.RES_0_C:
                            case Z80OpcodeCB.RES_0_D:
                            case Z80OpcodeCB.RES_0_E:
                            case Z80OpcodeCB.RES_0_H:
                            case Z80OpcodeCB.RES_0_L:
                            case Z80OpcodeCB.RES_0_Ptr_HL:
                            case Z80OpcodeCB.RES_0_A:
                            case Z80OpcodeCB.RES_1_B:
                            case Z80OpcodeCB.RES_1_C:
                            case Z80OpcodeCB.RES_1_D:
                            case Z80OpcodeCB.RES_1_E:
                            case Z80OpcodeCB.RES_1_H:
                            case Z80OpcodeCB.RES_1_L:
                            case Z80OpcodeCB.RES_1_Ptr_HL:
                            case Z80OpcodeCB.RES_1_A:
                            case Z80OpcodeCB.RES_2_B:
                            case Z80OpcodeCB.RES_2_C:
                            case Z80OpcodeCB.RES_2_D:
                            case Z80OpcodeCB.RES_2_E:
                            case Z80OpcodeCB.RES_2_H:
                            case Z80OpcodeCB.RES_2_L:
                            case Z80OpcodeCB.RES_2_Ptr_HL:
                            case Z80OpcodeCB.RES_2_A:
                            case Z80OpcodeCB.RES_3_B:
                            case Z80OpcodeCB.RES_3_C:
                            case Z80OpcodeCB.RES_3_D:
                            case Z80OpcodeCB.RES_3_E:
                            case Z80OpcodeCB.RES_3_H:
                            case Z80OpcodeCB.RES_3_L:
                            case Z80OpcodeCB.RES_3_Ptr_HL:
                            case Z80OpcodeCB.RES_3_A:
                            case Z80OpcodeCB.RES_4_B:
                            case Z80OpcodeCB.RES_4_C:
                            case Z80OpcodeCB.RES_4_D:
                            case Z80OpcodeCB.RES_4_E:
                            case Z80OpcodeCB.RES_4_H:
                            case Z80OpcodeCB.RES_4_L:
                            case Z80OpcodeCB.RES_4_Ptr_HL:
                            case Z80OpcodeCB.RES_4_A:
                            case Z80OpcodeCB.RES_5_B:
                            case Z80OpcodeCB.RES_5_C:
                            case Z80OpcodeCB.RES_5_D:
                            case Z80OpcodeCB.RES_5_E:
                            case Z80OpcodeCB.RES_5_H:
                            case Z80OpcodeCB.RES_5_L:
                            case Z80OpcodeCB.RES_5_Ptr_HL:
                            case Z80OpcodeCB.RES_5_A:
                            case Z80OpcodeCB.RES_6_B:
                            case Z80OpcodeCB.RES_6_C:
                            case Z80OpcodeCB.RES_6_D:
                            case Z80OpcodeCB.RES_6_E:
                            case Z80OpcodeCB.RES_6_H:
                            case Z80OpcodeCB.RES_6_L:
                            case Z80OpcodeCB.RES_6_Ptr_HL:
                            case Z80OpcodeCB.RES_6_A:
                            case Z80OpcodeCB.RES_7_B:
                            case Z80OpcodeCB.RES_7_C:
                            case Z80OpcodeCB.RES_7_D:
                            case Z80OpcodeCB.RES_7_E:
                            case Z80OpcodeCB.RES_7_H:
                            case Z80OpcodeCB.RES_7_L:
                            case Z80OpcodeCB.RES_7_Ptr_HL:
                            case Z80OpcodeCB.RES_7_A:
                            case Z80OpcodeCB.SET_0_B:
                            case Z80OpcodeCB.SET_0_C:
                            case Z80OpcodeCB.SET_0_D:
                            case Z80OpcodeCB.SET_0_E:
                            case Z80OpcodeCB.SET_0_H:
                            case Z80OpcodeCB.SET_0_L:
                            case Z80OpcodeCB.SET_0_Ptr_HL:
                            case Z80OpcodeCB.SET_0_A:
                            case Z80OpcodeCB.SET_1_B:
                            case Z80OpcodeCB.SET_1_C:
                            case Z80OpcodeCB.SET_1_D:
                            case Z80OpcodeCB.SET_1_E:
                            case Z80OpcodeCB.SET_1_H:
                            case Z80OpcodeCB.SET_1_L:
                            case Z80OpcodeCB.SET_1_Ptr_HL:
                            case Z80OpcodeCB.SET_1_A:
                            case Z80OpcodeCB.SET_2_B:
                            case Z80OpcodeCB.SET_2_C:
                            case Z80OpcodeCB.SET_2_D:
                            case Z80OpcodeCB.SET_2_E:
                            case Z80OpcodeCB.SET_2_H:
                            case Z80OpcodeCB.SET_2_L:
                            case Z80OpcodeCB.SET_2_Ptr_HL:
                            case Z80OpcodeCB.SET_2_A:
                            case Z80OpcodeCB.SET_3_B:
                            case Z80OpcodeCB.SET_3_C:
                            case Z80OpcodeCB.SET_3_D:
                            case Z80OpcodeCB.SET_3_E:
                            case Z80OpcodeCB.SET_3_H:
                            case Z80OpcodeCB.SET_3_L:
                            case Z80OpcodeCB.SET_3_Ptr_HL:
                            case Z80OpcodeCB.SET_3_A:
                            case Z80OpcodeCB.SET_4_B:
                            case Z80OpcodeCB.SET_4_C:
                            case Z80OpcodeCB.SET_4_D:
                            case Z80OpcodeCB.SET_4_E:
                            case Z80OpcodeCB.SET_4_H:
                            case Z80OpcodeCB.SET_4_L:
                            case Z80OpcodeCB.SET_4_Ptr_HL:
                            case Z80OpcodeCB.SET_4_A:
                            case Z80OpcodeCB.SET_5_B:
                            case Z80OpcodeCB.SET_5_C:
                            case Z80OpcodeCB.SET_5_D:
                            case Z80OpcodeCB.SET_5_E:
                            case Z80OpcodeCB.SET_5_H:
                            case Z80OpcodeCB.SET_5_L:
                            case Z80OpcodeCB.SET_5_Ptr_HL:
                            case Z80OpcodeCB.SET_5_A:
                            case Z80OpcodeCB.SET_6_B:
                            case Z80OpcodeCB.SET_6_C:
                            case Z80OpcodeCB.SET_6_D:
                            case Z80OpcodeCB.SET_6_E:
                            case Z80OpcodeCB.SET_6_H:
                            case Z80OpcodeCB.SET_6_L:
                            case Z80OpcodeCB.SET_6_Ptr_HL:
                            case Z80OpcodeCB.SET_6_A:
                            case Z80OpcodeCB.SET_7_B:
                            case Z80OpcodeCB.SET_7_C:
                            case Z80OpcodeCB.SET_7_D:
                            case Z80OpcodeCB.SET_7_E:
                            case Z80OpcodeCB.SET_7_H:
                            case Z80OpcodeCB.SET_7_L:
                            case Z80OpcodeCB.SET_7_Ptr_HL:
                            case Z80OpcodeCB.SET_7_A:
                                instructions.Add(address, opcodeCB);
                                break;
                            #endregion
                                                            
                            default:
                                throw new NotImplementedException();
                        }
                        break;
                    #endregion

                    #region FD Opcodes
                    case Z80Opcode.PrefixFD:
                        var opcodeFD = _reader.ReadEnum<Z80OpcodeFD>();

                        switch (opcodeFD)
                        {
                            ////////////////////////////////////////////////////////////////
                            #region [FD] [Opcode]
                            case Z80OpcodeFD.ADD_IY_BC:
                            case Z80OpcodeFD.ADD_IY_DE:
                            case Z80OpcodeFD.INC_IY:
                            case Z80OpcodeFD.ADD_IY_IY:
                            case Z80OpcodeFD.DEC_IY:
                            case Z80OpcodeFD.ADD_IY_SP:
                            case Z80OpcodeFD.POP_IY:
                            case Z80OpcodeFD.EX_Ptr_SP_IY:
                            case Z80OpcodeFD.PUSH_IY:
                            case Z80OpcodeFD.JP_Ptr_IY:
                            case Z80OpcodeFD.LD_SP_IY:
                                instructions.Add(address, opcodeFD);
                                break;
                            #endregion

                            ////////////////////////////////////////////////////////////////
                            #region [FD] [Opcode] [Imm16]
                            case Z80OpcodeFD.LD_IY_NN:
                            case Z80OpcodeFD.LD_Ptr_NN_IY:
                            case Z80OpcodeFD.LD_IY_Ptr_NN:
                            case Z80OpcodeFD.LD_Ptr_IY_Plus_N_N:
                                instructions.Add(
                                    address,
                                    new Z80Instruction(opcodeFD, OperandType.Word, _reader.ReadUInt16()));
                                break;
                            #endregion

                            case Z80OpcodeFD.PrefixFDCB:
                                ////////////////////////////////////////////////////////////////
                                #region [FD] [CB] [Imm8] [Opcode]
                                var operand = _reader.ReadByte();
                                var opcodeFDCB = _reader.ReadEnum<Z80OpcodeFDCB>();

                                switch (opcodeFDCB)
                                {
                                    case Z80OpcodeFDCB.RLC_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RRC_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RL_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RR_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SLA_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SRA_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_0_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_1_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_2_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_3_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_4_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_5_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_6_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.BIT_7_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_0_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_1_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_2_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_3_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_4_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_5_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_6_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.RES_7_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_0_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_1_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_2_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_3_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_4_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_5_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_6_Ptr_IY_Plus_N:
                                    case Z80OpcodeFDCB.SET_7_Ptr_IY_Plus_N:
                                        instructions.Add(
                                            address,
                                            new Z80Instruction(opcodeFDCB, _reader.ReadByte()));
                                        break;

                                    default:
                                        throw new NotImplementedException();
                                }
                                #endregion

                                break;

                            default:
                                throw new NotImplementedException();
                        }
                        break;
                    #endregion

                    default:
                        throw new NotImplementedException();
                }
            }

            return instructions
                .OrderBy(x => x.Key)
                .ToDictionary(x => x.Key, x => x.Value); ;
        }
    }


}
