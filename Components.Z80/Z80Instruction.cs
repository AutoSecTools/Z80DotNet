using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public class Z80Instruction
    {
        public Z80Opcode Opcode { get; set; }

        public Z80OpcodeED OpcodeED { get; set; }

        public Z80OpcodeDD OpcodeDD { get; set; }

        public Z80OpcodeCB OpcodeCB { get; set; }

        public Z80OpcodeFD OpcodeFD { get; set; }

        public Z80OpcodeFDCB OpcodeFDCB { get; set; }

        public Z80OpcodeDDCB OpcodeDDCB { get; set; }

        public OperandType OperandType { get; set; }

        public ushort Immediate { get; set; }

        public byte[] ObjectCode { get; set; }

        public Z80Instruction(Z80Opcode opcode)
        {
            Opcode = opcode;
        }

        public Z80Instruction(Z80Opcode opcode, OperandType operandType, ushort immediate)
            : this(opcode)
        {
            OperandType = operandType;
            Immediate = immediate;
        }

        public Z80Instruction(Z80OpcodeED opcode)
            : this(Z80Opcode.PrefixED)
        {
            OpcodeED = opcode;
        }

        public Z80Instruction(Z80OpcodeED opcode, ushort immediate)
            : this(Z80Opcode.PrefixED, OperandType.Word, immediate)
        {
            OpcodeED = opcode;
        }

        public Z80Instruction(Z80OpcodeDD opcode)
            : this(Z80Opcode.PrefixDD)
        {
            OpcodeDD = opcode;
        }

        public Z80Instruction(Z80OpcodeDD opcode, OperandType operandType, ushort immediate)
            : this(opcode)
        {
            OperandType = operandType;
            Immediate = immediate;
        }

        public Z80Instruction(Z80OpcodeCB opcode)
            : this(Z80Opcode.PrefixCB)
        {
            OpcodeCB = opcode;
        }

        public Z80Instruction(Z80OpcodeFD opcode)
            : this(Z80Opcode.PrefixFD)
        {
            OpcodeFD = opcode;
        }

        public Z80Instruction(Z80OpcodeFD opcode, OperandType operandType, ushort immediate)
            : this(opcode)
        {
            OperandType = operandType;
            Immediate = immediate;
        }

        public Z80Instruction(Z80OpcodeFDCB opcode, byte immediate)
            : this(Z80OpcodeFD.PrefixFDCB)
        {
            OpcodeFDCB = opcode;
            OperandType = OperandType.Byte;            
            Immediate = immediate;
        }

        public Z80Instruction(Z80OpcodeDDCB opcode, byte immediate)
            : this(Z80OpcodeDD.PrefixDDCB)
        {
            OpcodeDDCB = opcode;
            OperandType = OperandType.Byte;
            Immediate = immediate;
        }

        public override string ToString()
        {
            var operand =
                OperandType == OperandType.Byte ? string.Format(" 0x{0:x2}", Immediate) :
                OperandType == OperandType.Word ? string.Format(" 0x{0:x4}", Immediate) :
                "";

            string opcodeStr;

            switch (Opcode)
            {
                case Z80Opcode.PrefixCB:
                    opcodeStr = OpcodeCB.ToString();
                    break;

                case Z80Opcode.PrefixDD:
                    switch (OpcodeDD)
                    {
                        case Z80OpcodeDD.PrefixDDCB:
                            opcodeStr = OpcodeDDCB.ToString();
                            break;

                        default:
                            opcodeStr = OpcodeDD.ToString();
                            break;
                    }
                    break;

                case Z80Opcode.PrefixED:
                    opcodeStr = OpcodeED.ToString();
                    break;

                case Z80Opcode.PrefixFD:
                    switch (OpcodeFD)
                    {
                        case Z80OpcodeFD.PrefixFDCB:
                            opcodeStr = OpcodeFDCB.ToString();
                            break;

                        default:
                            opcodeStr = OpcodeFD.ToString();
                            break;
                    }
                    break;

                default:
                    opcodeStr = Opcode.ToString();
                    break;
            }

            return string.Format(
                "{0}{1}",
                opcodeStr,
                operand);
        }

        public static implicit operator Z80Instruction(Z80Opcode opcode)
        {
            return new Z80Instruction(opcode);
        }

        public static implicit operator Z80Instruction(Z80OpcodeED opcode)
        {
            return new Z80Instruction(opcode);
        }

        public static implicit operator Z80Instruction(Z80OpcodeDD opcode)
        {
            return new Z80Instruction(opcode);
        }

        public static implicit operator Z80Instruction(Z80OpcodeCB opcode)
        {
            return new Z80Instruction(opcode);
        }

        public static implicit operator Z80Instruction(Z80OpcodeFD opcode)
        {
            return new Z80Instruction(opcode);
        }
    }
}
