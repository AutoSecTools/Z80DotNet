using Components;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public static class SymbolFileReader
    {
        public static Dictionary<ushort, string> Read(string symbolFile)
        {
            return File
                .ReadAllLines(symbolFile)
                .Select(x => x.Trim())
                .Where(x => !string.IsNullOrEmpty(x) && !x.StartsWith("//"))
                .ToDictionary(
                    x => ushort.Parse(
                        x.Substring(2).RemoveAtIndexOf(' '),
                        NumberStyles.HexNumber),
                    x => x.SubstringAtIndexOf(' ', 1));
        }
    }
}
