using Components;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Z80Dasm
{
    public class Z80DasmArgs
    {
        [CliArg(
            "-i",
            IsInputFile = true,
            IsRequired = true,
            ValueName = "Z80 Binary",
            Description = "A Z80 binary to disassemble.")]
        public FileInfo InputBinaryFile { get; set; }

        [CliArg(
            "-o",
            ValueName = "Z80 disassembly",
            Description = "The file to write disassembled Z80 machine code to.")]
        public string OutputDisassemblyFile { get; set; }
    }
}
