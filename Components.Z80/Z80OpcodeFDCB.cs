using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public enum Z80OpcodeFDCB : byte
    {
        ////////////////////////////////////////////////////////////////
        #region [FD] [CB] [Imm 8] [Opcode]
        RLC_Ptr_IY_Plus_N = 0x06,
        RRC_Ptr_IY_Plus_N = 0x0E,
        RL_Ptr_IY_Plus_N = 0x16,
        RR_Ptr_IY_Plus_N = 0x1E,
        SLA_Ptr_IY_Plus_N = 0x26,
        SRA_Ptr_IY_Plus_N = 0x2E,
        BIT_0_Ptr_IY_Plus_N = 0x46,
        BIT_1_Ptr_IY_Plus_N = 0x4E,
        BIT_2_Ptr_IY_Plus_N = 0x56,
        BIT_3_Ptr_IY_Plus_N = 0x5E,
        BIT_4_Ptr_IY_Plus_N = 0x66,
        BIT_5_Ptr_IY_Plus_N = 0x6E,
        BIT_6_Ptr_IY_Plus_N = 0x76,
        BIT_7_Ptr_IY_Plus_N = 0x7E,
        RES_0_Ptr_IY_Plus_N = 0x86,
        RES_1_Ptr_IY_Plus_N = 0x8E,
        RES_2_Ptr_IY_Plus_N = 0x96,
        RES_3_Ptr_IY_Plus_N = 0x9E,
        RES_4_Ptr_IY_Plus_N = 0xA6,
        RES_5_Ptr_IY_Plus_N = 0xAE,
        RES_6_Ptr_IY_Plus_N = 0xB6,
        RES_7_Ptr_IY_Plus_N = 0xBE,
        SET_0_Ptr_IY_Plus_N = 0xC6,
        SET_1_Ptr_IY_Plus_N = 0xCE,
        SET_2_Ptr_IY_Plus_N = 0xD6,
        SET_3_Ptr_IY_Plus_N = 0xDE,
        SET_4_Ptr_IY_Plus_N = 0xE6,
        SET_5_Ptr_IY_Plus_N = 0xEE,
        SET_6_Ptr_IY_Plus_N = 0xF6,
        SET_7_Ptr_IY_Plus_N = 0xFE,
        #endregion
    }
}
