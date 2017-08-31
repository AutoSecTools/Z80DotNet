using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public enum Z80OpcodeFD : byte
    {
        ////////////////////////////////////////////////////////////////
        #region [FD] [Opcode]
        ADD_IY_BC = 0x09,
        ADD_IY_DE = 0x19,
        INC_IY = 0x23,
        ADD_IY_IY = 0x29,
        DEC_IY = 0x2B,
        ADD_IY_SP = 0x39,
        POP_IY = 0xE1,
        EX_Ptr_SP_IY = 0xE3,
        PUSH_IY = 0xE5,
        JP_Ptr_IY = 0xE9,
        LD_SP_IY = 0xF9,
        #endregion

        ////////////////////////////////////////////////////////////////
        #region [FD] [Opcode] [Imm 16]
        LD_IY_NN = 0x21,
        LD_Ptr_NN_IY = 0x22,
        LD_IY_Ptr_NN = 0x2A,
        LD_Ptr_IY_Plus_N_N = 0x36,
        #endregion

        ////////////////////////////////////////////////////////////////
        #region Prefixes
        PrefixFDCB = 0xCB,
        #endregion
    }
}
