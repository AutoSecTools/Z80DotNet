using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public class Z80AssemblyFormatter
    {
        private Dictionary<ushort, string> _symbols;

        public Z80AssemblyFormatter()
            : this(new Dictionary<ushort, string>())
        {
        }

        public Z80AssemblyFormatter(Dictionary<ushort, string> symbols)
        {
            _symbols = symbols;
        }

        public string Format(Dictionary<ushort, Z80Instruction> instructions)
        {
            var dasmText = instructions
                .Select(x =>
                {
                    var label = _symbols.ContainsKey(x.Key) ?
                        "\r\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" +
                        "\r\n; " + _symbols[x.Key] +
                        "\r\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" +
                        "\r\n" :
                        "";

                    var inst = Format(x.Value);

                    var suffix =
                        inst.StartsWith("JP 0x") ||
                        inst.StartsWith("JR 0x") ||
                        inst.StartsWith("JR -0x") ||
                        x.Value.Opcode.ToString() == "RET" ||
                        inst.StartsWith("RETI ") ||
                        inst.StartsWith("RETN ") ?
                            "\r\n" :
                            "";

                    return string.Format(
                        "{0}0x{1:x4} {2}{3}",
                        label,
                        x.Key,
                        inst,
                        suffix);
                })
                .Aggregate((x, y) => x + "\r\n" + y);

            while (dasmText.Contains("\r\n\r\n\r\n"))
            {
                dasmText = dasmText.Replace("\r\n\r\n\r\n", "\r\n\r\n");
            }

            return dasmText;
        }

        public string Format(Z80Instruction instruction)
        {
            string textInst;

            switch (instruction.Opcode)
            {
                case Z80Opcode.PrefixCB:
                    textInst = instruction.OpcodeCB.ToString();
                    break;

                case Z80Opcode.PrefixDD:
                    switch (instruction.OpcodeDD)
                    {
                        case Z80OpcodeDD.PrefixDDCB:
                            textInst = instruction.OpcodeDDCB.ToString();
                            break;

                        default:
                            textInst = instruction.OpcodeDD.ToString();
                            break;
                    }
                    break;

                case Z80Opcode.PrefixED:
                    textInst = instruction.OpcodeED.ToString();
                    break;

                case Z80Opcode.PrefixFD:
                    switch (instruction.OpcodeFD)
                    {
                        case Z80OpcodeFD.PrefixFDCB:
                            textInst = instruction.OpcodeFDCB.ToString();
                            break;

                        default:
                            textInst = instruction.OpcodeFD.ToString();
                            break;
                    }
                    break;

                default:
                    textInst = instruction.Opcode.ToString();
                    break;
            }

            //if (!textInst.Contains('_'))
            //{
            //    return textInst;
            //}

            textInst = textInst
                .Replace("_Plus_", "+")
                .Replace("Ptr_", "(");

            var leftParen = textInst.IndexOf('(');

            if (leftParen != -1)
            {
                var rightParen = textInst.IndexOf('_', leftParen);

                if (rightParen == -1)
                {
                    textInst += ")";
                }
                else
                {
                    textInst = textInst.Insert(rightParen, ")");
                }
            }

            var indexUnderscore = textInst.IndexOf('_');

            if (indexUnderscore != -1)
            {
                textInst = textInst
                    .Remove(indexUnderscore, 1)
                    .Insert(indexUnderscore, " ");
            }

            indexUnderscore = textInst.IndexOf('_');

            if (indexUnderscore != -1)
            {
                textInst = textInst
                    .Remove(indexUnderscore, 1)
                    .Insert(indexUnderscore, ", ");
            }

            textInst = textInst
                .Replace("NZ", "$Z");

            if (textInst.Contains("NN"))
            {
                textInst = textInst.Replace(
                    "NN",
                    string.Format("0x{0:X4}", instruction.Immediate));
            }
            else
            {
                if (textInst.Contains("+N"))
                {
                    var bytes = BitConverter.GetBytes(instruction.Immediate);

                    textInst = textInst.Replace(
                        "+N",
                        string.Format("+0x{0:X2}", bytes[0]));

                    if (textInst.Contains(", N"))
                    {
                        textInst = textInst.Replace(
                            ", N",
                            string.Format(", 0x{0:X2}", bytes[1]));
                    }
                }

                if (textInst.StartsWith("JR"))
                {
                    var offset = (int)unchecked((sbyte)(byte)instruction.Immediate) + 2;

                    bool negative = false;

                    if (offset < 0)
                    {
                        offset *= -1;
                        negative = true;
                    }

                    var offsetStr = string.Format(
                        "{0}0x{1:X2}",
                        negative ? "-" : "", offset);

                    if (textInst.Contains(", N"))
                    {
                        textInst = textInst.Replace(", N", ", " + offsetStr);
                    }
                    else
                    {
                        textInst = textInst.Replace(" N", " " + offsetStr);
                    }
                }
                else if (textInst.Contains(", N"))
                {
                    if (textInst.Contains(", N"))
                    {
                        textInst = textInst.Replace(
                            ", N",
                            string.Format(", 0x{0:X2}", instruction.Immediate));
                    }
                }
                //else
                //{
                //}
            }

            textInst = textInst.Replace("$Z", "NZ");

            var objectCode = instruction.ObjectCode
                .Select(x => string.Format("{0:X2}", x))
                .Aggregate((x, y) => x + " " + y);

            textInst = textInst.PadRight(17) + "; " + objectCode;



            return textInst;
        }
    }
}
