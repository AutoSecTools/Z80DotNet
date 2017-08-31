using Components.ConsolePlus;
using Components.Z80;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z80Dasm
{
    public class Z80DasmApplication : CliApplication<Z80DasmArgs>
    {
        public override void Main(Z80DasmArgs args)
        {
            WriteInfoMessage("Disassembling ~Cyan~{0}~R~", args.InputBinaryFile);

            
            var symbolFile = Path.ChangeExtension(
                Path.GetFullPath(args.InputBinaryFile.FullName),
                "symbols");

            Dictionary<ushort, string> symbols;

            if (File.Exists(symbolFile))
            {
                WriteSuccessMessage("Found symbol file ~Cyan~{0}~R~", symbolFile);
                symbols = SymbolFileReader.Read(symbolFile);
            }
            else
            {
                WriteInfoMessage("Could not find symbol file for binary");
                symbols = new Dictionary<ushort, string>();
            }

            string dasm;

            using (var reader = new BinaryReader(args.InputBinaryFile.OpenRead()))
            {
                var disassembler = new Z80Disassembler(reader, symbols);
                var instructions = disassembler.Disassemble();
                dasm = new Z80AssemblyFormatter(symbols).Format(instructions);
            }

            if (!string.IsNullOrEmpty(args.OutputDisassemblyFile))
            {
                WriteInfoMessage(
                    "Writing disassembled instructions to ~Cyan~{0}~R~",
                    args.OutputDisassemblyFile);

                File.WriteAllText(args.OutputDisassemblyFile, dasm);
            }
            else
            {
                Cli.WriteLine(Cli.Escape(dasm));
            }

            WriteSuccessMessage("Done");
        }
    }
}
