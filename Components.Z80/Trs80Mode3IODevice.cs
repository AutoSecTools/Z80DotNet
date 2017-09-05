using Components.ConsolePlus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public class Trs80Mode3IODevice : IODevice
    {
        private Dictionary<byte, string> _portNames = new Dictionary<byte, string>
        {
            { 0x80,	"Input: Reserved. Output: Graphics board register." },
            { 0x81,	"Input: Graphics board RAM read. Output: Graphics board RAM write." },
            { 0x82,	"Input: Reserved. Output: Graphics board Y register." },
            { 0x83,	"Input: Reserved. Output: Graphics board X register." },
            { 0xf0, "Read FDC status/issue FDC command" },
            { 0x88,	"CRT controller control register." },
            { 0x89,	"CRT controller control register." },
            { 0x8A,	"CRT controller control register." },
            { 0x8B,	"CRT controller data register." },
            { 0x8C,	"Graphics board select 2." },
            { 0x8D,	"Graphics board select 2." },
            { 0x8E,	"Graphics board select 2." },
            { 0x8F,	"Graphics board select 2." },
            { 0xE0, "Maskable interupt" },
            { 0xE4, "Select NMI options/read NMI status" },
            { 0xEC, "Write = various controls/ read = reset clock" },
            { 0xF4, "Select drive and options" },
        };

        private Dictionary<byte, byte> _readValues = new Dictionary<byte, byte>
        {
            { 0xf0, 0 },
        };

        public override void Write(byte port, byte value)
        {
            if (port == 0xf4 && value == 0x81)
            {
                //_readValues[0xf0] = 0x04 | 0x02;
            }
            //Cli.WriteLine("  ~|Yellow~~Blue~Write:~R~ {0} ~White~~|Blue~0x{1:x2}~R~", GetPortName(port), value);
        }

        public override byte Read(byte port)
        {
            //Cli.WriteLine("  ~|Yellow~~Blue~Read:~R~ {0}", GetPortName(port));

            if (port == 0xf8)
            {
                return 0x30;
            }

            if (port == 0xf0)
            {
                //return 0x80;
            }

            if (_readValues.ContainsKey(port))
            {
                return _readValues[port];
            }

            return 0x0;
        }

        private string GetPortName(byte port)
        {
            string portName;

            if (!_portNames.TryGetValue(port, out portName))
            {
                portName = "Unknown port";
            }

            return portName;
        }
    }
}
