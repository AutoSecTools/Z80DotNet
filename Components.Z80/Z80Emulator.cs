using Components.ConsolePlus;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public sealed class Z80Emulator : IDisposable
    {
        private byte[] _memory;

        private Z80Context _context;

        private Z80Decoder _decoder;

        private MemoryStream _stream;

        private BinaryReader _reader;

        private Dictionary<ushort, string> _symbols;

        private Z80Instruction _instruction;

        private ushort _instructionAddress;

        public Z80Emulator(byte[] memory, Dictionary<ushort, string> symbols)
        {
            _memory = memory;
            _context = new Z80Context();
            _stream = new MemoryStream(_memory);
            _reader = new BinaryReader(_stream);
            _decoder = new Z80Decoder(_reader);
            _symbols = symbols;
        }

        public void Emulate()
        {
            while (true)
            {
                ExecuteInstruction();
            }
        }

        private void ExecuteInstruction()
        {
            _instructionAddress = _context.PC;
            _instruction = _decoder.Decode();
            _context.PC = (ushort)_stream.Position;

            string symbol;

            if (_symbols.TryGetValue(_instructionAddress, out symbol))
            {
                Cli.WriteLine("~|Yellow~~Black~{0}~R~", symbol);
            }

            Cli.WriteLine(
                "Executing ~Magenta~0x{0:x4}~R~ ~Cyan~{1}~R~",
                _instructionAddress,
                _instruction.ToString());

            switch (_instruction.Opcode)
            {
                // NOP
                case Z80Opcode.NOP:
                    break;

                // INT
                case Z80Opcode.DI:
                    _context.Iff1 = false;
                    _context.Iff2 = false;
                    break;

                case Z80Opcode.EI:
                    _context.Iff2 = _context.Iff1;
                    _context.Iff1 = true;
                    break;

                // OUT
                case Z80Opcode.OUT_Ptr_N_A:
                    _context.AddressBusLow = (byte)_instruction.Immediate;
                    break;

                // LD
                case Z80Opcode.LD_A_N: _context.A = (byte)_instruction.Immediate; break;
                case Z80Opcode.LD_B_N: _context.B = (byte)_instruction.Immediate; break;
                case Z80Opcode.LD_C_N: _context.C = (byte)_instruction.Immediate; break;
                case Z80Opcode.LD_D_N: _context.D = (byte)_instruction.Immediate; break;

                
                case Z80Opcode.LD_A_A:
                    _context.A = _context.A;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_A_B:
                    _context.A = _context.B;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_A_C:
                    _context.A = _context.C;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_A_D:
                    _context.A = _context.D;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_A_E:
                    _context.A = _context.E;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_A_H:
                    _context.A = _context.H;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_A_L:
                    _context.A = _context.L;
                    SetLoadAFlags();
                    break;

                case Z80Opcode.LD_B_A:
                    _context.B = _context.A;
                    break;

                #region LD_R_R
                case Z80Opcode.LD_B_B: _context.B = _context.B; break;
                case Z80Opcode.LD_B_C: _context.B = _context.C; break;
                case Z80Opcode.LD_B_D: _context.B = _context.D; break;
                case Z80Opcode.LD_B_E: _context.B = _context.E; break;
                case Z80Opcode.LD_B_H: _context.B = _context.H; break;
                case Z80Opcode.LD_B_L: _context.B = _context.L; break;
                case Z80Opcode.LD_C_A: _context.C = _context.A; break;
                case Z80Opcode.LD_C_B: _context.C = _context.B; break;
                case Z80Opcode.LD_C_C: _context.C = _context.C; break;
                case Z80Opcode.LD_C_D: _context.C = _context.D; break;
                case Z80Opcode.LD_C_E: _context.C = _context.E; break;
                case Z80Opcode.LD_C_H: _context.C = _context.H; break;
                case Z80Opcode.LD_C_L: _context.C = _context.L; break;
                case Z80Opcode.LD_D_A: _context.D = _context.A; break;
                case Z80Opcode.LD_D_B: _context.D = _context.B; break;
                case Z80Opcode.LD_D_C: _context.D = _context.C; break;
                case Z80Opcode.LD_D_D: _context.D = _context.D; break;
                case Z80Opcode.LD_D_E: _context.D = _context.E; break;
                case Z80Opcode.LD_D_H: _context.D = _context.H; break;
                case Z80Opcode.LD_D_L: _context.D = _context.L; break;
                case Z80Opcode.LD_E_A: _context.E = _context.A; break;
                case Z80Opcode.LD_E_B: _context.E = _context.B; break;
                case Z80Opcode.LD_E_C: _context.E = _context.C; break;
                case Z80Opcode.LD_E_D: _context.E = _context.D; break;
                case Z80Opcode.LD_E_E: _context.E = _context.E; break;
                case Z80Opcode.LD_E_H: _context.E = _context.H; break;
                case Z80Opcode.LD_E_L: _context.E = _context.L; break;
                case Z80Opcode.LD_H_A: _context.H = _context.A; break;
                case Z80Opcode.LD_H_B: _context.H = _context.B; break;
                case Z80Opcode.LD_H_C: _context.H = _context.C; break;
                case Z80Opcode.LD_H_D: _context.H = _context.D; break;
                case Z80Opcode.LD_H_E: _context.H = _context.E; break;
                case Z80Opcode.LD_H_H: _context.H = _context.H; break;
                case Z80Opcode.LD_H_L: _context.H = _context.L; break;
                case Z80Opcode.LD_L_A: _context.L = _context.A; break;
                case Z80Opcode.LD_L_B: _context.L = _context.B; break;
                case Z80Opcode.LD_L_C: _context.L = _context.C; break;
                case Z80Opcode.LD_L_D: _context.L = _context.D; break;
                case Z80Opcode.LD_L_E: _context.L = _context.E; break;
                case Z80Opcode.LD_L_H: _context.L = _context.H; break;
                case Z80Opcode.LD_L_L: _context.L = _context.L; break;
                #endregion

                case Z80Opcode.LD_BC_NN: _context.BC = _instruction.Immediate; break;
                case Z80Opcode.LD_DE_NN: _context.DE = _instruction.Immediate; break;
                case Z80Opcode.LD_HL_NN: _context.HL = _instruction.Immediate; break;
                case Z80Opcode.LD_SP_NN: _context.SP = _instruction.Immediate; break;

                case Z80Opcode.LD_A_Ptr_BC: _context.A = _memory[_context.BC]; break;
                case Z80Opcode.LD_A_Ptr_DE: _context.A = _memory[_context.DE]; break;
                case Z80Opcode.LD_A_Ptr_HL: _context.A = _memory[_context.HL]; break;

                // AND 
                case Z80Opcode.AND_A:
                    _context.A &= _context.A;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.AND_B:
                    _context.A &= _context.B;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.AND_C:
                    _context.A &= _context.C;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.AND_D:
                    _context.A &= _context.D;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.AND_E:
                    _context.A &= _context.E;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.AND_H:
                    _context.A &= _context.H;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.AND_L:
                    _context.A &= _context.L;
                    SetAndOrFlags();
                    break;

                // OR

                case Z80Opcode.OR_A:
                    _context.A |= _context.A;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_B:
                    _context.A |= _context.B;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_C:
                    _context.A |= _context.C;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_D:
                    _context.A |= _context.D;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_E:
                    _context.A |= _context.E;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_H:
                    _context.A |= _context.H;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_L:
                    _context.A |= _context.L;
                    SetAndOrFlags();
                    break;

                case Z80Opcode.OR_N:
                    _context.A |= (byte)_instruction.Immediate;
                    SetAndOrFlags();
                    break;

                // XOR
                case Z80Opcode.XOR_A:
                    _context.A ^= (byte)_instruction.Immediate;
                    SetXorFlags();
                    break;

                // CP
                case Z80Opcode.CP_N:
                    Compare8((byte)_instruction.Immediate);
                    break;

                // JP
                case Z80Opcode.JP_NN: SetPC(_instruction.Immediate); break;
                case Z80Opcode.JP_Ptr_HL: SetPC(_context.HL); break;

                case Z80Opcode.JP_C_NN:
                    if (_context.CarryFlag)
                    {
                        SetPC(_instruction.Immediate);
                    }
                    break;

                case Z80Opcode.JP_NC_NN:
                    if (!_context.CarryFlag)
                    {
                        SetPC(_instruction.Immediate);
                    }
                    break;

                // JR
                case Z80Opcode.JR_N:
                    JumpRelative();
                    break;

                case Z80Opcode.JR_Z_N:
                    if (_context.ZeroFlag)
                    {
                        JumpRelative();
                    }
                    break;

                case Z80Opcode.JR_NZ_N:
                    if (!_context.ZeroFlag)
                    {
                        JumpRelative();
                    }
                    break;

                case Z80Opcode.JR_C_N:
                    if (_context.CarryFlag)
                    {
                        JumpRelative();
                    }
                    break;

                case Z80Opcode.JR_NC_N:
                    if (!_context.CarryFlag)
                    {
                        JumpRelative();
                    }
                    break;

                // CALL
                case Z80Opcode.CALL_NN:
                    Push16(_context.PC);
                    SetPC(_instruction.Immediate);
                    break;

                // RET
                case Z80Opcode.RET:
                    SetPC(Pop16());
                    break;
                    

                // PUSH
                case Z80Opcode.PUSH_AF: Push8(_context.A, _context.F); break;
                case Z80Opcode.PUSH_BC: Push8(_context.B, _context.C); break;
                case Z80Opcode.PUSH_DE: Push8(_context.D, _context.E); break;
                case Z80Opcode.PUSH_HL: Push8(_context.H, _context.L); break;

                // POP
                case Z80Opcode.POP_AF: _context.SetAF(Pop8(), Pop8()); break;
                case Z80Opcode.POP_BC: _context.SetBC(Pop8(), Pop8()); break;
                case Z80Opcode.POP_DE: _context.SetDE(Pop8(), Pop8()); break;
                case Z80Opcode.POP_HL: _context.SetHL(Pop8(), Pop8()); break;
                
                case Z80Opcode.PrefixCB:
                    ExecuteCBInstruction();
                    break;

                case Z80Opcode.PrefixDD:
                    ExecuteDDInstruction();
                    break;

                case Z80Opcode.PrefixED:
                    ExecuteEDInstruction();
                    break;

                case Z80Opcode.PrefixFD:
                    throw new NotImplementedException();

                default:
                    throw new NotImplementedException();
            }
        }

        private void ExecuteCBInstruction()
        {
            switch (_instruction.OpcodeCB)
            {
                #region BIT_N_R
                case Z80OpcodeCB.BIT_0_A: _context.ZeroFlag = (_context.A & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_A: _context.ZeroFlag = (_context.A & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_A: _context.ZeroFlag = (_context.A & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_A: _context.ZeroFlag = (_context.A & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_A: _context.ZeroFlag = (_context.A & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_A: _context.ZeroFlag = (_context.A & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_A: _context.ZeroFlag = (_context.A & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_A: _context.ZeroFlag = (_context.A & 0x80) == 0; break;
                case Z80OpcodeCB.BIT_0_B: _context.ZeroFlag = (_context.B & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_B: _context.ZeroFlag = (_context.B & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_B: _context.ZeroFlag = (_context.B & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_B: _context.ZeroFlag = (_context.B & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_B: _context.ZeroFlag = (_context.B & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_B: _context.ZeroFlag = (_context.B & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_B: _context.ZeroFlag = (_context.B & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_B: _context.ZeroFlag = (_context.B & 0x80) == 0; break;
                case Z80OpcodeCB.BIT_0_C: _context.ZeroFlag = (_context.C & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_C: _context.ZeroFlag = (_context.C & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_C: _context.ZeroFlag = (_context.C & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_C: _context.ZeroFlag = (_context.C & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_C: _context.ZeroFlag = (_context.C & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_C: _context.ZeroFlag = (_context.C & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_C: _context.ZeroFlag = (_context.C & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_C: _context.ZeroFlag = (_context.C & 0x80) == 0; break;
                case Z80OpcodeCB.BIT_0_D: _context.ZeroFlag = (_context.D & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_D: _context.ZeroFlag = (_context.D & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_D: _context.ZeroFlag = (_context.D & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_D: _context.ZeroFlag = (_context.D & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_D: _context.ZeroFlag = (_context.D & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_D: _context.ZeroFlag = (_context.D & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_D: _context.ZeroFlag = (_context.D & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_D: _context.ZeroFlag = (_context.D & 0x80) == 0; break;
                case Z80OpcodeCB.BIT_0_E: _context.ZeroFlag = (_context.E & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_E: _context.ZeroFlag = (_context.E & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_E: _context.ZeroFlag = (_context.E & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_E: _context.ZeroFlag = (_context.E & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_E: _context.ZeroFlag = (_context.E & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_E: _context.ZeroFlag = (_context.E & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_E: _context.ZeroFlag = (_context.E & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_E: _context.ZeroFlag = (_context.E & 0x80) == 0; break;
                case Z80OpcodeCB.BIT_0_H: _context.ZeroFlag = (_context.H & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_H: _context.ZeroFlag = (_context.H & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_H: _context.ZeroFlag = (_context.H & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_H: _context.ZeroFlag = (_context.H & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_H: _context.ZeroFlag = (_context.H & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_H: _context.ZeroFlag = (_context.H & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_H: _context.ZeroFlag = (_context.H & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_H: _context.ZeroFlag = (_context.H & 0x80) == 0; break;
                case Z80OpcodeCB.BIT_0_L: _context.ZeroFlag = (_context.L & 0x01) == 0; break;
                case Z80OpcodeCB.BIT_1_L: _context.ZeroFlag = (_context.L & 0x02) == 0; break;
                case Z80OpcodeCB.BIT_2_L: _context.ZeroFlag = (_context.L & 0x04) == 0; break;
                case Z80OpcodeCB.BIT_3_L: _context.ZeroFlag = (_context.L & 0x08) == 0; break;
                case Z80OpcodeCB.BIT_4_L: _context.ZeroFlag = (_context.L & 0x10) == 0; break;
                case Z80OpcodeCB.BIT_5_L: _context.ZeroFlag = (_context.L & 0x20) == 0; break;
                case Z80OpcodeCB.BIT_6_L: _context.ZeroFlag = (_context.L & 0x40) == 0; break;
                case Z80OpcodeCB.BIT_7_L: _context.ZeroFlag = (_context.L & 0x80) == 0; break;
                #endregion

                default:
                    throw new NotImplementedException();
                
            }
        }

        private void ExecuteDDInstruction()
        {
            switch (_instruction.OpcodeDD)
            {
                case Z80OpcodeDD.PUSH_IX: Push16(_context.IX); break;
                case Z80OpcodeDD.POP_IX: _context.IX = Pop16(); break;

                #region LD R, (IX+N)
                case Z80OpcodeDD.LD_A_Ptr_IX_Plus_N:
                    _context.A = _memory[_context.IX + _instruction.Immediate];
                    break;

                case Z80OpcodeDD.LD_B_Ptr_IX_Plus_N:
                    _context.B = _memory[_context.IX + _instruction.Immediate];
                    break;

                case Z80OpcodeDD.LD_C_Ptr_IX_Plus_N:
                    _context.C = _memory[_context.IX + _instruction.Immediate];
                    break;

                case Z80OpcodeDD.LD_D_Ptr_IX_Plus_N:
                    _context.D = _memory[_context.IX + _instruction.Immediate];
                    break;

                case Z80OpcodeDD.LD_E_Ptr_IX_Plus_N:
                    _context.E = _memory[_context.IX + _instruction.Immediate];
                    break;

                case Z80OpcodeDD.LD_H_Ptr_IX_Plus_N:
                    _context.H = _memory[_context.IX + _instruction.Immediate];
                    break;

                case Z80OpcodeDD.LD_L_Ptr_IX_Plus_N:
                    _context.L = _memory[_context.IX + _instruction.Immediate];
                    break;
                #endregion

                default:
                    throw new NotImplementedException();
            }
        }

        private void ExecuteEDInstruction()
        {
            switch (_instruction.OpcodeED)
            {
                case Z80OpcodeED.IM_0:
                    _context.InteruptMode = Z80InteruptMode.Mode0;
                    break;

                case Z80OpcodeED.IM_1:
                    _context.InteruptMode = Z80InteruptMode.Mode1;
                    break;

                case Z80OpcodeED.IM_2:
                    _context.InteruptMode = Z80InteruptMode.Mode2;
                    break;

                case Z80OpcodeED.LDIR:
                    var dst = _context.HL++;
                    var b = _memory[dst];
                    _memory[_context.DE++] = b;

                    Cli.WriteLine(
                        "    [~Magenta~0x{0:x4}~R~]=~Cyan~0x{1:x2}~R~; '{2}'",
                        dst,
                        b,
                        (char)b);

                    if (--_context.BC != 0)
                    {
                        SetPC(_instructionAddress);
                    }

                    break;

                default:
                    throw new NotImplementedException();
            }
        }

        private void SetPC(ushort address)
        {
            _context.PC = address;
            _reader.BaseStream.Position = address;
        }

        private void Push8(byte value)
        {
            _memory[--_context.SP] = value;
        }

        private void Push8(params byte[] values)
        {
            foreach (var value in values)
            {
                _memory[--_context.SP] = value;
            }
        }

        private void Push16(ushort value)
        {
            _context.SP -= 2;
            _memory[_context.SP] = (byte)value;
            _memory[_context.SP + 1] = (byte)(value >> 0x8);
        }

        private byte Pop8()
        {
            return _memory[_context.SP++];
        }

        private ushort Pop16()
        {
            return (ushort)
                (_memory[_context.SP++] |
                (_memory[_context.SP++] << 0x8));
        }

        private void JumpRelative()
        {
            SetPC(GetRelativeAddress(_instruction.Immediate));
        }

        private ushort GetRelativeAddress(ushort offset)
        {
            return (ushort)(_stream.Position + unchecked((sbyte)(byte)offset));
        }

        private ushort Read16(ushort address)
        {
            return (ushort)(_memory[address] | (_memory[address + 1] << 0x8));
        }

        private void SetLoadAFlags()
        {
            _context.SignFlag = (_context.A & 0x80) != 0;
            _context.ZeroFlag = _context.A == 0;
            _context.HalfCarryFlag = false;
            _context.ParityOverflowFlag = _context.Iff2;
            _context.AddSubtractFlag = false;
        }

        private void SetAndOrFlags()
        {
            _context.SignFlag = (_context.A & 0x80) != 0;
            _context.ZeroFlag = _context.A == 0;
            _context.HalfCarryFlag = false;
            _context.ParityOverflowFlag = false;
            _context.AddSubtractFlag = false;
            _context.CarryFlag = false;
        }

        private void SetXorFlags()
        {
            _context.SignFlag = (_context.A & 0x80) != 0;
            _context.ZeroFlag = _context.A == 0;
            _context.HalfCarryFlag = false;
            _context.ParityOverflowFlag = IsParityEven(_context.A);
            _context.AddSubtractFlag = false;
            _context.CarryFlag = false;
        }

        private void Compare8(byte value)
        {
            _context.ZeroFlag = _context.A == value;
            var x = _context.A + value;
            _context.CarryFlag = x > byte.MaxValue;
            var y = unchecked((sbyte)_context.A) + unchecked((sbyte)value);
            _context.ParityOverflowFlag = y > sbyte.MaxValue || y < sbyte.MinValue;
            _context.AddSubtractFlag = false;
            _context.SignFlag = (x & 0x80) != 0;
        }

        private bool IsParityEven(byte value)
        {
            var isEven = true;

            for (var i = 0; i < 8; i++)
            {
                if (((value >> i) & 0x1) != 0x0)
                {
                    isEven = !isEven;
                }
            }

            return isEven;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
