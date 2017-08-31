using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public enum Z80OpcodeDD : byte
    {
        ////////////////////////////////////////////////////////////////
        #region [DD] [Opcode]
        ADD_IX_BC = 0x09,
        ADD_IX_DE = 0x19,
        INC_IX = 0x23,
        ADD_IX_IX = 0x29,
        DEC_IX = 0x2B,
        ADD_IX_SP = 0x39,
        POP_IX = 0xE1,
        EX_Ptr_SP_IX = 0xE3,
        PUSH_IX = 0xE5,
        JP_Ptr_IX = 0xE9,
        LD_SP_IX = 0xF9,
        #endregion

        ////////////////////////////////////////////////////////////////
        #region [DD] [Opcode] [Imm8]
        INC_Ptr_IX_Plus_N = 0x34,
        DEC_Ptr_IX_Plus_N = 0x35,
        LD_B_Ptr_IX_Plus_N = 0x46,
        LD_C_Ptr_IX_Plus_N = 0x4E,
        LD_D_Ptr_IX_Plus_N = 0x56,
        LD_E_Ptr_IX_Plus_N = 0x5E,
        LD_H_Ptr_IX_Plus_N = 0x66,
        LD_L_Ptr_IX_Plus_N = 0x6E,
        LD_Ptr_IX_Plus_N_B = 0x70,
        LD_Ptr_IX_Plus_N_C = 0x71,
        LD_Ptr_IX_Plus_N_D = 0x72,
        LD_Ptr_IX_Plus_N_E = 0x73,
        LD_Ptr_IX_Plus_N_H = 0x74,
        LD_Ptr_IX_Plus_N_L = 0x75,
        LD_Ptr_IX_Plus_N_A = 0x77,
        LD_A_Ptr_IX_Plus_N = 0x7E,
        ADD_A_Ptr_IX_Plus_N = 0x86,
        ADC_A_Ptr_IX_Plus_N = 0x8E,
        SUB_Ptr_IX_Plus_N = 0x96,
        SBC_A_Ptr_IX_Plus_N = 0x9E,
        AND_Ptr_IX_Plus_N = 0xA6,
        XOR_Ptr_IX_Plus_N = 0xAE,
        OR_Ptr_IX_Plus_N = 0xB6,
        CP_Ptr_IX_Plus_N = 0xBE,
        #endregion


        ////////////////////////////////////////////////////////////////
        #region [DD] [Opcode] [Imm16]
        LD_IX_NN = 0x21,
        LD_Ptr_NN_IX = 0x22,
        LD_IX_Ptr_NN = 0x2A,
        LD_Ptr_IX_Plus_N_N = 0x36,
        #endregion

        ////////////////////////////////////////////////////////////////
        #region Prefixes
        PrefixDDCB = 0xCB,
        #endregion
    }
}
