using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public class Z80Frame
    {
        public string Name { get; set; }

        public ushort Address { get; set; }

        public ushort ReturnAddress { get; set; }

        public Z80Frame()
        {
        }

        public Z80Frame(string name, ushort address, ushort returnAddress)
        {
            Name = name;
            Address = address;
            ReturnAddress = returnAddress;
        }

        public override string ToString()
        {
            return string.Format("0x{0:x4} 0x{1:x4} {2}", Address, ReturnAddress, Name ?? "[Code]");
        }
    }
}
