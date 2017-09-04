using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public class Z80Context
    {
        public byte A { get; set; }
        public byte B { get; set; }
        public byte C { get; set; }
        public byte D { get; set; }
        public byte E { get; set; }
        public byte F { get; set; }
        public byte H { get; set; }
        public byte L { get; set; }

        public byte A2 { get; set; }
        public byte B2 { get; set; }
        public byte C2 { get; set; }
        public byte D2 { get; set; }
        public byte E2 { get; set; }
        public byte F2 { get; set; }
        public byte H2 { get; set; }
        public byte L2 { get; set; }

        /// <summary>
        /// Interrupt page address register
        /// </summary>
        public byte I { get; set; }

        /// <summary>
        /// Memory refresh register
        /// </summary>
        public byte R { get; set; }

        /// <summary>
        /// Index register X
        /// </summary>
        public ushort IX { get; set; }

        /// <summary>
        /// Index register Y
        /// </summary>
        public ushort IY { get; set; }

        /// <summary>
        /// Stack pointer
        /// </summary>
        public ushort SP { get; set; }

        /// <summary>
        /// Program counter
        /// </summary>
        public ushort PC { get; set; }

        /// <summary>
        /// Flip-flop 1. Disables interrupts from being accepted.
        /// </summary>
        public bool Iff1 { get; set; }

        /// <summary>
        /// Flip-flop 2. Temporary storage location for IFF1.
        /// </summary>
        public bool Iff2 { get; set; }

        public Z80InteruptMode InteruptMode { get; set; }

        public byte AddressBusLow { get; set; }

        public byte AddressBusHigh { get; set; }

        public bool SignFlag
        {
            get
            {
                return (F & 128) == 128;
            }
            set
            {
                if (value)
                {
                    F |= 128;
                }
                else if ((F & 128) == 128)
                {
                    F ^= 128;
                }
            }
        }

        public bool ZeroFlag
        {
            get
            {
                return (F & 64) == 64;
            }
            set
            {
                if (value)
                {
                    F |= 64;
                }
                else if ((F & 64) == 64)
                {
                    F ^= 64;
                }
            }
        }

        public bool FlagFifth
        {
            get
            {
                return (F & 32) == 32;
            }
            set
            {
                if (value)
                {
                    F |= 32;
                }
                else if ((F & 32) == 32)
                {
                    F ^= 32;
                }
            }
        }

        public bool HalfCarryFlag
        {
            get
            {
                return (F & 16) == 16;
            }
            set
            {
                if (value)
                {
                    F |= 16;
                }
                else if ((F & 16) == 16)
                {
                    F ^= 16;
                }
            }
        }

        public bool FlagThird
        {
            get
            {
                return (F & 8) == 8;
            }
            set
            {
                if (value)
                {
                    F |= 8;
                }
                else if ((F & 8) == 8)
                {
                    F ^= 8;
                }
            }
        }

        public bool ParityOverflowFlag
        {
            get
            {
                return (F & 4) == 4;
            }
            set
            {
                if (value)
                {
                    F |= 4;
                }
                else if ((F & 4) == 4)
                {
                    F ^= 4;
                }
            }
        }

        public bool AddSubtractFlag
        {
            get
            {
                return (F & 2) == 2;
            }
            set
            {
                if (value)
                {
                    F |= 2;
                }
                else if ((F & 2) == 2)
                {
                    F ^= 2;
                }
            }
        }

        public bool CarryFlag
        {
            get
            {
                return (F & 1) == 1;
            }
            set
            {
                if (value)
                {
                    F |= 1;
                }
                else if ((F & 1) == 1)
                {
                    F ^= 1;
                }
            }
        }

        public ushort AF
        {
            get { return (ushort)((A << 0x8) | F); }
            set
            {
                A = (byte)(value >> 0x8);
                F = (byte)value;
            }
        }

        public ushort BC
        {
            get { return (ushort)((B << 0x8) | C); }
            set
            {
                B = (byte)(value >> 0x8);
                C = (byte)value;
            }
        }

        public ushort DE
        {
            get { return (ushort)((D << 0x8) | E); }
            set
            {
                D = (byte)(value >> 0x8);
                E = (byte)value;
            }
        }

        public ushort HL
        {
            get { return (ushort)((H << 0x8) | L); }
            set
            {
                H = (byte)(value >> 0x8);
                L = (byte)value;
            }
        }

        public void SetAF(byte low, byte high)
        {
            F = low;
            A = high;
        }

        public void SetBC(byte low, byte high)
        {
            C = low;
            B = high;
        }

        public void SetDE(byte low, byte high)
        {
            E = low;
            D = high;
        }

        public void SetHL(byte low, byte high)
        {
            L = low;
            H = high;
        }

        
    }
}
