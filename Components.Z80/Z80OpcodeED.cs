using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Z80
{
    public enum Z80OpcodeED : byte
    {
        ////////////////////////////////////////////////////////////////
        #region [ED] [Opcode]
        IN_B_Ptr_C = 0x40,
        OUT_Ptr_C_B = 0x41,
        SBC_HL_BC = 0x42,
        NEG = 0x44,
        RETN = 0x45,
        IM_0 = 0x46,
        LD_I_A = 0x47,
        IN_C_Ptr_C = 0x48,
        OUT_Ptr_C_C = 0x49,
        ADC_HL_BC = 0x4A,
        RETI = 0x4D,
        IN_D_Ptr_C = 0x50,
        OUT_Ptr_C_D = 0x51,
        SBC_HL_DE = 0x52,
        IM_1 = 0x56,
        LD_A_I = 0x57,
        IN_E_Ptr_C = 0x58,
        OUT_Ptr_C_E = 0x59,
        ADC_HL_DE = 0x5A,
        IM_2 = 0x5E,
        LD_A_R = 0x5F,
        IN_H_Ptr_C = 0x60,
        OUT_Ptr_C_H = 0x61,
        SBC_HL_HL = 0x62,
        RRD = 0x67,
        IN_L_Ptr_C = 0x68,
        OUT_Ptr_C_L = 0x69,
        ADC_HL_HL = 0x6A,
        RLD = 0x6F,
        SBC_HL_SP = 0x72,
        IN_A_Ptr_C = 0x78,
        OUT_Ptr_C_A = 0x79,
        ADC_HL_SP = 0x7A,
        LDI = 0xA0,
        CPI = 0xA1,
        INI = 0xA2,
        OUTI = 0xA3,
        LDD = 0xA8,
        CPD = 0xA9,
        IND = 0xAA,
        OUTD = 0xAB,
        LDIR = 0xB0,
        CPIR = 0xB1,
        INIR = 0xB2,
        OTIR = 0xB3,
        LDDR = 0xB8,
        CPDR = 0xB9,
        INDR = 0xBA,
        OTDR = 0xBB,
        #endregion

        ////////////////////////////////////////////////////////////////
        #region [ED] [Opcode] [Imm 16]
        LD_Ptr_NN_BC = 0x43,
        LD_BC_Ptr_NN = 0x4B,
        LD_Ptr_NN_DE = 0x53,
        LD_DE_Ptr_NN = 0x5B,
        LD_Ptr_NN_SP = 0x73,
        LD_SP_Ptr_NN = 0x7B,
        #endregion
    }
}
