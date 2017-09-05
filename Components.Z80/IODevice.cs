using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public abstract class IODevice
    {
        public abstract void Write(byte port, byte value);

        public abstract byte Read(byte port);
    }
}
