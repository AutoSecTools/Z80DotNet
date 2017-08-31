
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DOSCLD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0000 DI               ; F3
0x0001 XOR A            ; AF
0x0002 JP 0x3015        ; C3 15 30

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYNTAX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0008 JP 0x4000        ; C3 00 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; WHERE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x000b POP HL           ; E1
0x000c JP (HL)          ; E9
0x000d JP 0x3012        ; C3 12 30

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0013 PUSH BC          ; C5
0x0014 LD B, 0x01       ; 06 01
0x0016 JR 0x30          ; 18 2E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CP16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0018 JP 0x4006        ; C3 06 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PUT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x001b PUSH BC          ; C5
0x001c LD B, 0x02       ; 06 02
0x001e JR 0x28          ; 18 26

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CTL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0023 PUSH BC          ; C5
0x0024 LD B, 0x04       ; 06 04
0x0026 JR 0x20          ; 18 1E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KBDSCN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x002b LD DE, 0x4015    ; 11 15 40
0x002e JR -0x1B         ; 18 E3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VDCHAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0033 LD DE, 0x401D    ; 11 1D 40
0x0036 JR -0x1B         ; 18 E3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PRCHAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x003b LD DE, 0x4025    ; 11 25 40
0x003e JR -0x23         ; 18 DB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KBLINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0040 JP 0x05D9        ; C3 D9 05

0x0046 JP 0x0674        ; C3 74 06

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KBWAIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0049 CALL 0x002B      ; CD 2B 00
0x004c OR A             ; B7
0x004d RET NZ           ; C0
0x004e JR -0x05         ; 18 F9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RSRCV
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0050 LD DE, 0x41E5    ; 11 E5 41
0x0053 JR -0x40         ; 18 BE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RSTX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0055 LD DE, 0x41ED    ; 11 ED 41
0x0058 JR -0x3D         ; 18 C1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RSINIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x005a LD DE, 0x41F5    ; 11 F5 41
0x005d JR -0x42         ; 18 BC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DELAY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0060 JP 0x01FB        ; C3 FB 01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INITIO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0069 JP 0x0452        ; C3 52 04

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ROUTE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x006c LD DE, 0x421D    ; 11 1D 42
0x006f JR -0x54         ; 18 AA

0x0075 LD DE, 0x4080    ; 11 80 40
0x0078 LD HL, 0x18F7    ; 21 F7 18
0x007b LD BC, 0x0027    ; 01 27 00
0x007e LDIR             ; ED B0
0x0080 LD HL, 0x42E5    ; 21 E5 42
0x0083 LD (HL), 0x3A    ; 36 3A
0x0085 INC HL           ; 23
0x0086 LD (HL), B       ; 70
0x0087 INC HL           ; 23
0x0088 LD (HL), 0x2C    ; 36 2C
0x008a INC HL           ; 23
0x008b LD (0x40A7), HL  ; 22 A7 40
0x008e LD DE, 0x012D    ; 11 2D 01
0x0091 LD B, 0x1C       ; 06 1C
0x0093 LD HL, 0x4152    ; 21 52 41
0x0096 LD (HL), 0xC3    ; 36 C3
0x0098 INC HL           ; 23
0x0099 LD (HL), E       ; 73
0x009a INC HL           ; 23
0x009b LD (HL), D       ; 72
0x009c INC HL           ; 23
0x009d DJNZ N           ; 10 F7
0x009f LD B, 0x15       ; 06 15
0x00a1 LD (HL), 0xC9    ; 36 C9
0x00a3 INC HL           ; 23
0x00a4 INC HL           ; 23
0x00a5 INC HL           ; 23
0x00a6 DJNZ N           ; 10 F9
0x00a8 LD HL, 0x43E8    ; 21 E8 43
0x00ab LD (HL), B       ; 70
0x00ac LD SP, 0x42F8    ; 31 F8 42
0x00af CALL 0x1B8F      ; CD 8F 1B
0x00b2 NOP              ; 00
0x00b3 NOP              ; 00
0x00b4 NOP              ; 00
0x00b5 LD HL, 0x0105    ; 21 05 01
0x00b8 CALL 0x28A7      ; CD A7 28
0x00bb CALL 0x1BB3      ; CD B3 1B
0x00be JR C, -0x09      ; 38 F5
0x00c0 RST 10H          ; D7
0x00c1 OR A             ; B7
0x00c2 JR NZ, 0x14      ; 20 12
0x00c4 LD HL, 0x444C    ; 21 4C 44
0x00c7 INC HL           ; 23
0x00c8 LD A, H          ; 7C
0x00c9 OR L             ; B5
0x00ca JR Z, 0x1D       ; 28 1B
0x00cc LD A, (HL)       ; 7E
0x00cd LD B, A          ; 47
0x00ce CPL              ; 2F
0x00cf LD (HL), A       ; 77
0x00d0 CP (HL)          ; BE
0x00d1 LD (HL), B       ; 70
0x00d2 JR Z, -0x0B      ; 28 F3
0x00d4 JR 0x13          ; 18 11

0x00d6 CALL 0x1E5A      ; CD 5A 1E
0x00d9 OR A             ; B7
0x00da JP NZ, 0x1997    ; C2 97 19
0x00dd EX DE, HL        ; EB
0x00de DEC HL           ; 2B
0x00df LD A, 0x8F       ; 3E 8F
0x00e1 LD B, (HL)       ; 46
0x00e2 LD (HL), A       ; 77
0x00e3 CP (HL)          ; BE
0x00e4 LD (HL), B       ; 70
0x00e5 JR NZ, -0x30     ; 20 CE
0x00e7 DEC HL           ; 2B
0x00e8 LD DE, 0x4514    ; 11 14 45
0x00eb RST 18H          ; DF
0x00ec JP C, 0x197A     ; DA 7A 19
0x00ef LD DE, 0xFFCE    ; 11 CE FF
0x00f2 LD (0x40B1), HL  ; 22 B1 40
0x00f5 ADD HL, DE       ; 19
0x00f6 LD (0x40A0), HL  ; 22 A0 40
0x00f9 CALL 0x1B4D      ; CD 4D 1B
0x00fc LD HL, 0x0111    ; 21 11 01
0x00ff JP 0x37EB        ; C3 EB 37

0x010b JR NZ, 0x55      ; 20 53
0x010d LD L, C          ; 69
0x010e LD A, D          ; 7A
0x010f LD H, L          ; 65
0x0110 NOP              ; 00
0x0111 LD D, D          ; 52
0x0112 LD H, C          ; 61
0x0113 LD H, H          ; 64
0x0114 LD L, C          ; 69
0x0115 LD L, A          ; 6F
0x0116 JR NZ, 0x55      ; 20 53
0x0118 LD L, B          ; 68
0x0119 LD H, C          ; 61
0x011a LD H, E          ; 63
0x011b LD L, E          ; 6B
0x011c JR NZ, 0x4F      ; 20 4D
0x011e LD L, A          ; 6F
0x011f LD H, H          ; 64
0x0120 LD H, L          ; 65
0x0121 LD L, H          ; 6C
0x0122 JR NZ, 0x4B      ; 20 49
0x0124 LD C, C          ; 49
0x0125 LD C, C          ; 49
0x0126 JR NZ, 0x44      ; 20 42
0x0128 LD H, C          ; 61
0x0129 LD (HL), E       ; 73
0x012a LD L, C          ; 69
0x012b LD H, E          ; 63
0x012c DEC C            ; 0D
0x012d LD E, 0x2C       ; 1E 2C
0x012f JP 0x19A2        ; C3 A2 19

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0132 RST 10H          ; D7
0x0133 XOR A            ; AF
0x0134 LD BC, 0x803E    ; 01 3E 80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0135 LD A, 0x80       ; 3E 80
0x0137 LD BC, 0x013E    ; 01 3E 01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RESET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0138 LD A, 0x01       ; 3E 01
0x013a PUSH AF          ; F5
0x013b RST 8H           ; CF
0x013c JR Z, -0x31      ; 28 CD
0x013e INC E            ; 1C
0x013f DEC HL           ; 2B
0x0140 CP N             ; FE 80
0x0142 JP NC, 0x1E4A    ; D2 4A 1E
0x0145 PUSH AF          ; F5
0x0146 RST 8H           ; CF
0x0147 INC L            ; 2C
0x0148 CALL 0x2B1C      ; CD 1C 2B
0x014b CP N             ; FE 30
0x014d JP NC, 0x1E4A    ; D2 4A 1E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GRAPH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0150 LD D, 0xFF       ; 16 FF
0x0152 INC D            ; 14
0x0153 SUB N            ; D6 03
0x0155 JR NC, -0x03     ; 30 FB
0x0157 ADD A, 0x03      ; C6 03
0x0159 LD C, A          ; 4F
0x015a POP AF           ; F1
0x015b ADD A, A         ; 87
0x015c LD E, A          ; 5F
0x015d LD B, 0x02       ; 06 02
0x015f LD A, D          ; 7A
0x0160 RRA              ; 1F
0x0161 LD D, A          ; 57
0x0162 LD A, E          ; 7B
0x0163 RRA              ; 1F
0x0164 LD E, A          ; 5F
0x0165 DJNZ N           ; 10 F8
0x0167 LD A, C          ; 79
0x0168 ADC A, A         ; 8F
0x0169 INC A            ; 3C
0x016a LD B, A          ; 47
0x016b XOR A            ; AF
0x016c SCF              ; 37
0x016d ADC A, A         ; 8F
0x016e DJNZ N           ; 10 FD
0x0170 LD C, A          ; 4F
0x0171 LD A, D          ; 7A
0x0172 OR N             ; F6 3C
0x0174 LD D, A          ; 57
0x0175 LD A, (DE)       ; 1A
0x0176 OR A             ; B7
0x0177 JP M, 0x017C     ; FA 7C 01
0x017a LD A, 0x80       ; 3E 80
0x017c LD B, A          ; 47
0x017d POP AF           ; F1
0x017e OR A             ; B7
0x017f LD A, B          ; 78
0x0180 JR Z, 0x12       ; 28 10
0x0182 LD (DE), A       ; 12
0x0183 JP M, 0x018F     ; FA 8F 01
0x0186 LD A, C          ; 79
0x0187 CPL              ; 2F
0x0188 LD C, A          ; 4F
0x0189 LD A, (DE)       ; 1A
0x018a AND C            ; A1
0x018b LD (DE), A       ; 12
0x018c RST 8H           ; CF
0x018d ADD HL, HL       ; 29
0x018e RET              ; C9

0x018f OR C             ; B1
0x0190 JR -0x05         ; 18 F9

0x0192 AND C            ; A1
0x0193 ADD A, 0xFF      ; C6 FF
0x0195 SBC A            ; 9F
0x0196 PUSH HL          ; E5
0x0197 CALL 0x098D      ; CD 8D 09
0x019a POP HL           ; E1
0x019b JR -0x0F         ; 18 EF

0x019d RST 10H          ; D7
0x019e PUSH HL          ; E5
0x019f LD A, (0x4099)   ; 3A 99 40
0x01a2 OR A             ; B7
0x01a3 JR NZ, 0x08      ; 20 06
0x01a5 CALL 0x0358      ; CD 58 03
0x01a8 OR A             ; B7
0x01a9 JR Z, 0x13       ; 28 11
0x01ab PUSH AF          ; F5
0x01ac XOR A            ; AF
0x01ad LD (0x4099), A   ; 32 99 40
0x01b0 INC A            ; 3C
0x01b1 CALL 0x2857      ; CD 57 28
0x01b4 POP AF           ; F1
0x01b5 LD HL, (0x40D4)  ; 2A D4 40
0x01b8 LD (HL), A       ; 77
0x01b9 JP 0x2884        ; C3 84 28

0x01bc LD HL, 0x1928    ; 21 28 19
0x01bf LD (0x4121), HL  ; 22 21 41
0x01c2 LD A, 0x03       ; 3E 03
0x01c4 LD (0x40AF), A   ; 32 AF 40
0x01c7 POP HL           ; E1
0x01c8 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CLS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x01c9 LD A, 0x1C       ; 3E 1C
0x01cb CALL 0x033A      ; CD 3A 03
0x01ce LD A, 0x1F       ; 3E 1F
0x01d0 JP 0x033A        ; C3 3A 03

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RANDOM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x01d3 LD A, R          ; ED 5F
0x01d5 LD (0x40AB), A   ; 32 AB 40
0x01d8 RET              ; C9

0x01d9 LD HL, 0x3C00    ; 21 00 3C
0x01dc LD A, (HL)       ; 7E
0x01dd CP N             ; FE 80
0x01df JR C, 0x04       ; 38 02
0x01e1 LD A, 0x2E       ; 3E 2E
0x01e3 CALL 0x003B      ; CD 3B 00
0x01e6 INC HL           ; 23
0x01e7 BIT 6, H         ; CB 74
0x01e9 JR NZ, 0x2B      ; 20 29
0x01eb LD A, L          ; 7D
0x01ec AND N            ; E6 3F
0x01ee JR NZ, -0x12     ; 20 EC
0x01f0 CALL 0x0214      ; CD 14 02
0x01f3 JR -0x17         ; 18 E7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSOFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x01f8 JP 0x300C        ; C3 0C 30

0x01fb LD A, A          ; 7F
0x01fc DEC BC           ; 0B
0x01fd LD A, B          ; 78
0x01fe OR C             ; B1
0x01ff JR NZ, -0x04     ; 20 FA
0x0201 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEFCAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0212 XOR A            ; AF
0x0213 RET              ; C9

0x0214 LD A, 0x0D       ; 3E 0D
0x0216 CALL 0x003B      ; CD 3B 00
0x0219 XOR A            ; AF
0x021a RET              ; C9

0x021b LD A, (HL)       ; 7E
0x021c INC HL           ; 23
0x021d CP N             ; FE 03
0x021f RET Z            ; C8
0x0220 CALL 0x0033      ; CD 33 00
0x0223 CP N             ; FE 0D
0x0225 JR NZ, -0x0A     ; 20 F4
0x0227 RET              ; C9

0x0228 EX (SP), HL      ; E3
0x0229 JP 0x302A        ; C3 2A 30

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ???
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x022c JR -0x1A         ; 18 E4

0x022e EI               ; FB
0x022f JP 0x1A19        ; C3 19 1A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0235 PUSH DE          ; D5
0x0236 PUSH BC          ; C5
0x0237 PUSH HL          ; E5
0x0238 LD HL, (0x420E)  ; 2A 0E 42
0x023b EX (SP), HL      ; E3
0x023c RET              ; C9

0x023d PUSH HL          ; E5
0x023e LD HL, 0x3000    ; 21 00 30
0x0241 JR -0x19         ; 18 E5

0x0243 DI               ; F3
0x0244 CALL 0x300F      ; CD 0F 30
0x0247 PUSH HL          ; E5
0x0248 LD HL, 0x3006    ; 21 06 30
0x024b JR -0x23         ; 18 DB

0x024d PUSH HL          ; E5
0x024e LD HL, (0x420C)  ; 2A 0C 42
0x0251 EX (SP), HL      ; E3
0x0252 RET              ; C9

0x0253 EX (SP), HL      ; E3
0x0254 LD A, (0x4211)   ; 3A 11 42
0x0257 OR A             ; B7
0x0258 JR Z, 0x05       ; 28 03
0x025a INC HL           ; 23
0x025b INC HL           ; 23
0x025c INC HL           ; 23
0x025d EX (SP), HL      ; E3
0x025e RET              ; C9

0x0261 CALL 0x0264      ; CD 64 02

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSOUT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0264 JR -0x17         ; 18 E7

0x0284 JP 0x0287        ; C3 87 02

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSHWR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0287 DI               ; F3
0x0288 CALL 0x300F      ; CD 0F 30
0x028b JR -0x4E         ; 18 B0

0x028d LD A, (0x3840)   ; 3A 40 38
0x0290 AND N            ; E6 04
0x0292 RET              ; C9

0x0293 JP 0x0243        ; C3 43 02

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSHIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0296 JR -0x53         ; 18 AB

0x02a9 CALL 0x0314      ; CD 14 03
0x02ac LD (0x40DF), HL  ; 22 DF 40
0x02af CALL 0x01F8      ; CD F8 01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYSTEM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x02b2 CALL 0x41E2      ; CD E2 41
0x02b5 LD SP, 0x4288    ; 31 88 42
0x02b8 CALL 0x20FE      ; CD FE 20
0x02bb LD A, 0x2A       ; 3E 2A
0x02bd CALL 0x032A      ; CD 2A 03
0x02c0 CALL 0x1BB3      ; CD B3 1B
0x02c3 JP C, 0x06CC     ; DA CC 06
0x02c6 RST 10H          ; D7
0x02c7 JP Z, 0x1997     ; CA 97 19
0x02ca CP N             ; FE 2F
0x02cc JR Z, 0x51       ; 28 4F
0x02ce CALL 0x0293      ; CD 93 02
0x02d1 CALL 0x0235      ; CD 35 02
0x02d4 CP N             ; FE 55
0x02d6 JR NZ, -0x05     ; 20 F9
0x02d8 LD B, 0x06       ; 06 06
0x02da LD A, (HL)       ; 7E
0x02db OR A             ; B7
0x02dc JR Z, 0x0B       ; 28 09
0x02de CALL 0x0235      ; CD 35 02
0x02e1 CP (HL)          ; BE
0x02e2 INC HL           ; 23
0x02e3 JR NZ, -0x12     ; 20 EC
0x02e5 DJNZ N           ; 10 F3
0x02e7 CALL 0x022C      ; CD 2C 02
0x02ea CALL 0x0235      ; CD 35 02
0x02ed CP N             ; FE 78
0x02ef JR Z, -0x46      ; 28 B8
0x02f1 CP N             ; FE 3C
0x02f3 JR NZ, -0x09     ; 20 F5
0x02f5 CALL 0x0235      ; CD 35 02
0x02f8 LD B, A          ; 47
0x02f9 CALL 0x0314      ; CD 14 03
0x02fc ADD A, L         ; 85
0x02fd LD C, A          ; 4F
0x02fe CALL 0x0235      ; CD 35 02
0x0301 LD (HL), A       ; 77
0x0302 INC HL           ; 23
0x0303 ADD A, C         ; 81
0x0304 LD C, A          ; 4F
0x0305 DJNZ N           ; 10 F7
0x0307 CALL 0x0235      ; CD 35 02
0x030a CP C             ; B9
0x030b JR Z, -0x24      ; 28 DA
0x030d LD A, 0x43       ; 3E 43
0x030f LD (0x3C3E), A   ; 32 3E 3C
0x0312 JR -0x28         ; 18 D6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UNKNOWN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0314 CALL 0x0235      ; CD 35 02
0x0317 LD L, A          ; 6F
0x0318 CALL 0x0235      ; CD 35 02
0x031b LD H, A          ; 67
0x031c RET              ; C9

0x031d EX DE, HL        ; EB
0x031e LD HL, (0x40DF)  ; 2A DF 40
0x0321 EX DE, HL        ; EB
0x0322 RST 10H          ; D7
0x0323 CALL NZ, 0x1E5A  ; C4 5A 1E
0x0326 JR NZ, -0x74     ; 20 8A
0x0328 EX DE, HL        ; EB
0x0329 JP (HL)          ; E9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OUTCHR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x032a PUSH BC          ; C5
0x032b LD C, A          ; 4F
0x032c CALL 0x41C1      ; CD C1 41
0x032f LD A, (0x409C)   ; 3A 9C 40
0x0332 OR A             ; B7
0x0333 LD A, C          ; 79
0x0334 POP BC           ; C1
0x0335 JP M, 0x0264     ; FA 64 02
0x0338 JR NZ, 0x64      ; 20 62

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DISPA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x033a PUSH DE          ; D5
0x033b CALL 0x0033      ; CD 33 00
0x033e PUSH AF          ; F5
0x033f CALL 0x0348      ; CD 48 03
0x0342 LD (0x40A6), A   ; 32 A6 40
0x0345 POP AF           ; F1
0x0346 POP DE           ; D1
0x0347 RET              ; C9

0x0348 LD A, (0x403D)   ; 3A 3D 40
0x034b AND N            ; E6 08
0x034d LD A, (0x4020)   ; 3A 20 40
0x0350 JR Z, 0x05       ; 28 03
0x0352 RRCA             ; 0F
0x0353 AND N            ; E6 1F
0x0355 AND N            ; E6 3F
0x0357 RET              ; C9

0x0358 CALL 0x41C4      ; CD C4 41
0x035b PUSH DE          ; D5
0x035c CALL 0x002B      ; CD 2B 00
0x035f POP DE           ; D1
0x0360 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KIBUFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0361 XOR A            ; AF
0x0362 LD (0x4099), A   ; 32 99 40
0x0365 LD (0x40A6), A   ; 32 A6 40
0x0368 CALL 0x41AF      ; CD AF 41
0x036b PUSH BC          ; C5
0x036c LD HL, (0x40A7)  ; 2A A7 40
0x036f LD B, 0xF0       ; 06 F0
0x0371 CALL 0x05D9      ; CD D9 05
0x0374 PUSH AF          ; F5
0x0375 LD C, B          ; 48
0x0376 LD B, 0x00       ; 06 00
0x0378 ADD HL, BC       ; 09
0x0379 LD (HL), 0x00    ; 36 00
0x037b LD HL, (0x40A7)  ; 2A A7 40
0x037e POP AF           ; F1
0x037f POP BC           ; C1
0x0380 DEC HL           ; 2B
0x0381 RET C            ; D8
0x0382 XOR A            ; AF
0x0383 RET              ; C9

0x0384 CALL 0x0358      ; CD 58 03
0x0387 OR A             ; B7
0x0388 RET NZ           ; C0
0x0389 JR -0x05         ; 18 F9

0x038b XOR A            ; AF
0x038c LD (0x409C), A   ; 32 9C 40
0x038f LD A, (0x409B)   ; 3A 9B 40
0x0392 OR A             ; B7
0x0393 RET Z            ; C8
0x0394 LD A, 0x0D       ; 3E 0D
0x0396 PUSH DE          ; D5
0x0397 CALL 0x039C      ; CD 9C 03
0x039a POP DE           ; D1
0x039b RET              ; C9

0x039c PUSH AF          ; F5
0x039d PUSH DE          ; D5
0x039e PUSH BC          ; C5
0x039f LD C, A          ; 4F
0x03a0 LD E, 0x00       ; 1E 00
0x03a2 CP N             ; FE 0C
0x03a4 JR Z, 0x12       ; 28 10
0x03a6 CP N             ; FE 0A
0x03a8 JR NZ, 0x05      ; 20 03
0x03aa LD A, 0x0D       ; 3E 0D
0x03ac LD C, A          ; 4F
0x03ad CP N             ; FE 0D
0x03af JR Z, 0x07       ; 28 05
0x03b1 LD A, (0x409B)   ; 3A 9B 40
0x03b4 INC A            ; 3C
0x03b5 LD E, A          ; 5F
0x03b6 LD A, E          ; 7B
0x03b7 LD (0x409B), A   ; 32 9B 40
0x03ba LD A, C          ; 79
0x03bb CALL 0x003B      ; CD 3B 00
0x03be POP BC           ; C1
0x03bf POP DE           ; D1
0x03c0 POP AF           ; F1
0x03c1 RET              ; C9

0x0412 DEC C            ; 0D
0x0413 OUT (N), A       ; D3 F8
0x0415 LD (IX+0x05), 0x00; DD 36 05 00
0x0419 CALL 0x0440      ; CD 40 04
0x041c LD A, C          ; 79
0x041d OUT (N), A       ; D3 F8
0x041f INC (IX+0x05)    ; DD 34 05
0x0422 CP N             ; FE 0D
0x0424 JR Z, 0x06       ; 28 04
0x0426 CP N             ; FE 0A
0x0428 JR NZ, 0x15      ; 20 13
0x042a LD (IX+0x05), 0x00; DD 36 05 00
0x042e INC (IX+0x04)    ; DD 34 04
0x0431 LD A, (IX+0x04)  ; DD 7E 04
0x0434 CP (IX+0x03)     ; DD BE 03
0x0437 JR NZ, 0x06      ; 20 04
0x0439 LD (IX+0x04), 0x01; DD 36 04 01
0x043d XOR A            ; AF
0x043e LD A, C          ; 79
0x043f RET              ; C9

0x0440 CALL 0x044B      ; CD 4B 04
0x0443 RET Z            ; C8
0x0444 CALL 0x028D      ; CD 8D 02
0x0447 JR Z, -0x07      ; 28 F7
0x0449 POP AF           ; F1
0x044a RET              ; C9

0x044b IN A, (N)        ; DB F8
0x044d AND N            ; E6 F0
0x044f CP N             ; FE 30
0x0451 RET              ; C9

0x0452 LD HL, 0x36BF    ; 21 BF 36
0x0455 LD DE, 0x4015    ; 11 15 40
0x0458 LD BC, 0x0018    ; 01 18 00
0x045b LDIR             ; ED B0
0x045d LD HL, 0x36F9    ; 21 F9 36
0x0460 LD DE, 0x41E5    ; 11 E5 41
0x0463 LD BC, 0x0018    ; 01 18 00
0x0466 LDIR             ; ED B0
0x0468 RET              ; C9

0x046b XOR A            ; AF
0x046c LD (0x4214), A   ; 32 14 42
0x046f LD HL, (0x40A4)  ; 2A A4 40
0x0472 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VIDDRV
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0473 DI               ; F3
0x0474 LD L, (IX+0x03)  ; DD 6E 03
0x0477 LD H, (IX+0x04)  ; DD 66 04
0x047a LD A, (IX+0x05)  ; DD 7E 05
0x047d OR A             ; B7
0x047e JR Z, 0x03       ; 28 01
0x0480 LD (HL), A       ; 77
0x0481 LD A, C          ; 79
0x0482 CP N             ; FE 20
0x0484 JP C, 0x0521     ; DA 21 05
0x0487 CP N             ; FE C0
0x0489 JR NC, 0x2E      ; 30 2C
0x048b CALL 0x0576      ; CD 76 05
0x048e LD A, H          ; 7C
0x048f AND N            ; E6 03
0x0491 OR N             ; F6 3C
0x0493 LD H, A          ; 67
0x0494 LD D, (HL)       ; 56
0x0495 LD A, (IX+0x05)  ; DD 7E 05
0x0498 OR A             ; B7
0x0499 JR Z, 0x0F       ; 28 0D
0x049b LD (IX+0x05), D  ; DD 72 05
0x049e LD A, (IX+0x06)  ; DD 7E 06
0x04a1 CP N             ; FE 20
0x04a3 JR NC, 0x04      ; 30 02
0x04a5 LD A, 0xB0       ; 3E B0
0x04a7 LD (HL), A       ; 77
0x04a8 LD (IX+0x03), L  ; DD 75 03
0x04ab LD (IX+0x04), H  ; DD 74 04
0x04ae XOR A            ; AF
0x04af LD A, C          ; 79
0x04b0 EI               ; FB
0x04b1 RET              ; C9

0x04b2 LD A, L          ; 7D
0x04b3 AND N            ; E6 C0
0x04b5 LD L, A          ; 6F
0x04b6 RET              ; C9

0x04b7 LD A, (IX+0x07)  ; DD 7E 07
0x04ba OR A             ; B7
0x04bb LD A, C          ; 79
0x04bc JR NZ, -0x31     ; 20 CD
0x04be SUB N            ; D6 C0
0x04c0 JR Z, -0x32      ; 28 CC
0x04c2 LD B, A          ; 47
0x04c3 LD A, 0x20       ; 3E 20
0x04c5 CALL 0x0576      ; CD 76 05
0x04c8 DJNZ N           ; 10 F9
0x04ca JR -0x3C         ; 18 C2

0x04cc LD A, (HL)       ; 7E
0x04cd LD (IX+0x05), A  ; DD 77 05
0x04d0 RET              ; C9

0x04d1 XOR A            ; AF
0x04d2 JR -0x05         ; 18 F9

0x04d4 LD HL, 0x3C00    ; 21 00 3C
0x04d7 LD A, (0x4210)   ; 3A 10 42
0x04da AND N            ; E6 FB
0x04dc CALL 0x0570      ; CD 70 05
0x04df LD A, (0x4214)   ; 3A 14 42
0x04e2 AND N            ; E6 07
0x04e4 RET Z            ; C8
0x04e5 CALL 0x0504      ; CD 04 05
0x04e8 DEC A            ; 3D
0x04e9 JR -0x05         ; 18 F9

0x04eb DEC HL           ; 2B
0x04ec LD A, (0x4210)   ; 3A 10 42
0x04ef AND N            ; E6 04
0x04f1 JR Z, 0x03       ; 28 01
0x04f3 DEC HL           ; 2B
0x04f4 LD (HL), 0x20    ; 36 20
0x04f6 RET              ; C9

0x04f7 LD A, (0x4210)   ; 3A 10 42
0x04fa AND N            ; E6 04
0x04fc CALL NZ, 0x04FF  ; C4 FF 04
0x04ff LD A, L          ; 7D
0x0500 AND N            ; E6 3F
0x0502 DEC HL           ; 2B
0x0503 RET NZ           ; C0
0x0504 LD DE, 0x0040    ; 11 40 00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CURCON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0506 NOP              ; 00
0x0507 ADD HL, DE       ; 19
0x0508 RET              ; C9

0x0509 INC HL           ; 23
0x050a LD A, L          ; 7D
0x050b AND N            ; E6 3F
0x050d RET NZ           ; C0
0x050e LD DE, 0xFFC0    ; 11 C0 FF
0x0511 ADD HL, DE       ; 19
0x0512 RET              ; C9

0x0513 LD A, (0x4210)   ; 3A 10 42
0x0516 OR N             ; F6 04
0x0518 CALL 0x0570      ; CD 70 05
0x051b INC HL           ; 23
0x051c LD A, L          ; 7D
0x051d AND N            ; E6 FE
0x051f LD L, A          ; 6F
0x0520 RET              ; C9

0x0521 LD DE, 0x048E    ; 11 8E 04
0x0524 PUSH DE          ; D5
0x0525 CP N             ; FE 08
0x0527 JR Z, -0x3C      ; 28 C2
0x0529 CP N             ; FE 0A
0x052b JP Z, 0x05AF     ; CA AF 05
0x052e CP N             ; FE 0D
0x0530 JP Z, 0x05AF     ; CA AF 05
0x0533 CP N             ; FE 0E
0x0535 JR Z, -0x69      ; 28 95
0x0537 CP N             ; FE 0F
0x0539 JR Z, -0x68      ; 28 96
0x053b SUB N            ; D6 15
0x053d JR Z, 0x23       ; 28 21
0x053f DEC A            ; 3D
0x0540 JR Z, 0x2B       ; 28 29
0x0542 DEC A            ; 3D
0x0543 JR Z, -0x30      ; 28 CE
0x0545 DEC A            ; 3D
0x0546 JR Z, -0x4F      ; 28 AF
0x0548 DEC A            ; 3D
0x0549 JR Z, -0x40      ; 28 BE
0x054b DEC A            ; 3D
0x054c JR Z, -0x48      ; 28 B6
0x054e DEC A            ; 3D
0x054f JR Z, -0x41      ; 28 BD
0x0551 DEC A            ; 3D
0x0552 JP Z, 0x04D4     ; CA D4 04
0x0555 DEC A            ; 3D
0x0556 JP Z, 0x04B2     ; CA B2 04
0x0559 DEC A            ; 3D
0x055a JR Z, 0x62       ; 28 60
0x055c DEC A            ; 3D
0x055d JR Z, 0x68       ; 28 66
0x055f RET              ; C9

0x0560 LD A, (IX+0x07)  ; DD 7E 07
0x0563 AND N            ; E6 01
0x0565 XOR N            ; EE 01
0x0567 LD (IX+0x07), A  ; DD 77 07
0x056a RET              ; C9

0x056b LD A, (0x4210)   ; 3A 10 42
0x056e XOR N            ; EE 08
0x0570 LD (0x4210), A   ; 32 10 42
0x0573 OUT (N), A       ; D3 EC
0x0575 RET              ; C9

0x0576 LD (HL), A       ; 77
0x0577 INC HL           ; 23
0x0578 LD A, (0x4210)   ; 3A 10 42
0x057b AND N            ; E6 04
0x057d JR Z, 0x03       ; 28 01
0x057f INC HL           ; 23
0x0580 LD A, H          ; 7C
0x0581 CP N             ; FE 40
0x0583 RET NZ           ; C0
0x0584 CALL 0x050E      ; CD 0E 05
0x0587 PUSH HL          ; E5
0x0588 LD A, (0x4214)   ; 3A 14 42
0x058b AND N            ; E6 07
0x058d LD HL, 0x3C00    ; 21 00 3C
0x0590 LD DE, 0x0400    ; 11 00 04
0x0593 PUSH BC          ; C5
0x0594 LD BC, 0x0040    ; 01 40 00
0x0597 INC A            ; 3C
0x0598 ADD HL, BC       ; 09
0x0599 EX DE, HL        ; EB
0x059a OR A             ; B7
0x059b SBC HL, BC       ; ED 42
0x059d EX DE, HL        ; EB
0x059e DEC A            ; 3D
0x059f JR NZ, -0x07     ; 20 F7
0x05a1 PUSH DE          ; D5
0x05a2 PUSH HL          ; E5
0x05a3 OR A             ; B7
0x05a4 SBC HL, BC       ; ED 42
0x05a6 EX DE, HL        ; EB
0x05a7 POP HL           ; E1
0x05a8 POP BC           ; C1
0x05a9 LDIR             ; ED B0
0x05ab POP BC           ; C1
0x05ac EX DE, HL        ; EB
0x05ad JR 0x19          ; 18 17

0x05af CALL 0x04B2      ; CD B2 04
0x05b2 PUSH HL          ; E5
0x05b3 CALL 0x0504      ; CD 04 05
0x05b6 LD A, H          ; 7C
0x05b7 CP N             ; FE 40
0x05b9 JR Z, -0x31      ; 28 CD
0x05bb POP DE           ; D1
0x05bc PUSH HL          ; E5
0x05bd LD D, H          ; 54
0x05be LD A, L          ; 7D
0x05bf OR N             ; F6 3F
0x05c1 LD E, A          ; 5F
0x05c2 INC DE           ; 13
0x05c3 JR 0x06          ; 18 04

0x05c5 PUSH HL          ; E5
0x05c6 LD DE, 0x4000    ; 11 00 40
0x05c9 LD (HL), 0x20    ; 36 20
0x05cb INC HL           ; 23
0x05cc RST 18H          ; DF
0x05cd JR NZ, -0x04     ; 20 FA
0x05cf POP HL           ; E1
0x05d0 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KLINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x05d9 PUSH HL          ; E5
0x05da LD A, 0x0E       ; 3E 0E
0x05dc CALL 0x0033      ; CD 33 00
0x05df LD C, B          ; 48
0x05e0 CALL 0x0049      ; CD 49 00
0x05e3 CP N             ; FE 20
0x05e5 JR NC, 0x27      ; 30 25
0x05e7 CP N             ; FE 0D
0x05e9 JP Z, 0x0662     ; CA 62 06
0x05ec CP N             ; FE 1F
0x05ee JR Z, 0x2B       ; 28 29
0x05f0 CP N             ; FE 01
0x05f2 JR Z, 0x6F       ; 28 6D
0x05f4 LD DE, 0x05E0    ; 11 E0 05
0x05f7 PUSH DE          ; D5
0x05f8 CP N             ; FE 08
0x05fa JR Z, 0x36       ; 28 34
0x05fc CP N             ; FE 18
0x05fe JR Z, 0x2D       ; 28 2B
0x0600 CP N             ; FE 09
0x0602 JR Z, 0x44       ; 28 42
0x0604 CP N             ; FE 19
0x0606 JR Z, 0x3B       ; 28 39
0x0608 CP N             ; FE 0A
0x060a RET NZ           ; C0
0x060b POP DE           ; D1
0x060c LD (HL), A       ; 77
0x060d LD A, B          ; 78
0x060e OR A             ; B7
0x060f JR Z, -0x2F      ; 28 CF
0x0611 LD A, (HL)       ; 7E
0x0612 INC HL           ; 23
0x0613 CALL 0x0033      ; CD 33 00
0x0616 DEC B            ; 05
0x0617 JR -0x37         ; 18 C7

0x0619 CALL 0x01C9      ; CD C9 01
0x061c LD B, C          ; 41
0x061d POP HL           ; E1
0x061e PUSH HL          ; E5
0x061f JP 0x05E0        ; C3 E0 05

0x0622 CALL 0x0630      ; CD 30 06
0x0625 DEC HL           ; 2B
0x0626 LD A, (HL)       ; 7E
0x0627 INC HL           ; 23
0x0628 CP N             ; FE 0A
0x062a RET Z            ; C8
0x062b LD A, B          ; 78
0x062c CP C             ; B9
0x062d JR NZ, -0x0B     ; 20 F3
0x062f RET              ; C9

0x0630 LD A, B          ; 78
0x0631 CP C             ; B9
0x0632 RET Z            ; C8
0x0633 DEC HL           ; 2B
0x0634 LD A, (HL)       ; 7E
0x0635 CP N             ; FE 0A
0x0637 INC HL           ; 23
0x0638 RET Z            ; C8
0x0639 DEC HL           ; 2B
0x063a LD A, 0x08       ; 3E 08
0x063c CALL 0x0033      ; CD 33 00
0x063f INC B            ; 04
0x0640 RET              ; C9

0x0641 LD A, 0x17       ; 3E 17
0x0643 JP 0x0033        ; C3 33 00

0x0646 CALL 0x0348      ; CD 48 03
0x0649 AND N            ; E6 07
0x064b CPL              ; 2F
0x064c INC A            ; 3C
0x064d ADD A, 0x08      ; C6 08
0x064f LD E, A          ; 5F
0x0650 LD A, B          ; 78
0x0651 OR A             ; B7
0x0652 RET Z            ; C8
0x0653 LD A, 0x20       ; 3E 20
0x0655 LD (HL), A       ; 77
0x0656 INC HL           ; 23
0x0657 PUSH DE          ; D5
0x0658 CALL 0x0033      ; CD 33 00
0x065b POP DE           ; D1
0x065c DEC B            ; 05
0x065d DEC E            ; 1D
0x065e RET Z            ; C8
0x065f JR -0x0F         ; 18 EF

0x0661 SCF              ; 37
0x0662 PUSH AF          ; F5
0x0663 LD A, 0x0D       ; 3E 0D
0x0665 LD (HL), A       ; 77
0x0666 CALL 0x0033      ; CD 33 00
0x0669 LD A, 0x0F       ; 3E 0F
0x066b CALL 0x0033      ; CD 33 00
0x066e LD A, C          ; 79
0x066f SUB B            ; 90
0x0670 LD B, A          ; 47
0x0671 POP AF           ; F1
0x0672 POP HL           ; E1
0x0673 RET              ; C9

0x0674 PUSH HL          ; E5
0x0675 PUSH IX          ; DD E5
0x0677 PUSH DE          ; D5
0x0678 POP IX           ; DD E1
0x067a PUSH DE          ; D5
0x067b LD HL, 0x0694    ; 21 94 06
0x067e PUSH HL          ; E5
0x067f LD C, A          ; 4F
0x0680 LD A, (DE)       ; 1A
0x0681 BIT 7, A         ; CB 7F
0x0683 JR Z, 0x07       ; 28 05
0x0685 AND B            ; A0
0x0686 CP B             ; B8
0x0687 JP NZ, 0x4033    ; C2 33 40
0x068a AND B            ; A0
0x068b CP N             ; FE 02
0x068d LD L, (IX+0x01)  ; DD 6E 01
0x0690 LD H, (IX+0x02)  ; DD 66 02
0x0693 JP (HL)          ; E9
0x0694 POP DE           ; D1
0x0695 POP IX           ; DD E1
0x0697 POP HL           ; E1
0x0698 POP BC           ; C1
0x0699 RET              ; C9

0x069a XOR A            ; AF
0x069b LD (0x409F), A   ; 32 9F 40
0x069e LD D, 0xFF       ; 16 FF
0x06a0 JP 0x2B8D        ; C3 8D 2B

0x06a3 AND N            ; E6 FD
0x06a5 LD (0x409F), A   ; 32 9F 40
0x06a8 LD A, 0x3A       ; 3E 3A
0x06aa OR A             ; B7
0x06ab JP P, 0x06E2     ; F2 E2 06
0x06ae LD A, (0x409F)   ; 3A 9F 40
0x06b1 RRA              ; 1F
0x06b2 JR C, 0x30       ; 38 2E
0x06b4 RRA              ; 1F
0x06b5 RRA              ; 1F
0x06b6 JR NC, 0x40      ; 30 3E
0x06b8 LD A, (HL)       ; 7E
0x06b9 CP N             ; FE FB
0x06bb PUSH HL          ; E5
0x06bc PUSH BC          ; C5
0x06bd LD HL, 0x06DF    ; 21 DF 06
0x06c0 PUSH HL          ; E5
0x06c1 RET NZ           ; C0
0x06c2 DEC BC           ; 0B
0x06c3 LD A, (BC)       ; 0A
0x06c4 CP N             ; FE 4D
0x06c6 RET NZ           ; C0
0x06c7 DEC BC           ; 0B
0x06c8 LD A, (BC)       ; 0A
0x06c9 CP N             ; FE 45
0x06cb RET NZ           ; C0
0x06cc DEC BC           ; 0B
0x06cd LD A, (BC)       ; 0A
0x06ce CP N             ; FE 52
0x06d0 RET NZ           ; C0
0x06d1 DEC BC           ; 0B
0x06d2 LD A, (BC)       ; 0A
0x06d3 CP N             ; FE 3A
0x06d5 RET NZ           ; C0
0x06d6 POP AF           ; F1
0x06d7 POP AF           ; F1
0x06d8 POP HL           ; E1
0x06d9 INC D            ; 14
0x06da INC D            ; 14
0x06db INC D            ; 14
0x06dc INC D            ; 14
0x06dd JR 0x27          ; 18 25

0x06e2 JP 0x2B89        ; C3 89 2B

0x06e5 LD A, (0x409F)   ; 3A 9F 40
0x06e8 OR N             ; F6 02
0x06ea LD (0x409F), A   ; 32 9F 40
0x06ed XOR A            ; AF
0x06ee RET              ; C9

0x06ef LD A, (0x409F)   ; 3A 9F 40
0x06f2 OR N             ; F6 04
0x06f4 JR -0x0A         ; 18 F4

0x06f6 RLA              ; 17
0x06f7 JR C, -0x15      ; 38 E9
0x06f9 LD A, (HL)       ; 7E
0x06fa CP N             ; FE 88
0x06fc CALL Z, 0x06E5   ; CC E5 06
0x06ff CP N             ; FE 93
0x0701 CALL Z, 0x06EF   ; CC EF 06
0x0704 LD A, (HL)       ; 7E
0x0705 JP 0x2BA0        ; C3 A0 2B

0x0708 LD HL, 0x1380    ; 21 80 13
0x070b CALL 0x09C2      ; CD C2 09
0x070e JR 0x08          ; 18 06

0x0710 CALL 0x09C2      ; CD C2 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SUBSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0713 CALL 0x0982      ; CD 82 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ADDSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0716 LD A, B          ; 78
0x0717 OR A             ; B7
0x0718 RET Z            ; C8
0x0719 LD A, (0x4124)   ; 3A 24 41
0x071c OR A             ; B7
0x071d JP Z, 0x09B4     ; CA B4 09
0x0720 SUB B            ; 90
0x0721 JR NC, 0x0E      ; 30 0C
0x0723 CPL              ; 2F
0x0724 INC A            ; 3C
0x0725 EX DE, HL        ; EB
0x0726 CALL 0x09A4      ; CD A4 09
0x0729 EX DE, HL        ; EB
0x072a CALL 0x09B4      ; CD B4 09
0x072d POP BC           ; C1
0x072e POP DE           ; D1
0x072f CP N             ; FE 19
0x0731 RET NC           ; D0
0x0732 PUSH AF          ; F5
0x0733 CALL 0x09DF      ; CD DF 09
0x0736 LD H, A          ; 67
0x0737 POP AF           ; F1
0x0738 CALL 0x07D7      ; CD D7 07
0x073b OR H             ; B4
0x073c LD HL, 0x4121    ; 21 21 41
0x073f JP P, 0x0754     ; F2 54 07
0x0742 CALL 0x07B7      ; CD B7 07
0x0745 JP NC, 0x0796    ; D2 96 07
0x0748 INC HL           ; 23
0x0749 INC (HL)         ; 34
0x074a JP Z, 0x07B2     ; CA B2 07
0x074d LD L, 0x01       ; 2E 01
0x074f CALL 0x07EB      ; CD EB 07
0x0752 JR 0x44          ; 18 42

0x0754 XOR A            ; AF
0x0755 SUB B            ; 90
0x0756 LD B, A          ; 47
0x0757 LD A, (HL)       ; 7E
0x0758 SBC E            ; 9B
0x0759 LD E, A          ; 5F
0x075a INC HL           ; 23
0x075b LD A, (HL)       ; 7E
0x075c SBC D            ; 9A
0x075d LD D, A          ; 57
0x075e INC HL           ; 23
0x075f LD A, (HL)       ; 7E
0x0760 SBC C            ; 99
0x0761 LD C, A          ; 4F
0x0762 CALL C, 0x07C3   ; DC C3 07
0x0765 LD L, B          ; 68
0x0766 LD H, E          ; 63
0x0767 XOR A            ; AF
0x0768 LD B, A          ; 47
0x0769 LD A, C          ; 79
0x076a OR A             ; B7
0x076b JR NZ, 0x1A      ; 20 18
0x076d LD C, D          ; 4A
0x076e LD D, H          ; 54
0x076f LD H, L          ; 65
0x0770 LD L, A          ; 6F
0x0771 LD A, B          ; 78
0x0772 SUB N            ; D6 08
0x0774 CP N             ; FE E0
0x0776 JR NZ, -0x0E     ; 20 F0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RSETSA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0778 XOR A            ; AF
0x0779 LD (0x4124), A   ; 32 24 41
0x077c RET              ; C9

0x077d DEC B            ; 05
0x077e ADD HL, HL       ; 29
0x077f LD A, D          ; 7A
0x0780 RLA              ; 17
0x0781 LD D, A          ; 57
0x0782 LD A, C          ; 79
0x0783 ADC A, A         ; 8F
0x0784 LD C, A          ; 4F
0x0785 JP P, 0x077D     ; F2 7D 07
0x0788 LD A, B          ; 78
0x0789 LD E, H          ; 5C
0x078a LD B, L          ; 45
0x078b OR A             ; B7
0x078c JR Z, 0x0A       ; 28 08
0x078e LD HL, 0x4124    ; 21 24 41
0x0791 ADD A, (HL)      ; 86
0x0792 LD (HL), A       ; 77
0x0793 JR NC, -0x1B     ; 30 E3
0x0795 RET Z            ; C8
0x0796 LD A, B          ; 78
0x0797 LD HL, 0x4124    ; 21 24 41
0x079a OR A             ; B7
0x079b CALL M, 0x07A8   ; FC A8 07
0x079e LD B, (HL)       ; 46
0x079f INC HL           ; 23
0x07a0 LD A, (HL)       ; 7E
0x07a1 AND N            ; E6 80
0x07a3 XOR C            ; A9
0x07a4 LD C, A          ; 4F
0x07a5 JP 0x09B4        ; C3 B4 09

0x07a8 INC E            ; 1C
0x07a9 RET NZ           ; C0
0x07aa INC D            ; 14
0x07ab RET NZ           ; C0
0x07ac INC C            ; 0C
0x07ad RET NZ           ; C0
0x07ae LD C, 0x80       ; 0E 80
0x07b0 INC (HL)         ; 34
0x07b1 RET NZ           ; C0
0x07b2 LD E, 0x0A       ; 1E 0A
0x07b4 JP 0x19A2        ; C3 A2 19

0x07b7 LD A, (HL)       ; 7E
0x07b8 ADD A, E         ; 83
0x07b9 LD E, A          ; 5F
0x07ba INC HL           ; 23
0x07bb LD A, (HL)       ; 7E
0x07bc ADC A, D         ; 8A
0x07bd LD D, A          ; 57
0x07be INC HL           ; 23
0x07bf LD A, (HL)       ; 7E
0x07c0 ADC A, C         ; 89
0x07c1 LD C, A          ; 4F
0x07c2 RET              ; C9

0x07c3 LD HL, 0x4125    ; 21 25 41
0x07c6 LD A, (HL)       ; 7E
0x07c7 CPL              ; 2F
0x07c8 LD (HL), A       ; 77
0x07c9 XOR A            ; AF
0x07ca LD L, A          ; 6F
0x07cb SUB B            ; 90
0x07cc LD B, A          ; 47
0x07cd LD A, L          ; 7D
0x07ce SBC E            ; 9B
0x07cf LD E, A          ; 5F
0x07d0 LD A, L          ; 7D
0x07d1 SBC D            ; 9A
0x07d2 LD D, A          ; 57
0x07d3 LD A, L          ; 7D
0x07d4 SBC C            ; 99
0x07d5 LD C, A          ; 4F
0x07d6 RET              ; C9

0x07d7 LD B, 0x00       ; 06 00
0x07d9 SUB N            ; D6 08
0x07db JR C, 0x09       ; 38 07
0x07dd LD B, E          ; 43
0x07de LD E, D          ; 5A
0x07df LD D, C          ; 51
0x07e0 LD C, 0x00       ; 0E 00
0x07e2 JR -0x09         ; 18 F5

0x07e4 ADD A, 0x09      ; C6 09
0x07e6 LD L, A          ; 6F
0x07e7 XOR A            ; AF
0x07e8 DEC L            ; 2D
0x07e9 RET Z            ; C8
0x07ea LD A, C          ; 79
0x07eb RRA              ; 1F
0x07ec LD C, A          ; 4F
0x07ed LD A, D          ; 7A
0x07ee RRA              ; 1F
0x07ef LD D, A          ; 57
0x07f0 LD A, E          ; 7B
0x07f1 RRA              ; 1F
0x07f2 LD E, A          ; 5F
0x07f3 LD A, B          ; 78
0x07f4 RRA              ; 1F
0x07f5 LD B, A          ; 47
0x07f6 JR -0x0F         ; 18 EF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LOG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0809 CALL 0x0955      ; CD 55 09
0x080c OR A             ; B7
0x080d JP PE, 0x1E4A    ; EA 4A 1E
0x0810 LD HL, 0x4124    ; 21 24 41
0x0813 LD A, (HL)       ; 7E
0x0814 LD BC, 0x8035    ; 01 35 80
0x0817 LD DE, 0x04F3    ; 11 F3 04
0x081a SUB B            ; 90
0x081b PUSH AF          ; F5
0x081c LD (HL), B       ; 70
0x081d PUSH DE          ; D5
0x081e PUSH BC          ; C5
0x081f CALL 0x0716      ; CD 16 07
0x0822 POP BC           ; C1
0x0823 POP DE           ; D1
0x0824 INC B            ; 04
0x0825 CALL 0x08A2      ; CD A2 08
0x0828 LD HL, 0x07F8    ; 21 F8 07
0x082b CALL 0x0710      ; CD 10 07
0x082e LD HL, 0x07FC    ; 21 FC 07
0x0831 CALL 0x149A      ; CD 9A 14
0x0834 LD BC, 0x8080    ; 01 80 80
0x0837 LD DE, 0x0000    ; 11 00 00
0x083a CALL 0x0716      ; CD 16 07
0x083d POP AF           ; F1
0x083e CALL 0x0F89      ; CD 89 0F
0x0841 LD BC, 0x8031    ; 01 31 80
0x0844 LD DE, 0x7218    ; 11 18 72

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MLTSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0847 CALL 0x0955      ; CD 55 09
0x084a RET Z            ; C8
0x084b LD L, 0x00       ; 2E 00
0x084d CALL 0x0914      ; CD 14 09
0x0850 LD A, C          ; 79
0x0851 LD (0x414F), A   ; 32 4F 41
0x0854 EX DE, HL        ; EB
0x0855 LD (0x4150), HL  ; 22 50 41
0x0858 LD BC, 0x0000    ; 01 00 00
0x085b LD D, B          ; 50
0x085c LD E, B          ; 58
0x085d LD HL, 0x0765    ; 21 65 07
0x0860 PUSH HL          ; E5
0x0861 LD HL, 0x0869    ; 21 69 08
0x0864 PUSH HL          ; E5
0x0865 PUSH HL          ; E5
0x0866 LD HL, 0x4121    ; 21 21 41
0x0869 LD A, (HL)       ; 7E
0x086a INC HL           ; 23
0x086b OR A             ; B7
0x086c JR Z, 0x26       ; 28 24
0x086e PUSH HL          ; E5
0x086f LD L, 0x08       ; 2E 08
0x0871 RRA              ; 1F
0x0872 LD H, A          ; 67
0x0873 LD A, C          ; 79
0x0874 JR NC, 0x0D      ; 30 0B
0x0876 PUSH HL          ; E5
0x0877 LD HL, (0x4150)  ; 2A 50 41
0x087a ADD HL, DE       ; 19
0x087b EX DE, HL        ; EB
0x087c POP HL           ; E1
0x087d LD A, (0x414F)   ; 3A 4F 41
0x0880 ADC A, C         ; 89
0x0881 RRA              ; 1F
0x0882 LD C, A          ; 4F
0x0883 LD A, D          ; 7A
0x0884 RRA              ; 1F
0x0885 LD D, A          ; 57
0x0886 LD A, E          ; 7B
0x0887 RRA              ; 1F
0x0888 LD E, A          ; 5F
0x0889 LD A, B          ; 78
0x088a RRA              ; 1F
0x088b LD B, A          ; 47
0x088c DEC L            ; 2D
0x088d LD A, H          ; 7C
0x088e JR NZ, -0x1D     ; 20 E1
0x0890 POP HL           ; E1
0x0891 RET              ; C9

0x0892 LD B, E          ; 43
0x0893 LD E, D          ; 5A
0x0894 LD D, C          ; 51
0x0895 LD C, A          ; 4F
0x0896 RET              ; C9

0x0897 CALL 0x09A4      ; CD A4 09
0x089a LD HL, 0x0DD8    ; 21 D8 0D
0x089d CALL 0x09B1      ; CD B1 09
0x08a0 POP BC           ; C1
0x08a1 POP DE           ; D1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DIVSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x08a2 CALL 0x0955      ; CD 55 09
0x08a5 JP Z, 0x199A     ; CA 9A 19
0x08a8 LD L, 0xFF       ; 2E FF
0x08aa CALL 0x0914      ; CD 14 09
0x08ad INC (HL)         ; 34
0x08ae INC (HL)         ; 34
0x08af DEC HL           ; 2B
0x08b0 LD A, (HL)       ; 7E
0x08b1 LD (0x4089), A   ; 32 89 40
0x08b4 DEC HL           ; 2B
0x08b5 LD A, (HL)       ; 7E
0x08b6 LD (0x4085), A   ; 32 85 40
0x08b9 DEC HL           ; 2B
0x08ba LD A, (HL)       ; 7E
0x08bb LD (0x4081), A   ; 32 81 40
0x08be LD B, C          ; 41
0x08bf EX DE, HL        ; EB
0x08c0 XOR A            ; AF
0x08c1 LD C, A          ; 4F
0x08c2 LD D, A          ; 57
0x08c3 LD E, A          ; 5F
0x08c4 LD (0x408C), A   ; 32 8C 40
0x08c7 PUSH HL          ; E5
0x08c8 PUSH BC          ; C5
0x08c9 LD A, L          ; 7D
0x08ca CALL 0x4080      ; CD 80 40
0x08cd SBC A, 0x00      ; DE 00
0x08cf CCF              ; 3F
0x08d0 JR NC, 0x09      ; 30 07
0x08d2 LD (0x408C), A   ; 32 8C 40
0x08d5 POP AF           ; F1
0x08d6 POP AF           ; F1
0x08d7 SCF              ; 37
0x08d8 JP NC, 0xE1C1    ; D2 C1 E1
0x08d9 POP BC           ; C1
0x08da POP HL           ; E1
0x08db LD A, C          ; 79
0x08dc INC A            ; 3C
0x08dd DEC A            ; 3D
0x08de RRA              ; 1F
0x08df JP M, 0x0797     ; FA 97 07
0x08e2 RLA              ; 17
0x08e3 LD A, E          ; 7B
0x08e4 RLA              ; 17
0x08e5 LD E, A          ; 5F
0x08e6 LD A, D          ; 7A
0x08e7 RLA              ; 17
0x08e8 LD D, A          ; 57
0x08e9 LD A, C          ; 79
0x08ea RLA              ; 17
0x08eb LD C, A          ; 4F
0x08ec ADD HL, HL       ; 29
0x08ed LD A, B          ; 78
0x08ee RLA              ; 17
0x08ef LD B, A          ; 47
0x08f0 LD A, (0x408C)   ; 3A 8C 40
0x08f3 RLA              ; 17
0x08f4 LD (0x408C), A   ; 32 8C 40
0x08f7 LD A, C          ; 79
0x08f8 OR D             ; B2
0x08f9 OR E             ; B3
0x08fa JR NZ, -0x33     ; 20 CB
0x08fc PUSH HL          ; E5
0x08fd LD HL, 0x4124    ; 21 24 41
0x0900 DEC (HL)         ; 35
0x0901 POP HL           ; E1
0x0902 JR NZ, -0x3B     ; 20 C3
0x0904 JP 0x07B2        ; C3 B2 07

0x0907 LD A, 0xFF       ; 3E FF
0x0909 LD L, 0xAF       ; 2E AF
0x090a XOR A            ; AF
0x090b LD HL, 0x412D    ; 21 2D 41
0x090e LD C, (HL)       ; 4E
0x090f INC HL           ; 23
0x0910 XOR (HL)         ; AE
0x0911 LD B, A          ; 47
0x0912 LD L, 0x00       ; 2E 00
0x0914 LD A, B          ; 78
0x0915 OR A             ; B7
0x0916 JR Z, 0x21       ; 28 1F
0x0918 LD A, L          ; 7D
0x0919 LD HL, 0x4124    ; 21 24 41
0x091c XOR (HL)         ; AE
0x091d ADD A, B         ; 80
0x091e LD B, A          ; 47
0x091f RRA              ; 1F
0x0920 XOR B            ; A8
0x0921 LD A, B          ; 78
0x0922 JP P, 0x0936     ; F2 36 09
0x0925 ADD A, 0x80      ; C6 80
0x0927 LD (HL), A       ; 77
0x0928 JP Z, 0x0890     ; CA 90 08
0x092b CALL 0x09DF      ; CD DF 09
0x092e LD (HL), A       ; 77
0x092f DEC HL           ; 2B
0x0930 RET              ; C9

0x0931 CALL 0x0955      ; CD 55 09
0x0934 CPL              ; 2F
0x0935 POP HL           ; E1
0x0936 OR A             ; B7
0x0937 POP HL           ; E1
0x0938 JP P, 0x0778     ; F2 78 07
0x093b JP 0x07B2        ; C3 B2 07

0x093e CALL 0x09BF      ; CD BF 09
0x0941 LD A, B          ; 78
0x0942 OR A             ; B7
0x0943 RET Z            ; C8
0x0944 ADD A, 0x02      ; C6 02
0x0946 JP C, 0x07B2     ; DA B2 07
0x0949 LD B, A          ; 47
0x094a CALL 0x0716      ; CD 16 07
0x094d LD HL, 0x4124    ; 21 24 41
0x0950 INC (HL)         ; 34
0x0951 RET NZ           ; C0
0x0952 JP 0x07B2        ; C3 B2 07

0x0955 LD A, (0x4124)   ; 3A 24 41
0x0958 OR A             ; B7
0x0959 RET Z            ; C8
0x095a LD A, (0x4123)   ; 3A 23 41
0x095d CP N             ; FE 2F
0x095e CPL              ; 2F
0x095f RLA              ; 17
0x0960 SBC A            ; 9F
0x0961 RET NZ           ; C0
0x0962 INC A            ; 3C
0x0963 RET              ; C9

0x0964 LD B, 0x88       ; 06 88
0x0966 LD DE, 0x0000    ; 11 00 00
0x0969 LD HL, 0x4124    ; 21 24 41
0x096c LD C, A          ; 4F
0x096d LD (HL), B       ; 70
0x096e LD B, 0x00       ; 06 00
0x0970 INC HL           ; 23
0x0971 LD (HL), 0x80    ; 36 80
0x0973 RLA              ; 17
0x0974 JP 0x0762        ; C3 62 07

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ABS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0977 CALL 0x0994      ; CD 94 09
0x097a RET P            ; F0
0x097b RST 20H          ; E7
0x097c JP M, 0x0C5B     ; FA 5B 0C
0x097f JP Z, 0x0AF6     ; CA F6 0A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MVVAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0982 LD HL, 0x4123    ; 21 23 41
0x0985 LD A, (HL)       ; 7E
0x0986 XOR N            ; EE 80
0x0988 LD (HL), A       ; 77
0x0989 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SGN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x098a CALL 0x0994      ; CD 94 09
0x098d LD L, A          ; 6F
0x098e RLA              ; 17
0x098f SBC A            ; 9F
0x0990 LD H, A          ; 67
0x0991 JP 0x0A9A        ; C3 9A 0A

0x0994 RST 20H          ; E7
0x0995 JP Z, 0x0AF6     ; CA F6 0A
0x0998 JP P, 0x0955     ; F2 55 09
0x099b LD HL, (0x4121)  ; 2A 21 41
0x099e LD A, H          ; 7C
0x099f OR L             ; B5
0x09a0 RET Z            ; C8
0x09a1 LD A, H          ; 7C
0x09a2 JR -0x43         ; 18 BB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDSTSA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09a4 EX DE, HL        ; EB
0x09a5 LD HL, (0x4121)  ; 2A 21 41
0x09a8 EX (SP), HL      ; E3
0x09a9 PUSH HL          ; E5
0x09aa LD HL, (0x4123)  ; 2A 23 41
0x09ad EX (SP), HL      ; E3
0x09ae PUSH HL          ; E5
0x09af EX DE, HL        ; EB
0x09b0 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDSAHL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09b1 CALL 0x09C2      ; CD C2 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDSARA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09b4 EX DE, HL        ; EB
0x09b5 LD (0x4121), HL  ; 22 21 41
0x09b8 LD H, B          ; 60
0x09b9 LD L, C          ; 69
0x09ba LD (0x4123), HL  ; 22 23 41
0x09bd EX DE, HL        ; EB
0x09be RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDRASA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09bf LD HL, 0x4121    ; 21 21 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDRAHL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09c2 LD E, (HL)       ; 5E
0x09c3 INC HL           ; 23
0x09c4 LD D, (HL)       ; 56
0x09c5 INC HL           ; 23
0x09c6 LD C, (HL)       ; 4E
0x09c7 INC HL           ; 23
0x09c8 LD B, (HL)       ; 46
0x09c9 INC HL           ; 23
0x09ca RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDHLSA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09cb LD DE, 0x4121    ; 11 21 41
0x09ce LD B, 0x04       ; 06 04
0x09d0 JR 0x07          ; 18 05

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDDEHL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09d2 EX DE, HL        ; EB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LDHLDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09d3 LD A, (0x40AF)   ; 3A AF 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MOVEA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09d6 LD B, A          ; 47

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MOVEB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09d7 LD A, (DE)       ; 1A
0x09d8 LD (HL), A       ; 77
0x09d9 INC DE           ; 13
0x09da INC HL           ; 23
0x09db DEC B            ; 05
0x09dc JR NZ, -0x05     ; 20 F9
0x09de RET              ; C9

0x09df LD HL, 0x4123    ; 21 23 41
0x09e2 LD A, (HL)       ; 7E
0x09e3 RLCA             ; 07
0x09e4 SCF              ; 37
0x09e5 RRA              ; 1F
0x09e6 LD (HL), A       ; 77
0x09e7 CCF              ; 3F
0x09e8 RRA              ; 1F
0x09e9 INC HL           ; 23
0x09ea INC HL           ; 23
0x09eb LD (HL), A       ; 77
0x09ec LD A, C          ; 79
0x09ed RLCA             ; 07
0x09ee SCF              ; 37
0x09ef RRA              ; 1F
0x09f0 LD C, A          ; 4F
0x09f1 RRA              ; 1F
0x09f2 XOR (HL)         ; AE
0x09f3 RET              ; C9

0x09f4 LD HL, 0x4127    ; 21 27 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MVSAHL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09f7 LD DE, 0x09D2    ; 11 D2 09
0x09fa JR 0x08          ; 18 06

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MVALT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x09fc LD HL, 0x4127    ; 21 27 41
0x09ff LD DE, 0x09D3    ; 11 D3 09
0x0a02 PUSH DE          ; D5
0x0a03 LD DE, 0x4121    ; 11 21 41
0x0a06 RST 20H          ; E7
0x0a07 RET C            ; D8
0x0a08 LD DE, 0x411D    ; 11 1D 41
0x0a0b RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CPSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0a0c LD A, B          ; 78
0x0a0d OR A             ; B7
0x0a0e JP Z, 0x0955     ; CA 55 09
0x0a11 LD HL, 0x095E    ; 21 5E 09
0x0a14 PUSH HL          ; E5
0x0a15 CALL 0x0955      ; CD 55 09
0x0a18 LD A, C          ; 79
0x0a19 RET Z            ; C8
0x0a1a LD HL, 0x4123    ; 21 23 41
0x0a1d XOR (HL)         ; AE
0x0a1e LD A, C          ; 79
0x0a1f RET M            ; F8
0x0a20 CALL 0x0A26      ; CD 26 0A
0x0a23 RRA              ; 1F
0x0a24 XOR C            ; A9
0x0a25 RET              ; C9

0x0a26 INC HL           ; 23
0x0a27 LD A, B          ; 78
0x0a28 CP (HL)          ; BE
0x0a29 RET NZ           ; C0
0x0a2a DEC HL           ; 2B
0x0a2b LD A, C          ; 79
0x0a2c CP (HL)          ; BE
0x0a2d RET NZ           ; C0
0x0a2e DEC HL           ; 2B
0x0a2f LD A, D          ; 7A
0x0a30 CP (HL)          ; BE
0x0a31 RET NZ           ; C0
0x0a32 DEC HL           ; 2B
0x0a33 LD A, E          ; 7B
0x0a34 SUB (HL)         ; 96
0x0a35 RET NZ           ; C0
0x0a36 POP HL           ; E1
0x0a37 POP HL           ; E1
0x0a38 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CPINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0a39 LD A, D          ; 7A
0x0a3a XOR H            ; AC
0x0a3b LD A, H          ; 7C
0x0a3c JP M, 0x095F     ; FA 5F 09
0x0a3f CP D             ; BA
0x0a40 JP NZ, 0x0960    ; C2 60 09
0x0a43 LD A, L          ; 7D
0x0a44 SUB E            ; 93
0x0a45 JP NZ, 0x0960    ; C2 60 09
0x0a48 RET              ; C9

0x0a49 LD HL, 0x4127    ; 21 27 41
0x0a4c CALL 0x09D3      ; CD D3 09
0x0a4f LD DE, 0x412E    ; 11 2E 41
0x0a52 LD A, (DE)       ; 1A
0x0a53 OR A             ; B7
0x0a54 JP Z, 0x0955     ; CA 55 09
0x0a57 LD HL, 0x095E    ; 21 5E 09
0x0a5a PUSH HL          ; E5
0x0a5b CALL 0x0955      ; CD 55 09
0x0a5e DEC DE           ; 1B
0x0a5f LD A, (DE)       ; 1A
0x0a60 LD C, A          ; 4F
0x0a61 RET Z            ; C8
0x0a62 LD HL, 0x4123    ; 21 23 41
0x0a65 XOR (HL)         ; AE
0x0a66 LD A, C          ; 79
0x0a67 RET M            ; F8
0x0a68 INC DE           ; 13
0x0a69 INC HL           ; 23
0x0a6a LD B, 0x08       ; 06 08
0x0a6c LD A, (DE)       ; 1A
0x0a6d SUB (HL)         ; 96
0x0a6e JP NZ, 0x0A23    ; C2 23 0A
0x0a71 DEC DE           ; 1B
0x0a72 DEC HL           ; 2B
0x0a73 DEC B            ; 05
0x0a74 JR NZ, -0x08     ; 20 F6
0x0a76 POP BC           ; C1
0x0a77 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CPDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0a78 CALL 0x0A4F      ; CD 4F 0A
0x0a7b JP NZ, 0x095E    ; C2 5E 09
0x0a7e RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GETPAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0a7f RST 20H          ; E7
0x0a80 LD HL, (0x4121)  ; 2A 21 41
0x0a83 RET M            ; F8
0x0a84 JP Z, 0x0AF6     ; CA F6 0A
0x0a87 CALL NC, 0x0AB9  ; D4 B9 0A
0x0a8a LD HL, 0x07B2    ; 21 B2 07
0x0a8d PUSH HL          ; E5
0x0a8e LD A, (0x4124)   ; 3A 24 41
0x0a91 CP N             ; FE 90
0x0a93 JR NC, 0x10      ; 30 0E
0x0a95 CALL 0x0AFB      ; CD FB 0A
0x0a98 EX DE, HL        ; EB
0x0a99 POP DE           ; D1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BSCPAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0a9a LD (0x4121), HL  ; 22 21 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FLAGIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0a9d LD A, 0x02       ; 3E 02
0x0a9f LD (0x40AF), A   ; 32 AF 40
0x0aa2 RET              ; C9

0x0aa3 LD BC, 0x9080    ; 01 80 90
0x0aa6 LD DE, 0x0000    ; 11 00 00
0x0aa9 CALL 0x0A0C      ; CD 0C 0A
0x0aac RET NZ           ; C0
0x0aad LD H, C          ; 61
0x0aae LD L, D          ; 6A
0x0aaf JR -0x16         ; 18 E8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSASP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0ab1 RST 20H          ; E7
0x0ab2 RET PO           ; E0
0x0ab3 JP M, 0x0ACC     ; FA CC 0A
0x0ab6 JP Z, 0x0AF6     ; CA F6 0A
0x0ab9 CALL 0x09BF      ; CD BF 09
0x0abc CALL 0x0AEF      ; CD EF 0A
0x0abf LD A, B          ; 78
0x0ac0 OR A             ; B7
0x0ac1 RET Z            ; C8
0x0ac2 CALL 0x09DF      ; CD DF 09
0x0ac5 LD HL, 0x4120    ; 21 20 41
0x0ac8 LD B, (HL)       ; 46
0x0ac9 JP 0x0796        ; C3 96 07

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CHGIS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0acc LD HL, (0x4121)  ; 2A 21 41
0x0acf CALL 0x0AEF      ; CD EF 0A
0x0ad2 LD A, H          ; 7C
0x0ad3 LD D, L          ; 55
0x0ad4 LD E, 0x00       ; 1E 00
0x0ad6 LD B, 0x90       ; 06 90
0x0ad8 JP 0x0969        ; C3 69 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSADP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0adb RST 20H          ; E7
0x0adc RET NC           ; D0
0x0add JP Z, 0x0AF6     ; CA F6 0A
0x0ae0 CALL M, 0x0ACC   ; FC CC 0A
0x0ae3 LD HL, 0x0000    ; 21 00 00
0x0ae6 LD (0x411D), HL  ; 22 1D 41
0x0ae9 LD (0x411F), HL  ; 22 1F 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FLAGDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0aec LD A, 0x08       ; 3E 08
0x0aee LD BC, 0x043E    ; 01 3E 04

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FLAGSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0aef LD A, 0x04       ; 3E 04
0x0af1 JP 0x0A9F        ; C3 9F 0A

0x0af4 RST 20H          ; E7
0x0af5 RET Z            ; C8
0x0af6 LD E, 0x18       ; 1E 18
0x0af8 JP 0x19A2        ; C3 A2 19

0x0afb LD B, A          ; 47
0x0afc LD C, A          ; 4F
0x0afd LD D, A          ; 57
0x0afe LD E, A          ; 5F
0x0aff OR A             ; B7
0x0b00 RET Z            ; C8
0x0b01 PUSH HL          ; E5
0x0b02 CALL 0x09BF      ; CD BF 09
0x0b05 CALL 0x09DF      ; CD DF 09
0x0b08 XOR (HL)         ; AE
0x0b09 LD H, A          ; 67
0x0b0a CALL M, 0x0B1F   ; FC 1F 0B
0x0b0d LD A, 0x98       ; 3E 98
0x0b0f SUB B            ; 90
0x0b10 CALL 0x07D7      ; CD D7 07
0x0b13 LD A, H          ; 7C
0x0b14 RLA              ; 17
0x0b15 CALL C, 0x07A8   ; DC A8 07
0x0b18 LD B, 0x00       ; 06 00
0x0b1a CALL C, 0x07C3   ; DC C3 07
0x0b1d POP HL           ; E1
0x0b1e RET              ; C9

0x0b1f DEC DE           ; 1B
0x0b20 LD A, D          ; 7A
0x0b21 AND E            ; A3
0x0b22 INC A            ; 3C
0x0b23 RET NZ           ; C0
0x0b24 DEC BC           ; 0B
0x0b25 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FIX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0b26 RST 20H          ; E7
0x0b27 RET M            ; F8
0x0b28 CALL 0x0955      ; CD 55 09
0x0b2b JP P, 0x0B37     ; F2 37 0B
0x0b2e CALL 0x0982      ; CD 82 09
0x0b31 CALL 0x0B37      ; CD 37 0B
0x0b34 JP 0x097B        ; C3 7B 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0b37 RST 20H          ; E7
0x0b38 RET M            ; F8
0x0b39 JR NC, 0x20      ; 30 1E
0x0b3b JR Z, -0x45      ; 28 B9
0x0b3d CALL 0x0A8E      ; CD 8E 0A
0x0b40 LD HL, 0x4124    ; 21 24 41
0x0b43 LD A, (HL)       ; 7E
0x0b44 CP N             ; FE 98
0x0b46 LD A, (0x4121)   ; 3A 21 41
0x0b49 RET NC           ; D0
0x0b4a LD A, (HL)       ; 7E
0x0b4b CALL 0x0AFB      ; CD FB 0A
0x0b4e LD (HL), 0x98    ; 36 98
0x0b50 LD A, E          ; 7B
0x0b51 PUSH AF          ; F5
0x0b52 LD A, C          ; 79
0x0b53 RLA              ; 17
0x0b54 CALL 0x0762      ; CD 62 07
0x0b57 POP AF           ; F1
0x0b58 RET              ; C9

0x0b59 LD HL, 0x4124    ; 21 24 41
0x0b5c LD A, (HL)       ; 7E
0x0b5d CP N             ; FE 90
0x0b5f JP C, 0x0A7F     ; DA 7F 0A
0x0b62 JR NZ, 0x16      ; 20 14
0x0b64 LD C, A          ; 4F
0x0b65 DEC HL           ; 2B
0x0b66 LD A, (HL)       ; 7E
0x0b67 XOR N            ; EE 80
0x0b69 LD B, 0x06       ; 06 06
0x0b6b DEC HL           ; 2B
0x0b6c OR (HL)          ; B6
0x0b6d DEC B            ; 05
0x0b6e JR NZ, -0x03     ; 20 FB
0x0b70 OR A             ; B7
0x0b71 LD HL, 0x8000    ; 21 00 80
0x0b74 JP Z, 0x0A9A     ; CA 9A 0A
0x0b77 LD A, C          ; 79
0x0b78 CP N             ; FE B8
0x0b7a RET NC           ; D0
0x0b7b PUSH AF          ; F5
0x0b7c CALL 0x09BF      ; CD BF 09
0x0b7f CALL 0x09DF      ; CD DF 09
0x0b82 XOR (HL)         ; AE
0x0b83 DEC HL           ; 2B
0x0b84 LD (HL), 0xB8    ; 36 B8
0x0b86 PUSH AF          ; F5
0x0b87 CALL M, 0x0BA0   ; FC A0 0B
0x0b8a LD HL, 0x4123    ; 21 23 41
0x0b8d LD A, 0xB8       ; 3E B8
0x0b8f SUB B            ; 90
0x0b90 CALL 0x0D69      ; CD 69 0D
0x0b93 POP AF           ; F1
0x0b94 CALL M, 0x0D20   ; FC 20 0D
0x0b97 XOR A            ; AF
0x0b98 LD (0x411C), A   ; 32 1C 41
0x0b9b POP AF           ; F1
0x0b9c RET NC           ; D0
0x0b9d JP 0x0CD8        ; C3 D8 0C

0x0ba0 LD HL, 0x411D    ; 21 1D 41
0x0ba3 LD A, (HL)       ; 7E
0x0ba4 DEC (HL)         ; 35
0x0ba5 OR A             ; B7
0x0ba6 INC HL           ; 23
0x0ba7 JR Z, -0x04      ; 28 FA
0x0ba9 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SUBINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0bc7 LD A, H          ; 7C
0x0bc8 RLA              ; 17
0x0bc9 SBC A            ; 9F
0x0bca LD B, A          ; 47
0x0bcb CALL 0x0C51      ; CD 51 0C
0x0bce LD A, C          ; 79
0x0bcf SBC B            ; 98
0x0bd0 JR 0x05          ; 18 03

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ADDINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0bd2 LD A, H          ; 7C
0x0bd3 RLA              ; 17
0x0bd4 SBC A            ; 9F
0x0bd5 LD B, A          ; 47
0x0bd6 PUSH HL          ; E5
0x0bd7 LD A, D          ; 7A
0x0bd8 RLA              ; 17
0x0bd9 SBC A            ; 9F
0x0bda ADD HL, DE       ; 19
0x0bdb ADC A, B         ; 88
0x0bdc RRCA             ; 0F
0x0bdd XOR H            ; AC
0x0bde JP P, 0x0A99     ; F2 99 0A
0x0be1 PUSH BC          ; C5
0x0be2 EX DE, HL        ; EB
0x0be3 CALL 0x0ACF      ; CD CF 0A
0x0be6 POP AF           ; F1
0x0be7 POP HL           ; E1
0x0be8 CALL 0x09A4      ; CD A4 09
0x0beb EX DE, HL        ; EB
0x0bec CALL 0x0C6B      ; CD 6B 0C
0x0bef JP 0x0F8F        ; C3 8F 0F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MLTINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0bf2 LD A, H          ; 7C
0x0bf3 OR L             ; B5
0x0bf4 JP Z, 0x0A9A     ; CA 9A 0A
0x0bf7 PUSH HL          ; E5
0x0bf8 PUSH DE          ; D5
0x0bf9 CALL 0x0C45      ; CD 45 0C
0x0bfc PUSH BC          ; C5
0x0bfd LD B, H          ; 44
0x0bfe LD C, L          ; 4D
0x0bff LD HL, 0x0000    ; 21 00 00
0x0c02 LD A, 0x10       ; 3E 10
0x0c04 ADD HL, HL       ; 29
0x0c05 JR C, 0x21       ; 38 1F
0x0c07 EX DE, HL        ; EB
0x0c08 ADD HL, HL       ; 29
0x0c09 EX DE, HL        ; EB
0x0c0a JR NC, 0x06      ; 30 04
0x0c0c ADD HL, BC       ; 09
0x0c0d JP C, 0x0C26     ; DA 26 0C
0x0c10 DEC A            ; 3D
0x0c11 JR NZ, -0x0D     ; 20 F1
0x0c13 POP BC           ; C1
0x0c14 POP DE           ; D1
0x0c15 LD A, H          ; 7C
0x0c16 OR A             ; B7
0x0c17 JP M, 0x0C1F     ; FA 1F 0C
0x0c1a POP DE           ; D1
0x0c1b LD A, B          ; 78
0x0c1c JP 0x0C4D        ; C3 4D 0C

0x0c1f XOR N            ; EE 80
0x0c21 OR L             ; B5
0x0c22 JR Z, 0x15       ; 28 13
0x0c24 EX DE, HL        ; EB
0x0c25 LD BC, 0xE1C1    ; 01 C1 E1
0x0c26 POP BC           ; C1
0x0c27 POP HL           ; E1
0x0c28 CALL 0x0ACF      ; CD CF 0A
0x0c2b POP HL           ; E1
0x0c2c CALL 0x09A4      ; CD A4 09
0x0c2f CALL 0x0ACF      ; CD CF 0A
0x0c32 POP BC           ; C1
0x0c33 POP DE           ; D1
0x0c34 JP 0x0847        ; C3 47 08

0x0c37 LD A, B          ; 78
0x0c38 OR A             ; B7
0x0c39 POP BC           ; C1
0x0c3a JP M, 0x0A9A     ; FA 9A 0A
0x0c3d PUSH DE          ; D5
0x0c3e CALL 0x0ACF      ; CD CF 0A
0x0c41 POP DE           ; D1
0x0c42 JP 0x0982        ; C3 82 09

0x0c45 LD A, H          ; 7C
0x0c46 XOR D            ; AA
0x0c47 LD B, A          ; 47
0x0c48 CALL 0x0C4C      ; CD 4C 0C
0x0c4b EX DE, HL        ; EB
0x0c4c LD A, H          ; 7C
0x0c4d OR A             ; B7
0x0c4e JP P, 0x0A9A     ; F2 9A 0A
0x0c51 XOR A            ; AF
0x0c52 LD C, A          ; 4F
0x0c53 SUB L            ; 95
0x0c54 LD L, A          ; 6F
0x0c55 LD A, C          ; 79
0x0c56 SBC H            ; 9C
0x0c57 LD H, A          ; 67
0x0c58 JP 0x0A9A        ; C3 9A 0A

0x0c5b LD HL, (0x4121)  ; 2A 21 41
0x0c5e CALL 0x0C51      ; CD 51 0C
0x0c61 LD A, H          ; 7C
0x0c62 XOR N            ; EE 80
0x0c64 OR L             ; B5
0x0c65 RET NZ           ; C0
0x0c66 EX DE, HL        ; EB
0x0c67 CALL 0x0AEF      ; CD EF 0A
0x0c6a XOR A            ; AF
0x0c6b LD B, 0x98       ; 06 98
0x0c6d JP 0x0969        ; C3 69 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SUBDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0c70 LD HL, 0x412D    ; 21 2D 41
0x0c73 LD A, (HL)       ; 7E
0x0c74 XOR N            ; EE 80
0x0c76 LD (HL), A       ; 77

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ADDDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0c77 LD HL, 0x412E    ; 21 2E 41
0x0c7a LD A, (HL)       ; 7E
0x0c7b OR A             ; B7
0x0c7c RET Z            ; C8
0x0c7d LD B, A          ; 47
0x0c7e DEC HL           ; 2B
0x0c7f LD C, (HL)       ; 4E
0x0c80 LD DE, 0x4124    ; 11 24 41
0x0c83 LD A, (DE)       ; 1A
0x0c84 OR A             ; B7
0x0c85 JP Z, 0x09F4     ; CA F4 09
0x0c88 SUB B            ; 90
0x0c89 JR NC, 0x18      ; 30 16
0x0c8b CPL              ; 2F
0x0c8c INC A            ; 3C
0x0c8d PUSH AF          ; F5
0x0c8e LD C, 0x08       ; 0E 08
0x0c90 INC HL           ; 23
0x0c91 PUSH HL          ; E5
0x0c92 LD A, (DE)       ; 1A
0x0c93 LD B, (HL)       ; 46
0x0c94 LD (HL), A       ; 77
0x0c95 LD A, B          ; 78
0x0c96 LD (DE), A       ; 12
0x0c97 DEC DE           ; 1B
0x0c98 DEC HL           ; 2B
0x0c99 DEC C            ; 0D
0x0c9a JR NZ, -0x08     ; 20 F6
0x0c9c POP HL           ; E1
0x0c9d LD B, (HL)       ; 46
0x0c9e DEC HL           ; 2B
0x0c9f LD C, (HL)       ; 4E
0x0ca0 POP AF           ; F1
0x0ca1 CP N             ; FE 39
0x0ca3 RET NC           ; D0
0x0ca4 PUSH AF          ; F5
0x0ca5 CALL 0x09DF      ; CD DF 09
0x0ca8 INC HL           ; 23
0x0ca9 LD (HL), 0x00    ; 36 00
0x0cab LD B, A          ; 47
0x0cac POP AF           ; F1
0x0cad LD HL, 0x412D    ; 21 2D 41
0x0cb0 CALL 0x0D69      ; CD 69 0D
0x0cb3 LD A, (0x4126)   ; 3A 26 41
0x0cb6 LD (0x411C), A   ; 32 1C 41
0x0cb9 LD A, B          ; 78
0x0cba OR A             ; B7
0x0cbb JP P, 0x0CCF     ; F2 CF 0C
0x0cbe CALL 0x0D33      ; CD 33 0D
0x0cc1 JP NC, 0x0D0E    ; D2 0E 0D
0x0cc4 EX DE, HL        ; EB
0x0cc5 INC (HL)         ; 34
0x0cc6 JP Z, 0x07B2     ; CA B2 07
0x0cc9 CALL 0x0D90      ; CD 90 0D
0x0ccc JP 0x0D0E        ; C3 0E 0D

0x0ccf CALL 0x0D45      ; CD 45 0D
0x0cd2 LD HL, 0x4125    ; 21 25 41
0x0cd5 CALL C, 0x0D57   ; DC 57 0D
0x0cd8 XOR A            ; AF
0x0cd9 LD B, A          ; 47
0x0cda LD A, (0x4123)   ; 3A 23 41
0x0cdd OR A             ; B7
0x0cde JR NZ, 0x20      ; 20 1E
0x0ce0 LD HL, 0x411C    ; 21 1C 41
0x0ce3 LD C, 0x08       ; 0E 08
0x0ce5 LD D, (HL)       ; 56
0x0ce6 LD (HL), A       ; 77
0x0ce7 LD A, D          ; 7A
0x0ce8 INC HL           ; 23
0x0ce9 DEC C            ; 0D
0x0cea JR NZ, -0x05     ; 20 F9
0x0cec LD A, B          ; 78
0x0ced SUB N            ; D6 08
0x0cef CP N             ; FE C0
0x0cf1 JR NZ, -0x18     ; 20 E6
0x0cf3 JP 0x0778        ; C3 78 07

0x0cf6 DEC B            ; 05
0x0cf7 LD HL, 0x411C    ; 21 1C 41
0x0cfa CALL 0x0D97      ; CD 97 0D
0x0cfd OR A             ; B7
0x0cfe JP P, 0x0CF6     ; F2 F6 0C
0x0d01 LD A, B          ; 78
0x0d02 OR A             ; B7
0x0d03 JR Z, 0x0B       ; 28 09
0x0d05 LD HL, 0x4124    ; 21 24 41
0x0d08 ADD A, (HL)      ; 86
0x0d09 LD (HL), A       ; 77
0x0d0a JP NC, 0x0778    ; D2 78 07
0x0d0d RET Z            ; C8
0x0d0e LD A, (0x411C)   ; 3A 1C 41
0x0d11 OR A             ; B7
0x0d12 CALL M, 0x0D20   ; FC 20 0D
0x0d15 LD HL, 0x4125    ; 21 25 41
0x0d18 LD A, (HL)       ; 7E
0x0d19 AND N            ; E6 80
0x0d1b DEC HL           ; 2B
0x0d1c DEC HL           ; 2B
0x0d1d XOR (HL)         ; AE
0x0d1e LD (HL), A       ; 77
0x0d1f RET              ; C9

0x0d20 LD HL, 0x411D    ; 21 1D 41
0x0d23 LD B, 0x07       ; 06 07
0x0d25 INC (HL)         ; 34
0x0d26 RET NZ           ; C0
0x0d27 INC HL           ; 23
0x0d28 DEC B            ; 05
0x0d29 JR NZ, -0x04     ; 20 FA
0x0d2b INC (HL)         ; 34
0x0d2c JP Z, 0x07B2     ; CA B2 07
0x0d2f DEC HL           ; 2B
0x0d30 LD (HL), 0x80    ; 36 80
0x0d32 RET              ; C9

0x0d33 LD HL, 0x4127    ; 21 27 41
0x0d36 LD DE, 0x411D    ; 11 1D 41
0x0d39 LD C, 0x07       ; 0E 07
0x0d3b XOR A            ; AF
0x0d3c LD A, (DE)       ; 1A
0x0d3d ADC A, (HL)      ; 8E
0x0d3e LD (DE), A       ; 12
0x0d3f INC DE           ; 13
0x0d40 INC HL           ; 23
0x0d41 DEC C            ; 0D
0x0d42 JR NZ, -0x06     ; 20 F8
0x0d44 RET              ; C9

0x0d45 LD HL, 0x4127    ; 21 27 41
0x0d48 LD DE, 0x411D    ; 11 1D 41
0x0d4b LD C, 0x07       ; 0E 07
0x0d4d XOR A            ; AF
0x0d4e LD A, (DE)       ; 1A
0x0d4f SBC (HL)         ; 9E
0x0d50 LD (DE), A       ; 12
0x0d51 INC DE           ; 13
0x0d52 INC HL           ; 23
0x0d53 DEC C            ; 0D
0x0d54 JR NZ, -0x06     ; 20 F8
0x0d56 RET              ; C9

0x0d57 LD A, (HL)       ; 7E
0x0d58 CPL              ; 2F
0x0d59 LD (HL), A       ; 77
0x0d5a LD HL, 0x411C    ; 21 1C 41
0x0d5d LD B, 0x08       ; 06 08
0x0d5f XOR A            ; AF
0x0d60 LD C, A          ; 4F
0x0d61 LD A, C          ; 79
0x0d62 SBC (HL)         ; 9E
0x0d63 LD (HL), A       ; 77
0x0d64 INC HL           ; 23
0x0d65 DEC B            ; 05
0x0d66 JR NZ, -0x05     ; 20 F9
0x0d68 RET              ; C9

0x0d69 LD (HL), C       ; 71
0x0d6a PUSH HL          ; E5
0x0d6b SUB N            ; D6 08
0x0d6d JR C, 0x10       ; 38 0E
0x0d6f POP HL           ; E1
0x0d70 PUSH HL          ; E5
0x0d71 LD DE, 0x0800    ; 11 00 08
0x0d74 LD C, (HL)       ; 4E
0x0d75 LD (HL), E       ; 73
0x0d76 LD E, C          ; 59
0x0d77 DEC HL           ; 2B
0x0d78 DEC D            ; 15
0x0d79 JR NZ, -0x05     ; 20 F9
0x0d7b JR -0x10         ; 18 EE

0x0d7d ADD A, 0x09      ; C6 09
0x0d7f LD D, A          ; 57
0x0d80 XOR A            ; AF
0x0d81 POP HL           ; E1
0x0d82 DEC D            ; 15
0x0d83 RET Z            ; C8
0x0d84 PUSH HL          ; E5
0x0d85 LD E, 0x08       ; 1E 08
0x0d87 LD A, (HL)       ; 7E
0x0d88 RRA              ; 1F
0x0d89 LD (HL), A       ; 77
0x0d8a DEC HL           ; 2B
0x0d8b DEC E            ; 1D
0x0d8c JR NZ, -0x05     ; 20 F9
0x0d8e JR -0x0E         ; 18 F0

0x0d90 LD HL, 0x4123    ; 21 23 41
0x0d93 LD D, 0x01       ; 16 01
0x0d95 JR -0x11         ; 18 ED

0x0d97 LD C, 0x08       ; 0E 08
0x0d99 LD A, (HL)       ; 7E
0x0d9a RLA              ; 17
0x0d9b LD (HL), A       ; 77
0x0d9c INC HL           ; 23
0x0d9d DEC C            ; 0D
0x0d9e JR NZ, -0x05     ; 20 F9
0x0da0 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MLTDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0da1 CALL 0x0955      ; CD 55 09
0x0da4 RET Z            ; C8
0x0da5 CALL 0x090A      ; CD 0A 09
0x0da8 CALL 0x0E39      ; CD 39 0E
0x0dab LD (HL), C       ; 71
0x0dac INC DE           ; 13
0x0dad LD B, 0x07       ; 06 07
0x0daf LD A, (DE)       ; 1A
0x0db0 INC DE           ; 13
0x0db1 OR A             ; B7
0x0db2 PUSH DE          ; D5
0x0db3 JR Z, 0x19       ; 28 17
0x0db5 LD C, 0x08       ; 0E 08
0x0db7 PUSH BC          ; C5
0x0db8 RRA              ; 1F
0x0db9 LD B, A          ; 47
0x0dba CALL C, 0x0D33   ; DC 33 0D
0x0dbd CALL 0x0D90      ; CD 90 0D
0x0dc0 LD A, B          ; 78
0x0dc1 POP BC           ; C1
0x0dc2 DEC C            ; 0D
0x0dc3 JR NZ, -0x0C     ; 20 F2
0x0dc5 POP DE           ; D1
0x0dc6 DEC B            ; 05
0x0dc7 JR NZ, -0x18     ; 20 E6
0x0dc9 JP 0x0CD8        ; C3 D8 0C

0x0dcc LD HL, 0x4123    ; 21 23 41
0x0dcf CALL 0x0D70      ; CD 70 0D
0x0dd2 JR -0x0D         ; 18 F1

0x0ddc LD DE, 0x0DD4    ; 11 D4 0D
0x0ddf LD HL, 0x4127    ; 21 27 41
0x0de2 CALL 0x09D3      ; CD D3 09

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DIVDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0de5 LD A, (0x412E)   ; 3A 2E 41
0x0de8 OR A             ; B7
0x0de9 JP Z, 0x199A     ; CA 9A 19
0x0dec CALL 0x0907      ; CD 07 09
0x0def INC (HL)         ; 34
0x0df0 INC (HL)         ; 34
0x0df1 CALL 0x0E39      ; CD 39 0E
0x0df4 LD HL, 0x4151    ; 21 51 41
0x0df7 LD (HL), C       ; 71
0x0df8 LD B, C          ; 41
0x0df9 LD DE, 0x414A    ; 11 4A 41
0x0dfc LD HL, 0x4127    ; 21 27 41
0x0dff CALL 0x0D4B      ; CD 4B 0D
0x0e02 LD A, (DE)       ; 1A
0x0e03 SBC C            ; 99
0x0e04 CCF              ; 3F
0x0e05 JR C, 0x0D       ; 38 0B
0x0e07 LD DE, 0x414A    ; 11 4A 41
0x0e0a LD HL, 0x4127    ; 21 27 41
0x0e0d CALL 0x0D39      ; CD 39 0D
0x0e10 XOR A            ; AF
0x0e11 JP C, 0x0412     ; DA 12 04
0x0e12 LD (DE), A       ; 12
0x0e13 INC B            ; 04
0x0e14 LD A, (0x4123)   ; 3A 23 41
0x0e17 INC A            ; 3C
0x0e18 DEC A            ; 3D
0x0e19 RRA              ; 1F
0x0e1a JP M, 0x0D11     ; FA 11 0D
0x0e1d RLA              ; 17
0x0e1e LD HL, 0x411D    ; 21 1D 41
0x0e21 LD C, 0x07       ; 0E 07
0x0e23 CALL 0x0D99      ; CD 99 0D
0x0e26 LD HL, 0x414A    ; 21 4A 41
0x0e29 CALL 0x0D97      ; CD 97 0D
0x0e2c LD A, B          ; 78
0x0e2d OR A             ; B7
0x0e2e JR NZ, -0x35     ; 20 C9
0x0e30 LD HL, 0x4124    ; 21 24 41
0x0e33 DEC (HL)         ; 35
0x0e34 JR NZ, -0x3B     ; 20 C3
0x0e36 JP 0x07B2        ; C3 B2 07

0x0e39 LD A, C          ; 79
0x0e3a LD (0x412D), A   ; 32 2D 41
0x0e3d DEC HL           ; 2B
0x0e3e LD DE, 0x4150    ; 11 50 41
0x0e41 LD BC, 0x0700    ; 01 00 07
0x0e44 LD A, (HL)       ; 7E
0x0e45 LD (DE), A       ; 12
0x0e46 LD (HL), C       ; 71
0x0e47 DEC DE           ; 1B
0x0e48 DEC HL           ; 2B
0x0e49 DEC B            ; 05
0x0e4a JR NZ, -0x06     ; 20 F8
0x0e4c RET              ; C9

0x0e4d CALL 0x09FC      ; CD FC 09
0x0e50 EX DE, HL        ; EB
0x0e51 DEC HL           ; 2B
0x0e52 LD A, (HL)       ; 7E
0x0e53 OR A             ; B7
0x0e54 RET Z            ; C8
0x0e55 ADD A, 0x02      ; C6 02
0x0e57 JP C, 0x07B2     ; DA B2 07
0x0e5a LD (HL), A       ; 77
0x0e5b PUSH HL          ; E5
0x0e5c CALL 0x0C77      ; CD 77 0C
0x0e5f POP HL           ; E1
0x0e60 INC (HL)         ; 34
0x0e61 RET NZ           ; C0
0x0e62 JP 0x07B2        ; C3 B2 07

0x0e65 CALL 0x0778      ; CD 78 07
0x0e68 CALL 0x0AEC      ; CD EC 0A
0x0e6b OR N             ; F6 AF
0x0e6c XOR A            ; AF
0x0e6d EX DE, HL        ; EB
0x0e6e LD BC, 0x00FF    ; 01 FF 00
0x0e71 LD H, B          ; 60
0x0e72 LD L, B          ; 68
0x0e73 CALL Z, 0x0A9A   ; CC 9A 0A
0x0e76 EX DE, HL        ; EB
0x0e77 LD A, (HL)       ; 7E
0x0e78 CP N             ; FE 2D
0x0e7a PUSH AF          ; F5
0x0e7b JP Z, 0x0E83     ; CA 83 0E
0x0e7e CP N             ; FE 2B
0x0e80 JR Z, 0x03       ; 28 01
0x0e82 DEC HL           ; 2B
0x0e83 RST 10H          ; D7
0x0e84 JP C, 0x0F29     ; DA 29 0F
0x0e87 CP N             ; FE 2E
0x0e89 JP Z, 0x0EE4     ; CA E4 0E
0x0e8c CP N             ; FE 45
0x0e8e JR Z, 0x16       ; 28 14
0x0e90 CP N             ; FE 25
0x0e92 JP Z, 0x0EEE     ; CA EE 0E
0x0e95 CP N             ; FE 23
0x0e97 JP Z, 0x0EF5     ; CA F5 0E
0x0e9a CP N             ; FE 21
0x0e9c JP Z, 0x0EF6     ; CA F6 0E
0x0e9f CP N             ; FE 44
0x0ea1 JR NZ, 0x26      ; 20 24
0x0ea3 OR A             ; B7
0x0ea4 CALL 0x0EFB      ; CD FB 0E
0x0ea7 PUSH HL          ; E5
0x0ea8 LD HL, 0x0EBD    ; 21 BD 0E
0x0eab EX (SP), HL      ; E3
0x0eac RST 10H          ; D7
0x0ead DEC D            ; 15
0x0eae CP N             ; FE CE
0x0eb0 RET Z            ; C8
0x0eb1 CP N             ; FE 2D
0x0eb3 RET Z            ; C8
0x0eb4 INC D            ; 14
0x0eb5 CP N             ; FE CD
0x0eb7 RET Z            ; C8
0x0eb8 CP N             ; FE 2B
0x0eba RET Z            ; C8
0x0ebb DEC HL           ; 2B
0x0ebc POP AF           ; F1
0x0ebd RST 10H          ; D7
0x0ebe JP C, 0x0F94     ; DA 94 0F
0x0ec1 INC D            ; 14
0x0ec2 JR NZ, 0x05      ; 20 03
0x0ec4 XOR A            ; AF
0x0ec5 SUB E            ; 93
0x0ec6 LD E, A          ; 5F
0x0ec7 PUSH HL          ; E5
0x0ec8 LD A, E          ; 7B
0x0ec9 SUB B            ; 90
0x0eca CALL P, 0x0F0A   ; F4 0A 0F
0x0ecd CALL M, 0x0F18   ; FC 18 0F
0x0ed0 JR NZ, -0x06     ; 20 F8
0x0ed2 POP HL           ; E1
0x0ed3 POP AF           ; F1
0x0ed4 PUSH HL          ; E5
0x0ed5 CALL Z, 0x097B   ; CC 7B 09
0x0ed8 POP HL           ; E1
0x0ed9 RST 20H          ; E7
0x0eda RET PE           ; E8
0x0edb PUSH HL          ; E5
0x0edc LD HL, 0x0890    ; 21 90 08
0x0edf PUSH HL          ; E5
0x0ee0 CALL 0x0AA3      ; CD A3 0A
0x0ee3 RET              ; C9

0x0ee4 RST 20H          ; E7
0x0ee5 INC C            ; 0C
0x0ee6 JR NZ, -0x1F     ; 20 DF
0x0ee8 CALL C, 0x0EFB   ; DC FB 0E
0x0eeb JP 0x0E83        ; C3 83 0E

0x0eee RST 20H          ; E7
0x0eef JP P, 0x1997     ; F2 97 19
0x0ef2 INC HL           ; 23
0x0ef3 JR -0x2C         ; 18 D2

0x0ef5 OR A             ; B7
0x0ef6 CALL 0x0EFB      ; CD FB 0E
0x0ef9 JR -0x07         ; 18 F7

0x0efb PUSH HL          ; E5
0x0efc PUSH DE          ; D5
0x0efd PUSH BC          ; C5
0x0efe PUSH AF          ; F5
0x0eff CALL Z, 0x0AB1   ; CC B1 0A
0x0f02 POP AF           ; F1
0x0f03 CALL NZ, 0x0ADB  ; C4 DB 0A
0x0f06 POP BC           ; C1
0x0f07 POP DE           ; D1
0x0f08 POP HL           ; E1
0x0f09 RET              ; C9

0x0f0a RET Z            ; C8
0x0f0b PUSH AF          ; F5
0x0f0c RST 20H          ; E7
0x0f0d PUSH AF          ; F5
0x0f0e CALL PO, 0x093E  ; E4 3E 09
0x0f11 POP AF           ; F1
0x0f12 CALL PE, 0x0E4D  ; EC 4D 0E
0x0f15 POP AF           ; F1
0x0f16 DEC A            ; 3D
0x0f17 RET              ; C9

0x0f18 PUSH DE          ; D5
0x0f19 PUSH HL          ; E5
0x0f1a PUSH AF          ; F5
0x0f1b RST 20H          ; E7
0x0f1c PUSH AF          ; F5
0x0f1d CALL PO, 0x0897  ; E4 97 08
0x0f20 POP AF           ; F1
0x0f21 CALL PE, 0x0DDC  ; EC DC 0D
0x0f24 POP AF           ; F1
0x0f25 POP HL           ; E1
0x0f26 POP DE           ; D1
0x0f27 INC A            ; 3C
0x0f28 RET              ; C9

0x0f29 PUSH DE          ; D5
0x0f2a LD A, B          ; 78
0x0f2b ADC A, C         ; 89
0x0f2c LD B, A          ; 47
0x0f2d PUSH BC          ; C5
0x0f2e PUSH HL          ; E5
0x0f2f LD A, (HL)       ; 7E
0x0f30 SUB N            ; D6 30
0x0f32 PUSH AF          ; F5
0x0f33 RST 20H          ; E7
0x0f34 JP P, 0x0F5D     ; F2 5D 0F
0x0f37 LD HL, (0x4121)  ; 2A 21 41
0x0f3a LD DE, 0x0CCD    ; 11 CD 0C
0x0f3d RST 18H          ; DF
0x0f3e JR NC, 0x1B      ; 30 19
0x0f40 LD D, H          ; 54
0x0f41 LD E, L          ; 5D
0x0f42 ADD HL, HL       ; 29
0x0f43 ADD HL, HL       ; 29
0x0f44 ADD HL, DE       ; 19
0x0f45 ADD HL, HL       ; 29
0x0f46 POP AF           ; F1
0x0f47 LD C, A          ; 4F
0x0f48 ADD HL, BC       ; 09
0x0f49 LD A, H          ; 7C
0x0f4a OR A             ; B7
0x0f4b JP M, 0x0F57     ; FA 57 0F
0x0f4e LD (0x4121), HL  ; 22 21 41
0x0f51 POP HL           ; E1
0x0f52 POP BC           ; C1
0x0f53 POP DE           ; D1
0x0f54 JP 0x0E83        ; C3 83 0E

0x0f57 LD A, C          ; 79
0x0f58 PUSH AF          ; F5
0x0f59 CALL 0x0ACC      ; CD CC 0A
0x0f5c SCF              ; 37
0x0f5d JR NC, 0x1A      ; 30 18
0x0f5f LD BC, 0x9474    ; 01 74 94
0x0f62 LD DE, 0x2400    ; 11 00 24
0x0f65 CALL 0x0A0C      ; CD 0C 0A
0x0f68 JP P, 0x0F74     ; F2 74 0F
0x0f6b CALL 0x093E      ; CD 3E 09
0x0f6e POP AF           ; F1
0x0f6f CALL 0x0F89      ; CD 89 0F
0x0f72 JR -0x21         ; 18 DD

0x0f74 CALL 0x0AE3      ; CD E3 0A
0x0f77 CALL 0x0E4D      ; CD 4D 0E
0x0f7a CALL 0x09FC      ; CD FC 09
0x0f7d POP AF           ; F1
0x0f7e CALL 0x0964      ; CD 64 09
0x0f81 CALL 0x0AE3      ; CD E3 0A
0x0f84 CALL 0x0C77      ; CD 77 0C
0x0f87 JR -0x36         ; 18 C8

0x0f89 CALL 0x09A4      ; CD A4 09
0x0f8c CALL 0x0964      ; CD 64 09
0x0f8f POP BC           ; C1
0x0f90 POP DE           ; D1
0x0f91 JP 0x0716        ; C3 16 07

0x0f94 LD A, E          ; 7B
0x0f95 CP N             ; FE 0A
0x0f97 JR NC, 0x0B      ; 30 09
0x0f99 RLCA             ; 07
0x0f9a RLCA             ; 07
0x0f9b ADD A, E         ; 83
0x0f9c RLCA             ; 07
0x0f9d ADD A, (HL)      ; 86
0x0f9e SUB N            ; D6 30
0x0fa0 LD E, A          ; 5F
0x0fa1 JP M, 0x321E     ; FA 1E 32
0x0fa2 LD E, 0x32       ; 1E 32
0x0fa4 JP 0x0EBD        ; C3 BD 0E

0x0fa7 PUSH HL          ; E5
0x0fa8 LD HL, 0x1924    ; 21 24 19
0x0fab CALL 0x28A7      ; CD A7 28
0x0fae POP HL           ; E1
0x0faf CALL 0x0A9A      ; CD 9A 0A
0x0fb2 XOR A            ; AF
0x0fb3 CALL 0x1034      ; CD 34 10
0x0fb6 OR (HL)          ; B6
0x0fb7 CALL 0x0FD9      ; CD D9 0F
0x0fba JP 0x28A6        ; C3 A6 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSAASC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x0fbd XOR A            ; AF
0x0fbe CALL 0x1034      ; CD 34 10
0x0fc1 AND N            ; E6 08
0x0fc3 JR Z, 0x04       ; 28 02
0x0fc5 LD (HL), 0x2B    ; 36 2B
0x0fc7 EX DE, HL        ; EB
0x0fc8 CALL 0x0994      ; CD 94 09
0x0fcb EX DE, HL        ; EB
0x0fcc JP P, 0x0FD9     ; F2 D9 0F
0x0fcf LD (HL), 0x2D    ; 36 2D
0x0fd1 PUSH BC          ; C5
0x0fd2 PUSH HL          ; E5
0x0fd3 CALL 0x097B      ; CD 7B 09
0x0fd6 POP HL           ; E1
0x0fd7 POP BC           ; C1
0x0fd8 OR H             ; B4
0x0fd9 INC HL           ; 23
0x0fda LD (HL), 0x30    ; 36 30
0x0fdc LD A, (0x40D8)   ; 3A D8 40
0x0fdf LD D, A          ; 57
0x0fe0 RLA              ; 17
0x0fe1 LD A, (0x40AF)   ; 3A AF 40
0x0fe4 JP C, 0x109A     ; DA 9A 10
0x0fe7 JP Z, 0x1092     ; CA 92 10
0x0fea CP N             ; FE 04
0x0fec JP NC, 0x103D    ; D2 3D 10
0x0fef LD BC, 0x0000    ; 01 00 00
0x0ff2 CALL 0x132F      ; CD 2F 13
0x0ff5 LD HL, 0x4130    ; 21 30 41
0x0ff8 LD B, (HL)       ; 46
0x0ff9 LD C, 0x20       ; 0E 20
0x0ffb LD A, (0x40D8)   ; 3A D8 40
0x0ffe LD E, A          ; 5F
0x0fff AND N            ; E6 20
0x1001 JR Z, 0x09       ; 28 07
0x1003 LD A, B          ; 78
0x1004 CP C             ; B9
0x1005 LD C, 0x2A       ; 0E 2A
0x1007 JR NZ, 0x03      ; 20 01
0x1009 LD B, C          ; 41
0x100a LD (HL), C       ; 71
0x100b RST 10H          ; D7
0x100c JR Z, 0x16       ; 28 14
0x100e CP N             ; FE 45
0x1010 JR Z, 0x12       ; 28 10
0x1012 CP N             ; FE 44
0x1014 JR Z, 0x0E       ; 28 0C
0x1016 CP N             ; FE 30
0x1018 JR Z, -0x0E      ; 28 F0
0x101a CP N             ; FE 2C
0x101c JR Z, -0x12      ; 28 EC
0x101e CP N             ; FE 2E
0x1020 JR NZ, 0x05      ; 20 03
0x1022 DEC HL           ; 2B
0x1023 LD (HL), 0x30    ; 36 30
0x1025 LD A, E          ; 7B
0x1026 AND N            ; E6 10
0x1028 JR Z, 0x05       ; 28 03
0x102a DEC HL           ; 2B
0x102b LD (HL), 0x24    ; 36 24
0x102d LD A, E          ; 7B
0x102e AND N            ; E6 04
0x1030 RET NZ           ; C0
0x1031 DEC HL           ; 2B
0x1032 LD (HL), B       ; 70
0x1033 RET              ; C9

0x1034 LD (0x40D8), A   ; 32 D8 40
0x1037 LD HL, 0x4130    ; 21 30 41
0x103a LD (HL), 0x20    ; 36 20
0x103c RET              ; C9

0x103d CP N             ; FE 05
0x103f PUSH HL          ; E5
0x1040 SBC A, 0x00      ; DE 00
0x1042 RLA              ; 17
0x1043 LD D, A          ; 57
0x1044 INC D            ; 14
0x1045 CALL 0x1201      ; CD 01 12
0x1048 LD BC, 0x0300    ; 01 00 03
0x104b ADD A, D         ; 82
0x104c JP M, 0x1057     ; FA 57 10
0x104f INC D            ; 14
0x1050 CP D             ; BA
0x1051 JR NC, 0x06      ; 30 04
0x1053 INC A            ; 3C
0x1054 LD B, A          ; 47
0x1055 LD A, 0x02       ; 3E 02
0x1057 SUB N            ; D6 02
0x1059 POP HL           ; E1
0x105a PUSH AF          ; F5
0x105b CALL 0x1291      ; CD 91 12
0x105e LD (HL), 0x30    ; 36 30
0x1060 CALL Z, 0x09C9   ; CC C9 09
0x1063 CALL 0x12A4      ; CD A4 12
0x1066 DEC HL           ; 2B
0x1067 LD A, (HL)       ; 7E
0x1068 CP N             ; FE 30
0x106a JR Z, -0x04      ; 28 FA
0x106c CP N             ; FE 2E
0x106e CALL NZ, 0x09C9  ; C4 C9 09
0x1071 POP AF           ; F1
0x1072 JR Z, 0x21       ; 28 1F
0x1074 PUSH AF          ; F5
0x1075 RST 20H          ; E7
0x1076 LD A, 0x22       ; 3E 22
0x1078 ADC A, A         ; 8F
0x1079 LD (HL), A       ; 77
0x107a INC HL           ; 23
0x107b POP AF           ; F1
0x107c LD (HL), 0x2B    ; 36 2B
0x107e JP P, 0x1085     ; F2 85 10
0x1081 LD (HL), 0x2D    ; 36 2D
0x1083 CPL              ; 2F
0x1084 INC A            ; 3C
0x1085 LD B, 0x2F       ; 06 2F
0x1087 INC B            ; 04
0x1088 SUB N            ; D6 0A
0x108a JR NC, -0x03     ; 30 FB
0x108c ADD A, 0x3A      ; C6 3A
0x108e INC HL           ; 23
0x108f LD (HL), B       ; 70
0x1090 INC HL           ; 23
0x1091 LD (HL), A       ; 77
0x1092 INC HL           ; 23
0x1093 LD (HL), 0x00    ; 36 00
0x1095 EX DE, HL        ; EB
0x1096 LD HL, 0x4130    ; 21 30 41
0x1099 RET              ; C9

0x109a INC HL           ; 23
0x109b PUSH BC          ; C5
0x109c CP N             ; FE 04
0x109e LD A, D          ; 7A
0x109f JP NC, 0x1109    ; D2 09 11
0x10a2 RRA              ; 1F
0x10a3 JP C, 0x11A3     ; DA A3 11
0x10a6 LD BC, 0x0603    ; 01 03 06
0x10a9 CALL 0x1289      ; CD 89 12
0x10ac POP DE           ; D1
0x10ad LD A, D          ; 7A
0x10ae SUB N            ; D6 05
0x10b0 CALL P, 0x1269   ; F4 69 12
0x10b3 CALL 0x132F      ; CD 2F 13
0x10b6 LD A, E          ; 7B
0x10b7 OR A             ; B7
0x10b8 CALL Z, 0x092F   ; CC 2F 09
0x10bb DEC A            ; 3D
0x10bc CALL P, 0x1269   ; F4 69 12
0x10bf PUSH HL          ; E5
0x10c0 CALL 0x0FF5      ; CD F5 0F
0x10c3 POP HL           ; E1
0x10c4 JR Z, 0x04       ; 28 02
0x10c6 LD (HL), B       ; 70
0x10c7 INC HL           ; 23
0x10c8 LD (HL), 0x00    ; 36 00
0x10ca LD HL, 0x412F    ; 21 2F 41
0x10cd INC HL           ; 23
0x10ce LD A, (0x40F3)   ; 3A F3 40
0x10d1 SUB L            ; 95
0x10d2 SUB D            ; 92
0x10d3 RET Z            ; C8
0x10d4 LD A, (HL)       ; 7E
0x10d5 CP N             ; FE 20
0x10d7 JR Z, -0x0A      ; 28 F4
0x10d9 CP N             ; FE 2A
0x10db JR Z, -0x0E      ; 28 F0
0x10dd DEC HL           ; 2B
0x10de PUSH HL          ; E5
0x10df PUSH AF          ; F5
0x10e0 LD BC, 0x10DF    ; 01 DF 10
0x10e3 PUSH BC          ; C5
0x10e4 RST 10H          ; D7
0x10e5 CP N             ; FE 2D
0x10e7 RET Z            ; C8
0x10e8 CP N             ; FE 2B
0x10ea RET Z            ; C8
0x10eb CP N             ; FE 24
0x10ed RET Z            ; C8
0x10ee POP BC           ; C1
0x10ef CP N             ; FE 30
0x10f1 JR NZ, 0x11      ; 20 0F
0x10f3 INC HL           ; 23
0x10f4 RST 10H          ; D7
0x10f5 JR NC, 0x0D      ; 30 0B
0x10f7 DEC HL           ; 2B
0x10f8 LD BC, 0x772B    ; 01 2B 77
0x10f9 DEC HL           ; 2B
0x10fa LD (HL), A       ; 77
0x10fb POP AF           ; F1
0x10fc JR Z, -0x03      ; 28 FB
0x10fe POP BC           ; C1
0x10ff JP 0x10CE        ; C3 CE 10

0x1102 POP AF           ; F1
0x1103 JR Z, -0x01      ; 28 FD
0x1105 POP HL           ; E1
0x1106 LD (HL), 0x25    ; 36 25
0x1108 RET              ; C9

0x1109 PUSH HL          ; E5
0x110a RRA              ; 1F
0x110b JP C, 0x11AA     ; DA AA 11
0x110e JR Z, 0x16       ; 28 14
0x1110 LD DE, 0x1384    ; 11 84 13
0x1113 CALL 0x0A49      ; CD 49 0A
0x1116 LD D, 0x10       ; 16 10
0x1118 JP M, 0x1132     ; FA 32 11
0x111b POP HL           ; E1
0x111c POP BC           ; C1
0x111d CALL 0x0FBD      ; CD BD 0F
0x1120 DEC HL           ; 2B
0x1121 LD (HL), 0x25    ; 36 25
0x1123 RET              ; C9

0x1124 LD BC, 0xB60E    ; 01 0E B6
0x1127 LD DE, 0x1BCA    ; 11 CA 1B
0x112a CALL 0x0A0C      ; CD 0C 0A
0x112d JP P, 0x111B     ; F2 1B 11
0x1130 LD D, 0x06       ; 16 06
0x1132 CALL 0x0955      ; CD 55 09
0x1135 CALL NZ, 0x1201  ; C4 01 12
0x1138 POP HL           ; E1
0x1139 POP BC           ; C1
0x113a JP M, 0x1157     ; FA 57 11
0x113d PUSH BC          ; C5
0x113e LD E, A          ; 5F
0x113f LD A, B          ; 78
0x1140 SUB D            ; 92
0x1141 SUB E            ; 93
0x1142 CALL P, 0x1269   ; F4 69 12
0x1145 CALL 0x127D      ; CD 7D 12
0x1148 CALL 0x12A4      ; CD A4 12
0x114b OR E             ; B3
0x114c CALL NZ, 0x1277  ; C4 77 12
0x114f OR E             ; B3
0x1150 CALL NZ, 0x1291  ; C4 91 12
0x1153 POP DE           ; D1
0x1154 JP 0x10B6        ; C3 B6 10

0x1157 LD E, A          ; 5F
0x1158 LD A, C          ; 79
0x1159 OR A             ; B7
0x115a CALL NZ, 0x0F16  ; C4 16 0F
0x115d ADD A, E         ; 83
0x115e JP M, 0x1162     ; FA 62 11
0x1161 XOR A            ; AF
0x1162 PUSH BC          ; C5
0x1163 PUSH AF          ; F5
0x1164 CALL M, 0x0F18   ; FC 18 0F
0x1167 JP M, 0x1164     ; FA 64 11
0x116a POP BC           ; C1
0x116b LD A, E          ; 7B
0x116c SUB B            ; 90
0x116d POP BC           ; C1
0x116e LD E, A          ; 5F
0x116f ADD A, D         ; 82
0x1170 LD A, B          ; 78
0x1171 JP M, 0x117F     ; FA 7F 11
0x1174 SUB D            ; 92
0x1175 SUB E            ; 93
0x1176 CALL P, 0x1269   ; F4 69 12
0x1179 PUSH BC          ; C5
0x117a CALL 0x127D      ; CD 7D 12
0x117d JR 0x13          ; 18 11

0x117f CALL 0x1269      ; CD 69 12
0x1182 LD A, C          ; 79
0x1183 CALL 0x1294      ; CD 94 12
0x1186 LD C, A          ; 4F
0x1187 XOR A            ; AF
0x1188 SUB D            ; 92
0x1189 SUB E            ; 93
0x118a CALL 0x1269      ; CD 69 12
0x118d PUSH BC          ; C5
0x118e LD B, A          ; 47
0x118f LD C, A          ; 4F
0x1190 CALL 0x12A4      ; CD A4 12
0x1193 POP BC           ; C1
0x1194 OR C             ; B1
0x1195 JR NZ, 0x05      ; 20 03
0x1197 LD HL, (0x40F3)  ; 2A F3 40
0x119a ADD A, E         ; 83
0x119b DEC A            ; 3D
0x119c CALL P, 0x1269   ; F4 69 12
0x119f LD D, B          ; 50
0x11a0 JP 0x10BF        ; C3 BF 10

0x11a3 PUSH HL          ; E5
0x11a4 PUSH DE          ; D5
0x11a5 CALL 0x0ACC      ; CD CC 0A
0x11a8 POP DE           ; D1
0x11a9 XOR A            ; AF
0x11aa JP Z, 0x11B0     ; CA B0 11
0x11ad LD E, 0x10       ; 1E 10
0x11af LD BC, 0x061E    ; 01 1E 06
0x11b0 LD E, 0x06       ; 1E 06
0x11b2 CALL 0x0955      ; CD 55 09
0x11b5 SCF              ; 37
0x11b6 CALL NZ, 0x1201  ; C4 01 12
0x11b9 POP HL           ; E1
0x11ba POP BC           ; C1
0x11bb PUSH AF          ; F5
0x11bc LD A, C          ; 79
0x11bd OR A             ; B7
0x11be PUSH AF          ; F5
0x11bf CALL NZ, 0x0F16  ; C4 16 0F
0x11c2 ADD A, B         ; 80
0x11c3 LD C, A          ; 4F
0x11c4 LD A, D          ; 7A
0x11c5 AND N            ; E6 04
0x11c7 CP N             ; FE 01
0x11c9 SBC A            ; 9F
0x11ca LD D, A          ; 57
0x11cb ADD A, C         ; 81
0x11cc LD C, A          ; 4F
0x11cd SUB E            ; 93
0x11ce PUSH AF          ; F5
0x11cf PUSH BC          ; C5
0x11d0 CALL M, 0x0F18   ; FC 18 0F
0x11d3 JP M, 0x11D0     ; FA D0 11
0x11d6 POP BC           ; C1
0x11d7 POP AF           ; F1
0x11d8 PUSH BC          ; C5
0x11d9 PUSH AF          ; F5
0x11da JP M, 0x11DE     ; FA DE 11
0x11dd XOR A            ; AF
0x11de CPL              ; 2F
0x11df INC A            ; 3C
0x11e0 ADD A, B         ; 80
0x11e1 INC A            ; 3C
0x11e2 ADD A, D         ; 82
0x11e3 LD B, A          ; 47
0x11e4 LD C, 0x00       ; 0E 00
0x11e6 CALL 0x12A4      ; CD A4 12
0x11e9 POP AF           ; F1
0x11ea CALL P, 0x1271   ; F4 71 12
0x11ed POP BC           ; C1
0x11ee POP AF           ; F1
0x11ef CALL Z, 0x092F   ; CC 2F 09
0x11f2 POP AF           ; F1
0x11f3 JR C, 0x05       ; 38 03
0x11f5 ADD A, E         ; 83
0x11f6 SUB B            ; 90
0x11f7 SUB D            ; 92
0x11f8 PUSH BC          ; C5
0x11f9 CALL 0x1074      ; CD 74 10
0x11fc EX DE, HL        ; EB
0x11fd POP DE           ; D1
0x11fe JP 0x10BF        ; C3 BF 10

0x1201 PUSH DE          ; D5
0x1202 XOR A            ; AF
0x1203 PUSH AF          ; F5
0x1204 RST 20H          ; E7
0x1205 JP PO, 0x1222    ; E2 22 12
0x1208 LD A, (0x4124)   ; 3A 24 41
0x120b CP N             ; FE 91
0x120d JP NC, 0x1222    ; D2 22 12
0x1210 LD DE, 0x1364    ; 11 64 13
0x1213 LD HL, 0x4127    ; 21 27 41
0x1216 CALL 0x09D3      ; CD D3 09
0x1219 CALL 0x0DA1      ; CD A1 0D
0x121c POP AF           ; F1
0x121d SUB N            ; D6 0A
0x121f PUSH AF          ; F5
0x1220 JR -0x18         ; 18 E6

0x1222 CALL 0x124F      ; CD 4F 12
0x1225 RST 20H          ; E7
0x1226 JR NC, 0x0D      ; 30 0B
0x1228 LD BC, 0x9143    ; 01 43 91
0x122b LD DE, 0x4FF9    ; 11 F9 4F
0x122e CALL 0x0A0C      ; CD 0C 0A
0x1231 JR 0x08          ; 18 06

0x1233 LD DE, 0x136C    ; 11 6C 13
0x1236 CALL 0x0A49      ; CD 49 0A
0x1239 JP P, 0x124B     ; F2 4B 12
0x123c POP AF           ; F1
0x123d CALL 0x0F0B      ; CD 0B 0F
0x1240 PUSH AF          ; F5
0x1241 JR -0x1C         ; 18 E2

0x1243 POP AF           ; F1
0x1244 CALL 0x0F18      ; CD 18 0F
0x1247 PUSH AF          ; F5
0x1248 CALL 0x124F      ; CD 4F 12
0x124b POP AF           ; F1
0x124c POP DE           ; D1
0x124d OR A             ; B7
0x124e RET              ; C9

0x124f RST 20H          ; E7
0x1250 JP PE, 0x125E    ; EA 5E 12
0x1253 LD BC, 0x9474    ; 01 74 94
0x1256 LD DE, 0x23F8    ; 11 F8 23
0x1259 CALL 0x0A0C      ; CD 0C 0A
0x125c JR 0x08          ; 18 06

0x125e LD DE, 0x1374    ; 11 74 13
0x1261 CALL 0x0A49      ; CD 49 0A
0x1264 POP HL           ; E1
0x1265 JP P, 0x1243     ; F2 43 12
0x1268 JP (HL)          ; E9
0x1269 OR A             ; B7
0x126a RET Z            ; C8
0x126b DEC A            ; 3D
0x126c LD (HL), 0x30    ; 36 30
0x126e INC HL           ; 23
0x126f JR -0x05         ; 18 F9

0x1271 JR NZ, 0x06      ; 20 04
0x1273 RET Z            ; C8
0x1274 CALL 0x1291      ; CD 91 12
0x1277 LD (HL), 0x30    ; 36 30
0x1279 INC HL           ; 23
0x127a DEC A            ; 3D
0x127b JR -0x08         ; 18 F6

0x127d LD A, E          ; 7B
0x127e ADD A, D         ; 82
0x127f INC A            ; 3C
0x1280 LD B, A          ; 47
0x1281 INC A            ; 3C
0x1282 SUB N            ; D6 03
0x1284 JR NC, -0x02     ; 30 FC
0x1286 ADD A, 0x05      ; C6 05
0x1288 LD C, A          ; 4F
0x1289 LD A, (0x40D8)   ; 3A D8 40
0x128c AND N            ; E6 40
0x128e RET NZ           ; C0
0x128f LD C, A          ; 4F
0x1290 RET              ; C9

0x1291 DEC B            ; 05
0x1292 JR NZ, 0x0A      ; 20 08
0x1294 LD (HL), 0x2E    ; 36 2E
0x1296 LD (0x40F3), HL  ; 22 F3 40
0x1299 INC HL           ; 23
0x129a LD C, B          ; 48
0x129b RET              ; C9

0x129c DEC C            ; 0D
0x129d RET NZ           ; C0
0x129e LD (HL), 0x2C    ; 36 2C
0x12a0 INC HL           ; 23
0x12a1 LD C, 0x03       ; 0E 03
0x12a3 RET              ; C9

0x12a4 PUSH DE          ; D5
0x12a5 RST 20H          ; E7
0x12a6 JP PO, 0x12EA    ; E2 EA 12
0x12a9 PUSH BC          ; C5
0x12aa PUSH HL          ; E5
0x12ab CALL 0x09FC      ; CD FC 09
0x12ae LD HL, 0x137C    ; 21 7C 13
0x12b1 CALL 0x09F7      ; CD F7 09
0x12b4 CALL 0x0C77      ; CD 77 0C
0x12b7 XOR A            ; AF
0x12b8 CALL 0x0B7B      ; CD 7B 0B
0x12bb POP HL           ; E1
0x12bc POP BC           ; C1
0x12bd LD DE, 0x138C    ; 11 8C 13
0x12c0 LD A, 0x0A       ; 3E 0A
0x12c2 CALL 0x1291      ; CD 91 12
0x12c5 PUSH BC          ; C5
0x12c6 PUSH AF          ; F5
0x12c7 PUSH HL          ; E5
0x12c8 PUSH DE          ; D5
0x12c9 LD B, 0x2F       ; 06 2F
0x12cb INC B            ; 04
0x12cc POP HL           ; E1
0x12cd PUSH HL          ; E5
0x12ce CALL 0x0D48      ; CD 48 0D
0x12d1 JR NC, -0x06     ; 30 F8
0x12d3 POP HL           ; E1
0x12d4 CALL 0x0D36      ; CD 36 0D
0x12d7 EX DE, HL        ; EB
0x12d8 POP HL           ; E1
0x12d9 LD (HL), B       ; 70
0x12da INC HL           ; 23
0x12db POP AF           ; F1
0x12dc POP BC           ; C1
0x12dd DEC A            ; 3D
0x12de JR NZ, -0x1C     ; 20 E2
0x12e0 PUSH BC          ; C5
0x12e1 PUSH HL          ; E5
0x12e2 LD HL, 0x411D    ; 21 1D 41
0x12e5 CALL 0x09B1      ; CD B1 09
0x12e8 JR 0x0E          ; 18 0C

0x12ea PUSH BC          ; C5
0x12eb PUSH HL          ; E5
0x12ec CALL 0x0708      ; CD 08 07
0x12ef INC A            ; 3C
0x12f0 CALL 0x0AFB      ; CD FB 0A
0x12f3 CALL 0x09B4      ; CD B4 09
0x12f6 POP HL           ; E1
0x12f7 POP BC           ; C1
0x12f8 XOR A            ; AF
0x12f9 LD DE, 0x13D2    ; 11 D2 13
0x12fc CCF              ; 3F
0x12fd CALL 0x1291      ; CD 91 12
0x1300 PUSH BC          ; C5
0x1301 PUSH AF          ; F5
0x1302 PUSH HL          ; E5
0x1303 PUSH DE          ; D5
0x1304 CALL 0x09BF      ; CD BF 09
0x1307 POP HL           ; E1
0x1308 LD B, 0x2F       ; 06 2F
0x130a INC B            ; 04
0x130b LD A, E          ; 7B
0x130c SUB (HL)         ; 96
0x130d LD E, A          ; 5F
0x130e INC HL           ; 23
0x130f LD A, D          ; 7A
0x1310 SBC (HL)         ; 9E
0x1311 LD D, A          ; 57
0x1312 INC HL           ; 23
0x1313 LD A, C          ; 79
0x1314 SBC (HL)         ; 9E
0x1315 LD C, A          ; 4F
0x1316 DEC HL           ; 2B
0x1317 DEC HL           ; 2B
0x1318 JR NC, -0x0E     ; 30 F0
0x131a CALL 0x07B7      ; CD B7 07
0x131d INC HL           ; 23
0x131e CALL 0x09B4      ; CD B4 09
0x1321 EX DE, HL        ; EB
0x1322 POP HL           ; E1
0x1323 LD (HL), B       ; 70
0x1324 INC HL           ; 23
0x1325 POP AF           ; F1
0x1326 POP BC           ; C1
0x1327 JR C, -0x2B      ; 38 D3
0x1329 INC DE           ; 13
0x132a INC DE           ; 13
0x132b LD A, 0x04       ; 3E 04
0x132d JR 0x08          ; 18 06

0x132f PUSH DE          ; D5
0x1330 LD DE, 0x13D8    ; 11 D8 13
0x1333 LD A, 0x05       ; 3E 05
0x1335 CALL 0x1291      ; CD 91 12
0x1338 PUSH BC          ; C5
0x1339 PUSH AF          ; F5
0x133a PUSH HL          ; E5
0x133b EX DE, HL        ; EB
0x133c LD C, (HL)       ; 4E
0x133d INC HL           ; 23
0x133e LD B, (HL)       ; 46
0x133f PUSH BC          ; C5
0x1340 INC HL           ; 23
0x1341 EX (SP), HL      ; E3
0x1342 EX DE, HL        ; EB
0x1343 LD HL, (0x4121)  ; 2A 21 41
0x1346 LD B, 0x2F       ; 06 2F
0x1348 INC B            ; 04
0x1349 LD A, L          ; 7D
0x134a SUB E            ; 93
0x134b LD L, A          ; 6F
0x134c LD A, H          ; 7C
0x134d SBC D            ; 9A
0x134e LD H, A          ; 67
0x134f JR NC, -0x07     ; 30 F7
0x1351 ADD HL, DE       ; 19
0x1352 LD (0x4121), HL  ; 22 21 41
0x1355 POP DE           ; D1
0x1356 POP HL           ; E1
0x1357 LD (HL), B       ; 70
0x1358 INC HL           ; 23
0x1359 POP AF           ; F1
0x135a POP BC           ; C1
0x135b DEC A            ; 3D
0x135c JR NZ, -0x27     ; 20 D7
0x135e CALL 0x1291      ; CD 91 12
0x1361 LD (HL), A       ; 77
0x1362 POP DE           ; D1
0x1363 RET              ; C9

0x13e2 LD HL, 0x0982    ; 21 82 09
0x13e5 EX (SP), HL      ; E3
0x13e6 JP (HL)          ; E9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SQR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x13e7 CALL 0x09A4      ; CD A4 09
0x13ea LD HL, 0x1380    ; 21 80 13
0x13ed CALL 0x09B1      ; CD B1 09
0x13f0 JR 0x05          ; 18 03

0x13f5 POP BC           ; C1
0x13f6 POP DE           ; D1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POWER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x13f7 CALL 0x0955      ; CD 55 09
0x13fa LD A, B          ; 78
0x13fb JR Z, 0x3E       ; 28 3C
0x13fd JP P, 0x1404     ; F2 04 14
0x1400 OR A             ; B7
0x1401 JP Z, 0x199A     ; CA 9A 19
0x1404 OR A             ; B7
0x1405 JP Z, 0x0779     ; CA 79 07
0x1408 PUSH DE          ; D5
0x1409 PUSH BC          ; C5
0x140a LD A, C          ; 79
0x140b OR N             ; F6 7F
0x140d CALL 0x09BF      ; CD BF 09
0x1410 JP P, 0x1421     ; F2 21 14
0x1413 PUSH DE          ; D5
0x1414 PUSH BC          ; C5
0x1415 CALL 0x0B40      ; CD 40 0B
0x1418 POP BC           ; C1
0x1419 POP DE           ; D1
0x141a PUSH AF          ; F5
0x141b CALL 0x0A0C      ; CD 0C 0A
0x141e POP HL           ; E1
0x141f LD A, H          ; 7C
0x1420 RRA              ; 1F
0x1421 POP HL           ; E1
0x1422 LD (0x4123), HL  ; 22 23 41
0x1425 POP HL           ; E1
0x1426 LD (0x4121), HL  ; 22 21 41
0x1429 CALL C, 0x13E2   ; DC E2 13
0x142c CALL Z, 0x0982   ; CC 82 09
0x142f PUSH DE          ; D5
0x1430 PUSH BC          ; C5
0x1431 CALL 0x0809      ; CD 09 08
0x1434 POP BC           ; C1
0x1435 POP DE           ; D1
0x1436 CALL 0x0847      ; CD 47 08

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EXP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1439 CALL 0x09A4      ; CD A4 09
0x143c LD BC, 0x8138    ; 01 38 81
0x143f LD DE, 0xAA3B    ; 11 3B AA
0x1442 CALL 0x0847      ; CD 47 08
0x1445 LD A, (0x4124)   ; 3A 24 41
0x1448 CP N             ; FE 88
0x144a JP NC, 0x0931    ; D2 31 09
0x144d CALL 0x0B40      ; CD 40 0B
0x1450 ADD A, 0x80      ; C6 80
0x1452 ADD A, 0x02      ; C6 02
0x1454 JP C, 0x0931     ; DA 31 09
0x1457 PUSH AF          ; F5
0x1458 LD HL, 0x07F8    ; 21 F8 07
0x145b CALL 0x070B      ; CD 0B 07
0x145e CALL 0x0841      ; CD 41 08
0x1461 POP AF           ; F1
0x1462 POP BC           ; C1
0x1463 POP DE           ; D1
0x1464 PUSH AF          ; F5
0x1465 CALL 0x0713      ; CD 13 07
0x1468 CALL 0x0982      ; CD 82 09
0x146b LD HL, 0x1479    ; 21 79 14
0x146e CALL 0x14A9      ; CD A9 14
0x1471 LD DE, 0x0000    ; 11 00 00
0x1474 POP BC           ; C1
0x1475 LD C, D          ; 4A
0x1476 JP 0x0847        ; C3 47 08

0x149a CALL 0x09A4      ; CD A4 09
0x149d LD DE, 0x0C32    ; 11 32 0C
0x14a0 PUSH DE          ; D5
0x14a1 PUSH HL          ; E5
0x14a2 CALL 0x09BF      ; CD BF 09
0x14a5 CALL 0x0847      ; CD 47 08
0x14a8 POP HL           ; E1
0x14a9 CALL 0x09A4      ; CD A4 09
0x14ac LD A, (HL)       ; 7E
0x14ad INC HL           ; 23
0x14ae CALL 0x09B1      ; CD B1 09
0x14b1 LD B, 0xF1       ; 06 F1
0x14b2 POP AF           ; F1
0x14b3 POP BC           ; C1
0x14b4 POP DE           ; D1
0x14b5 DEC A            ; 3D
0x14b6 RET Z            ; C8
0x14b7 PUSH DE          ; D5
0x14b8 PUSH BC          ; C5
0x14b9 PUSH AF          ; F5
0x14ba PUSH HL          ; E5
0x14bb CALL 0x0847      ; CD 47 08
0x14be POP HL           ; E1
0x14bf CALL 0x09C2      ; CD C2 09
0x14c2 PUSH HL          ; E5
0x14c3 CALL 0x0716      ; CD 16 07
0x14c6 POP HL           ; E1
0x14c7 JR -0x15         ; 18 E9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x14c9 CALL 0x0A7F      ; CD 7F 0A
0x14cc LD A, H          ; 7C
0x14cd OR A             ; B7
0x14ce JP M, 0x1E4A     ; FA 4A 1E
0x14d1 OR L             ; B5
0x14d2 JP Z, 0x14F0     ; CA F0 14
0x14d5 PUSH HL          ; E5
0x14d6 CALL 0x14F0      ; CD F0 14
0x14d9 CALL 0x09BF      ; CD BF 09
0x14dc EX DE, HL        ; EB
0x14dd EX (SP), HL      ; E3
0x14de PUSH BC          ; C5
0x14df CALL 0x0ACF      ; CD CF 0A
0x14e2 POP BC           ; C1
0x14e3 POP DE           ; D1
0x14e4 CALL 0x0847      ; CD 47 08
0x14e7 LD HL, 0x07F8    ; 21 F8 07
0x14ea CALL 0x070B      ; CD 0B 07
0x14ed JP 0x0B40        ; C3 40 0B

0x14f0 LD HL, 0x4090    ; 21 90 40
0x14f3 PUSH HL          ; E5
0x14f4 LD DE, 0x0000    ; 11 00 00
0x14f7 LD C, E          ; 4B
0x14f8 LD H, 0x03       ; 26 03
0x14fa LD L, 0x08       ; 2E 08
0x14fc EX DE, HL        ; EB
0x14fd ADD HL, HL       ; 29
0x14fe EX DE, HL        ; EB
0x14ff LD A, C          ; 79
0x1500 RLA              ; 17
0x1501 LD C, A          ; 4F
0x1502 EX (SP), HL      ; E3
0x1503 LD A, (HL)       ; 7E
0x1504 RLCA             ; 07
0x1505 LD (HL), A       ; 77
0x1506 EX (SP), HL      ; E3
0x1507 JP NC, 0x1516    ; D2 16 15
0x150a PUSH HL          ; E5
0x150b LD HL, (0x40AA)  ; 2A AA 40
0x150e ADD HL, DE       ; 19
0x150f EX DE, HL        ; EB
0x1510 LD A, (0x40AC)   ; 3A AC 40
0x1513 ADC A, C         ; 89
0x1514 LD C, A          ; 4F
0x1515 POP HL           ; E1
0x1516 DEC L            ; 2D
0x1517 JP NZ, 0x14FC    ; C2 FC 14
0x151a EX (SP), HL      ; E3
0x151b INC HL           ; 23
0x151c EX (SP), HL      ; E3
0x151d DEC H            ; 25
0x151e JP NZ, 0x14FA    ; C2 FA 14
0x1521 POP HL           ; E1
0x1522 LD HL, 0xB065    ; 21 65 B0
0x1525 ADD HL, DE       ; 19
0x1526 LD (0x40AA), HL  ; 22 AA 40
0x1529 CALL 0x0AEF      ; CD EF 0A
0x152c LD A, 0x05       ; 3E 05
0x152e ADC A, C         ; 89
0x152f LD (0x40AC), A   ; 32 AC 40
0x1532 EX DE, HL        ; EB
0x1533 LD B, 0x80       ; 06 80
0x1535 LD HL, 0x4125    ; 21 25 41
0x1538 LD (HL), B       ; 70
0x1539 DEC HL           ; 2B
0x153a LD (HL), B       ; 70
0x153b LD C, A          ; 4F
0x153c LD B, 0x00       ; 06 00
0x153e JP 0x0765        ; C3 65 07

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; COS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1541 LD HL, 0x158B    ; 21 8B 15
0x1544 CALL 0x070B      ; CD 0B 07

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1547 CALL 0x09A4      ; CD A4 09
0x154a LD BC, 0x8349    ; 01 49 83
0x154d LD DE, 0x0FDB    ; 11 DB 0F
0x1550 CALL 0x09B4      ; CD B4 09
0x1553 POP BC           ; C1
0x1554 POP DE           ; D1
0x1555 CALL 0x08A2      ; CD A2 08
0x1558 CALL 0x09A4      ; CD A4 09
0x155b CALL 0x0B40      ; CD 40 0B
0x155e POP BC           ; C1
0x155f POP DE           ; D1
0x1560 CALL 0x0713      ; CD 13 07
0x1563 LD HL, 0x158F    ; 21 8F 15
0x1566 CALL 0x0710      ; CD 10 07
0x1569 CALL 0x0955      ; CD 55 09
0x156c SCF              ; 37
0x156d JP P, 0x1577     ; F2 77 15
0x1570 CALL 0x0708      ; CD 08 07
0x1573 CALL 0x0955      ; CD 55 09
0x1576 OR A             ; B7
0x1577 PUSH AF          ; F5
0x1578 CALL P, 0x0982   ; F4 82 09
0x157b LD HL, 0x158F    ; 21 8F 15
0x157e CALL 0x070B      ; CD 0B 07
0x1581 POP AF           ; F1
0x1582 CALL NC, 0x0982  ; D4 82 09
0x1585 LD HL, 0x1593    ; 21 93 15
0x1588 JP 0x149A        ; C3 9A 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TAN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x15a8 CALL 0x09A4      ; CD A4 09
0x15ab CALL 0x1547      ; CD 47 15
0x15ae POP BC           ; C1
0x15af POP HL           ; E1
0x15b0 CALL 0x09A4      ; CD A4 09
0x15b3 EX DE, HL        ; EB
0x15b4 CALL 0x09B4      ; CD B4 09
0x15b7 CALL 0x1541      ; CD 41 15
0x15ba JP 0x08A0        ; C3 A0 08

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ATN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x15bd CALL 0x0955      ; CD 55 09
0x15c0 CALL M, 0x13E2   ; FC E2 13
0x15c3 CALL M, 0x0982   ; FC 82 09
0x15c6 LD A, (0x4124)   ; 3A 24 41
0x15c9 CP N             ; FE 81
0x15cb JR C, 0x0E       ; 38 0C
0x15cd LD BC, 0x8100    ; 01 00 81
0x15d0 LD D, C          ; 51
0x15d1 LD E, C          ; 59
0x15d2 CALL 0x08A2      ; CD A2 08
0x15d5 LD HL, 0x0710    ; 21 10 07
0x15d8 PUSH HL          ; E5
0x15d9 LD HL, 0x15E3    ; 21 E3 15
0x15dc CALL 0x149A      ; CD 9A 14
0x15df LD HL, 0x158B    ; 21 8B 15
0x15e2 RET              ; C9

0x1936 LD HL, 0x0004    ; 21 04 00
0x1939 ADD HL, SP       ; 39
0x193a LD A, (HL)       ; 7E
0x193b INC HL           ; 23
0x193c CP N             ; FE 81
0x193e RET NZ           ; C0
0x193f LD C, (HL)       ; 4E
0x1940 INC HL           ; 23
0x1941 LD B, (HL)       ; 46
0x1942 INC HL           ; 23
0x1943 PUSH HL          ; E5
0x1944 LD L, C          ; 69
0x1945 LD H, B          ; 60
0x1946 LD A, D          ; 7A
0x1947 OR E             ; B3
0x1948 EX DE, HL        ; EB
0x1949 JR Z, 0x04       ; 28 02
0x194b EX DE, HL        ; EB
0x194c RST 18H          ; DF
0x194d LD BC, 0x000E    ; 01 0E 00
0x1950 POP HL           ; E1
0x1951 RET Z            ; C8
0x1952 ADD HL, BC       ; 09
0x1953 JR -0x19         ; 18 E5

0x1955 CALL 0x196C      ; CD 6C 19
0x1958 PUSH BC          ; C5
0x1959 EX (SP), HL      ; E3
0x195a POP BC           ; C1
0x195b RST 18H          ; DF
0x195c LD A, (HL)       ; 7E
0x195d LD (BC), A       ; 02
0x195e RET Z            ; C8
0x195f DEC BC           ; 0B
0x1960 DEC HL           ; 2B
0x1961 JR -0x06         ; 18 F8

0x1963 PUSH HL          ; E5
0x1964 LD HL, (0x40FD)  ; 2A FD 40
0x1967 LD B, 0x00       ; 06 00
0x1969 ADD HL, BC       ; 09
0x196a ADD HL, BC       ; 09
0x196b LD A, 0xE5       ; 3E E5
0x196c PUSH HL          ; E5
0x196d LD A, 0xC6       ; 3E C6
0x196f SUB L            ; 95
0x1970 LD L, A          ; 6F
0x1971 LD A, 0xFF       ; 3E FF
0x1973 SBC H            ; 9C
0x1974 JR C, 0x06       ; 38 04
0x1976 LD H, A          ; 67
0x1977 ADD HL, SP       ; 39
0x1978 POP HL           ; E1
0x1979 RET C            ; D8
0x197a LD E, 0x0C       ; 1E 0C
0x197c JR 0x26          ; 18 24

0x197e LD HL, (0x40A2)  ; 2A A2 40
0x1981 LD A, H          ; 7C
0x1982 AND L            ; A5
0x1983 INC A            ; 3C
0x1984 JR Z, 0x0A       ; 28 08
0x1986 LD A, (0x40F2)   ; 3A F2 40
0x1989 OR A             ; B7
0x198a LD E, 0x22       ; 1E 22
0x198c JR NZ, 0x16      ; 20 14
0x198e JP 0x1DC1        ; C3 C1 1D

0x1991 LD HL, (0x40DA)  ; 2A DA 40
0x1994 LD (0x40A2), HL  ; 22 A2 40
0x1997 LD E, 0x02       ; 1E 02
0x1999 LD BC, 0x141E    ; 01 1E 14
0x199a LD E, 0x14       ; 1E 14
0x199c LD BC, 0x001E    ; 01 1E 00
0x199d LD E, 0x00       ; 1E 00
0x199f LD BC, 0x241E    ; 01 1E 24
0x19a0 LD E, 0x24       ; 1E 24
0x19a2 LD HL, (0x40A2)  ; 2A A2 40
0x19a5 LD (0x40EA), HL  ; 22 EA 40
0x19a8 LD (0x40EC), HL  ; 22 EC 40
0x19ab LD BC, 0x19B4    ; 01 B4 19
0x19ae LD HL, (0x40E8)  ; 2A E8 40
0x19b1 JP 0x1B9A        ; C3 9A 1B

0x1a06 CALL 0x28A7      ; CD A7 28
0x1a09 POP HL           ; E1
0x1a0a LD DE, 0xFFFE    ; 11 FE FF
0x1a0d RST 18H          ; DF
0x1a0e JP Z, 0x0674     ; CA 74 06
0x1a11 LD A, H          ; 7C
0x1a12 AND L            ; A5
0x1a13 INC A            ; 3C
0x1a14 CALL NZ, 0x0FA7  ; C4 A7 0F
0x1a17 LD A, 0xC1       ; 3E C1
0x1a18 POP BC           ; C1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1a19 CALL 0x038B      ; CD 8B 03
0x1a1c CALL 0x41AC      ; CD AC 41
0x1a1f CALL 0x01F8      ; CD F8 01
0x1a22 CALL 0x20F9      ; CD F9 20
0x1a25 LD HL, 0x1929    ; 21 29 19
0x1a28 CALL 0x28A7      ; CD A7 28
0x1a2b LD A, (0x409A)   ; 3A 9A 40
0x1a2e SUB N            ; D6 02
0x1a30 CALL Z, 0x2E53   ; CC 53 2E
0x1a33 LD HL, 0xFFFF    ; 21 FF FF
0x1a36 LD (0x40A2), HL  ; 22 A2 40
0x1a39 LD A, (0x40E1)   ; 3A E1 40
0x1a3c OR A             ; B7
0x1a3d JR Z, 0x39       ; 28 37
0x1a3f LD HL, (0x40E2)  ; 2A E2 40
0x1a42 PUSH HL          ; E5
0x1a43 CALL 0x0FAF      ; CD AF 0F
0x1a46 POP DE           ; D1
0x1a47 PUSH DE          ; D5
0x1a48 CALL 0x1B2C      ; CD 2C 1B
0x1a4b LD A, 0x2A       ; 3E 2A
0x1a4d JR C, 0x04       ; 38 02
0x1a4f LD A, 0x20       ; 3E 20
0x1a51 CALL 0x032A      ; CD 2A 03
0x1a54 CALL 0x0361      ; CD 61 03
0x1a57 POP DE           ; D1
0x1a58 JR NC, 0x08      ; 30 06
0x1a5a XOR A            ; AF
0x1a5b LD (0x40E1), A   ; 32 E1 40
0x1a5e JR -0x45         ; 18 B9

0x1a60 LD HL, (0x40E4)  ; 2A E4 40
0x1a63 ADD HL, DE       ; 19
0x1a64 JR C, -0x0A      ; 38 F4
0x1a66 PUSH DE          ; D5
0x1a67 LD DE, 0xFFF9    ; 11 F9 FF
0x1a6a RST 18H          ; DF
0x1a6b POP DE           ; D1
0x1a6c JR NC, -0x12     ; 30 EC
0x1a6e LD (0x40E2), HL  ; 22 E2 40
0x1a71 OR N             ; F6 FF
0x1a73 JP 0x2FEB        ; C3 EB 2F

0x1a76 LD A, 0x3E       ; 3E 3E
0x1a78 CALL 0x032A      ; CD 2A 03
0x1a7b CALL 0x0361      ; CD 61 03
0x1a7e JP C, 0x1A33     ; DA 33 1A
0x1a81 RST 10H          ; D7
0x1a82 INC A            ; 3C
0x1a83 DEC A            ; 3D
0x1a84 JP Z, 0x1A33     ; CA 33 1A
0x1a87 PUSH AF          ; F5
0x1a88 CALL 0x1E5A      ; CD 5A 1E
0x1a8b DEC HL           ; 2B
0x1a8c LD A, (HL)       ; 7E
0x1a8d CP N             ; FE 20
0x1a8f JR Z, -0x04      ; 28 FA
0x1a91 INC HL           ; 23
0x1a92 LD A, (HL)       ; 7E
0x1a93 CP N             ; FE 20
0x1a95 CALL Z, 0x09C9   ; CC C9 09
0x1a98 PUSH DE          ; D5
0x1a99 CALL 0x1BC0      ; CD C0 1B
0x1a9c POP DE           ; D1
0x1a9d POP AF           ; F1
0x1a9e LD (0x40E6), HL  ; 22 E6 40
0x1aa1 CALL 0x41B2      ; CD B2 41
0x1aa4 JP NC, 0x1D5A    ; D2 5A 1D
0x1aa7 PUSH DE          ; D5
0x1aa8 PUSH BC          ; C5
0x1aa9 XOR A            ; AF
0x1aaa LD (0x40DD), A   ; 32 DD 40
0x1aad RST 10H          ; D7
0x1aae OR A             ; B7
0x1aaf PUSH AF          ; F5
0x1ab0 EX DE, HL        ; EB
0x1ab1 LD (0x40EC), HL  ; 22 EC 40
0x1ab4 EX DE, HL        ; EB
0x1ab5 CALL 0x1B2C      ; CD 2C 1B
0x1ab8 PUSH BC          ; C5
0x1ab9 CALL C, 0x2BE4   ; DC E4 2B
0x1abc POP DE           ; D1
0x1abd POP AF           ; F1
0x1abe PUSH DE          ; D5
0x1abf JR Z, 0x29       ; 28 27
0x1ac1 POP DE           ; D1
0x1ac2 LD HL, (0x40F9)  ; 2A F9 40
0x1ac5 EX (SP), HL      ; E3
0x1ac6 POP BC           ; C1
0x1ac7 ADD HL, BC       ; 09
0x1ac8 PUSH HL          ; E5
0x1ac9 CALL 0x1955      ; CD 55 19
0x1acc POP HL           ; E1
0x1acd LD (0x40F9), HL  ; 22 F9 40
0x1ad0 EX DE, HL        ; EB
0x1ad1 LD (HL), H       ; 74
0x1ad2 POP DE           ; D1
0x1ad3 PUSH HL          ; E5
0x1ad4 INC HL           ; 23
0x1ad5 INC HL           ; 23
0x1ad6 LD (HL), E       ; 73
0x1ad7 INC HL           ; 23
0x1ad8 LD (HL), D       ; 72
0x1ad9 INC HL           ; 23
0x1ada EX DE, HL        ; EB
0x1adb LD HL, (0x40A7)  ; 2A A7 40
0x1ade EX DE, HL        ; EB
0x1adf DEC DE           ; 1B
0x1ae0 DEC DE           ; 1B
0x1ae1 LD A, (DE)       ; 1A
0x1ae2 LD (HL), A       ; 77
0x1ae3 INC HL           ; 23
0x1ae4 INC DE           ; 13
0x1ae5 OR A             ; B7
0x1ae6 JR NZ, -0x05     ; 20 F9
0x1ae8 POP DE           ; D1
0x1ae9 CALL 0x1AFC      ; CD FC 1A
0x1aec CALL 0x41B5      ; CD B5 41
0x1aef CALL 0x1B5D      ; CD 5D 1B
0x1af2 CALL 0x41B8      ; CD B8 41
0x1af5 JP 0x1A33        ; C3 33 1A

0x1afc LD H, D          ; 62
0x1afd LD L, E          ; 6B
0x1afe LD A, (HL)       ; 7E
0x1aff INC HL           ; 23
0x1b00 OR (HL)          ; B6
0x1b01 RET Z            ; C8
0x1b02 INC HL           ; 23
0x1b03 INC HL           ; 23
0x1b04 INC HL           ; 23
0x1b05 XOR A            ; AF
0x1b06 CP (HL)          ; BE
0x1b07 INC HL           ; 23
0x1b08 JR NZ, -0x02     ; 20 FC
0x1b0a EX DE, HL        ; EB
0x1b0b LD (HL), E       ; 73
0x1b0c INC HL           ; 23
0x1b0d LD (HL), D       ; 72
0x1b0e JR -0x12         ; 18 EC

0x1b10 LD DE, 0x0000    ; 11 00 00
0x1b13 PUSH DE          ; D5
0x1b14 JR Z, 0x0B       ; 28 09
0x1b16 POP DE           ; D1
0x1b17 CALL 0x1E4F      ; CD 4F 1E
0x1b1a PUSH DE          ; D5
0x1b1b JR Z, 0x0D       ; 28 0B
0x1b1d RST 8H           ; CF
0x1b1e ADC A, 0x11      ; CE 11
0x1b1f LD DE, 0xFFFA    ; 11 FA FF
0x1b20 JP M, 0xC4FF     ; FA FF C4
0x1b22 CALL NZ, 0x1E4F  ; C4 4F 1E
0x1b23 LD C, A          ; 4F
0x1b24 LD E, 0xC2       ; 1E C2
0x1b25 JP NZ, 0x1997    ; C2 97 19
0x1b26 SUB A            ; 97
0x1b27 ADD HL, DE       ; 19
0x1b28 EX DE, HL        ; EB
0x1b29 POP DE           ; D1
0x1b2a EX (SP), HL      ; E3
0x1b2b PUSH HL          ; E5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FNDLIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1b2c LD HL, (0x40A4)  ; 2A A4 40
0x1b2f LD B, H          ; 44
0x1b30 LD C, L          ; 4D
0x1b31 LD A, (HL)       ; 7E
0x1b32 INC HL           ; 23
0x1b33 OR (HL)          ; B6
0x1b34 DEC HL           ; 2B
0x1b35 RET Z            ; C8
0x1b36 INC HL           ; 23
0x1b37 INC HL           ; 23
0x1b38 LD A, (HL)       ; 7E
0x1b39 INC HL           ; 23
0x1b3a LD H, (HL)       ; 66
0x1b3b LD L, A          ; 6F
0x1b3c RST 18H          ; DF
0x1b3d LD H, B          ; 60
0x1b3e LD L, C          ; 69
0x1b3f LD A, (HL)       ; 7E
0x1b40 INC HL           ; 23
0x1b41 LD H, (HL)       ; 66
0x1b42 LD L, A          ; 6F
0x1b43 CCF              ; 3F
0x1b44 RET Z            ; C8
0x1b45 CCF              ; 3F
0x1b46 RET NC           ; D0
0x1b47 JR -0x18         ; 18 E6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NEW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1b49 RET NZ           ; C0
0x1b4a CALL 0x01C9      ; CD C9 01
0x1b4d LD HL, (0x40A4)  ; 2A A4 40
0x1b50 CALL 0x1DF8      ; CD F8 1D
0x1b53 LD (0x40E1), A   ; 32 E1 40
0x1b56 LD (HL), A       ; 77
0x1b57 INC HL           ; 23
0x1b58 LD (HL), A       ; 77
0x1b59 INC HL           ; 23
0x1b5a LD (0x40F9), HL  ; 22 F9 40
0x1b5d CALL 0x046B      ; CD 6B 04
0x1b60 DEC HL           ; 2B
0x1b61 LD (0x40DF), HL  ; 22 DF 40
0x1b64 LD B, 0x1A       ; 06 1A
0x1b66 LD HL, 0x4101    ; 21 01 41
0x1b69 LD (HL), 0x04    ; 36 04
0x1b6b INC HL           ; 23
0x1b6c DJNZ N           ; 10 FB
0x1b6e XOR A            ; AF
0x1b6f LD (0x40F2), A   ; 32 F2 40
0x1b72 LD L, A          ; 6F
0x1b73 LD H, A          ; 67
0x1b74 LD (0x40F0), HL  ; 22 F0 40
0x1b77 LD (0x40F7), HL  ; 22 F7 40
0x1b7a LD HL, (0x40B1)  ; 2A B1 40
0x1b7d LD (0x40D6), HL  ; 22 D6 40
0x1b80 CALL 0x1D91      ; CD 91 1D
0x1b83 LD HL, (0x40F9)  ; 2A F9 40
0x1b86 LD (0x40FB), HL  ; 22 FB 40
0x1b89 LD (0x40FD), HL  ; 22 FD 40
0x1b8c CALL 0x41BB      ; CD BB 41
0x1b8f POP BC           ; C1
0x1b90 LD HL, (0x40A0)  ; 2A A0 40
0x1b93 DEC HL           ; 2B
0x1b94 DEC HL           ; 2B
0x1b95 LD (0x40E8), HL  ; 22 E8 40
0x1b98 INC HL           ; 23
0x1b99 INC HL           ; 23
0x1b9a LD SP, HL        ; F9
0x1b9b LD HL, 0x40B5    ; 21 B5 40
0x1b9e LD (0x40B3), HL  ; 22 B3 40
0x1ba1 CALL 0x038B      ; CD 8B 03
0x1ba4 CALL 0x2169      ; CD 69 21
0x1ba7 XOR A            ; AF
0x1ba8 LD H, A          ; 67
0x1ba9 LD L, A          ; 6F
0x1baa LD (0x40DC), A   ; 32 DC 40
0x1bad PUSH HL          ; E5
0x1bae PUSH BC          ; C5
0x1baf LD HL, (0x40DF)  ; 2A DF 40
0x1bb2 RET              ; C9

0x1bb3 LD A, 0x3F       ; 3E 3F
0x1bb5 CALL 0x032A      ; CD 2A 03
0x1bb8 LD A, 0x20       ; 3E 20
0x1bba CALL 0x032A      ; CD 2A 03
0x1bbd JP 0x0361        ; C3 61 03

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TOKEN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1bc0 XOR A            ; AF
0x1bc1 LD (0x40B0), A   ; 32 B0 40
0x1bc4 LD C, A          ; 4F
0x1bc5 EX DE, HL        ; EB
0x1bc6 LD HL, (0x40A7)  ; 2A A7 40
0x1bc9 DEC HL           ; 2B
0x1bca DEC HL           ; 2B
0x1bcb EX DE, HL        ; EB
0x1bcc LD A, (HL)       ; 7E
0x1bcd CP N             ; FE 20
0x1bcf JP Z, 0x1C5B     ; CA 5B 1C
0x1bd2 LD B, A          ; 47
0x1bd3 CP N             ; FE 22
0x1bd5 JP Z, 0x1C77     ; CA 77 1C
0x1bd8 OR A             ; B7
0x1bd9 JP Z, 0x1C7D     ; CA 7D 1C
0x1bdc LD A, (0x40B0)   ; 3A B0 40
0x1bdf OR A             ; B7
0x1be0 LD A, (HL)       ; 7E
0x1be1 JP NZ, 0x1C5B    ; C2 5B 1C
0x1be4 CP N             ; FE 3F
0x1be6 LD A, 0xB2       ; 3E B2
0x1be8 JP Z, 0x1C5B     ; CA 5B 1C
0x1beb LD A, (HL)       ; 7E
0x1bec CP N             ; FE 30
0x1bee JR C, 0x07       ; 38 05
0x1bf0 CP N             ; FE 3C
0x1bf2 JP C, 0x1C5B     ; DA 5B 1C
0x1bf5 PUSH DE          ; D5
0x1bf6 LD DE, 0x164F    ; 11 4F 16
0x1bf9 PUSH BC          ; C5
0x1bfa LD BC, 0x1C3D    ; 01 3D 1C
0x1bfd PUSH BC          ; C5
0x1bfe LD B, 0x7F       ; 06 7F
0x1c00 LD A, (HL)       ; 7E
0x1c01 CP N             ; FE 61
0x1c03 JR C, 0x09       ; 38 07
0x1c05 CP N             ; FE 7B
0x1c07 JR NC, 0x05      ; 30 03
0x1c09 AND N            ; E6 5F
0x1c0b LD (HL), A       ; 77
0x1c0c LD C, (HL)       ; 4E
0x1c0d EX DE, HL        ; EB
0x1c0e INC HL           ; 23
0x1c0f OR (HL)          ; B6
0x1c10 JP P, 0x1C0E     ; F2 0E 1C
0x1c13 INC B            ; 04
0x1c14 LD A, (HL)       ; 7E
0x1c15 AND N            ; E6 7F
0x1c17 RET Z            ; C8
0x1c18 CP C             ; B9
0x1c19 JR NZ, -0x0B     ; 20 F3
0x1c1b EX DE, HL        ; EB
0x1c1c PUSH HL          ; E5
0x1c1d INC DE           ; 13
0x1c1e LD A, (DE)       ; 1A
0x1c1f OR A             ; B7
0x1c20 JP M, 0x1C39     ; FA 39 1C
0x1c23 LD C, A          ; 4F
0x1c24 LD A, B          ; 78
0x1c25 CP N             ; FE 8D
0x1c27 JR NZ, 0x04      ; 20 02
0x1c29 RST 10H          ; D7
0x1c2a DEC HL           ; 2B
0x1c2b INC HL           ; 23
0x1c2c LD A, (HL)       ; 7E
0x1c2d CP N             ; FE 61
0x1c2f JR C, 0x04       ; 38 02
0x1c31 AND N            ; E6 5F
0x1c33 CP C             ; B9
0x1c34 JR Z, -0x17      ; 28 E7
0x1c36 POP HL           ; E1
0x1c37 JR -0x2B         ; 18 D3

0x1c39 LD C, B          ; 48
0x1c3a POP AF           ; F1
0x1c3b EX DE, HL        ; EB
0x1c3c RET              ; C9

0x1c5b INC HL           ; 23
0x1c5c LD (DE), A       ; 12
0x1c5d INC DE           ; 13
0x1c5e INC C            ; 0C
0x1c5f SUB N            ; D6 3A
0x1c61 JR Z, 0x06       ; 28 04
0x1c63 CP N             ; FE 4E
0x1c65 JR NZ, 0x05      ; 20 03
0x1c67 LD (0x40B0), A   ; 32 B0 40
0x1c6a SUB N            ; D6 59
0x1c6c JP NZ, 0x1BCC    ; C2 CC 1B
0x1c6f LD B, A          ; 47
0x1c70 LD A, (HL)       ; 7E
0x1c71 OR A             ; B7
0x1c72 JR Z, 0x0B       ; 28 09
0x1c74 CP B             ; B8
0x1c75 JR Z, -0x1A      ; 28 E4
0x1c77 INC HL           ; 23
0x1c78 LD (DE), A       ; 12
0x1c79 INC C            ; 0C
0x1c7a INC DE           ; 13
0x1c7b JR -0x0B         ; 18 F3

0x1c7d LD HL, 0x0005    ; 21 05 00
0x1c80 LD B, H          ; 44
0x1c81 ADD HL, BC       ; 09
0x1c82 LD B, H          ; 44
0x1c83 LD C, L          ; 4D
0x1c84 LD HL, (0x40A7)  ; 2A A7 40
0x1c87 DEC HL           ; 2B
0x1c88 DEC HL           ; 2B
0x1c89 DEC HL           ; 2B
0x1c8a LD (DE), A       ; 12
0x1c8b INC DE           ; 13
0x1c8c LD (DE), A       ; 12
0x1c8d INC DE           ; 13
0x1c8e LD (DE), A       ; 12
0x1c8f RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FOR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1ca1 LD A, 0x64       ; 3E 64
0x1ca3 LD (0x40DC), A   ; 32 DC 40
0x1ca6 CALL 0x1F21      ; CD 21 1F
0x1ca9 EX (SP), HL      ; E3
0x1caa CALL 0x1936      ; CD 36 19
0x1cad POP DE           ; D1
0x1cae JR NZ, 0x07      ; 20 05
0x1cb0 ADD HL, BC       ; 09
0x1cb1 LD SP, HL        ; F9
0x1cb2 LD (0x40E8), HL  ; 22 E8 40
0x1cb5 EX DE, HL        ; EB
0x1cb6 LD C, 0x08       ; 0E 08
0x1cb8 CALL 0x1963      ; CD 63 19
0x1cbb PUSH HL          ; E5
0x1cbc CALL 0x1F05      ; CD 05 1F
0x1cbf EX (SP), HL      ; E3
0x1cc0 PUSH HL          ; E5
0x1cc1 LD HL, (0x40A2)  ; 2A A2 40
0x1cc4 EX (SP), HL      ; E3
0x1cc5 RST 8H           ; CF
0x1cc6 CP L             ; BD
0x1cc7 RST 20H          ; E7
0x1cc8 JP Z, 0x0AF6     ; CA F6 0A
0x1ccb JP NC, 0x0AF6    ; D2 F6 0A
0x1cce PUSH AF          ; F5
0x1ccf CALL 0x2337      ; CD 37 23
0x1cd2 POP AF           ; F1
0x1cd3 PUSH HL          ; E5
0x1cd4 JP P, 0x1CEC     ; F2 EC 1C
0x1cd7 CALL 0x0A7F      ; CD 7F 0A
0x1cda EX (SP), HL      ; E3
0x1cdb LD DE, 0x0001    ; 11 01 00
0x1cde LD A, (HL)       ; 7E
0x1cdf CP N             ; FE CC
0x1ce1 CALL Z, 0x2B01   ; CC 01 2B
0x1ce4 PUSH DE          ; D5
0x1ce5 PUSH HL          ; E5
0x1ce6 EX DE, HL        ; EB
0x1ce7 CALL 0x099E      ; CD 9E 09
0x1cea JR 0x24          ; 18 22

0x1cec CALL 0x0AB1      ; CD B1 0A
0x1cef CALL 0x09BF      ; CD BF 09
0x1cf2 POP HL           ; E1
0x1cf3 PUSH BC          ; C5
0x1cf4 PUSH DE          ; D5
0x1cf5 LD BC, 0x8100    ; 01 00 81
0x1cf8 LD D, C          ; 51
0x1cf9 LD E, D          ; 5A
0x1cfa LD A, (HL)       ; 7E
0x1cfb CP N             ; FE CC
0x1cfd LD A, 0x01       ; 3E 01
0x1cff JR NZ, 0x10      ; 20 0E
0x1d01 CALL 0x2338      ; CD 38 23
0x1d04 PUSH HL          ; E5
0x1d05 CALL 0x0AB1      ; CD B1 0A
0x1d08 CALL 0x09BF      ; CD BF 09
0x1d0b CALL 0x0955      ; CD 55 09
0x1d0e POP HL           ; E1
0x1d0f PUSH BC          ; C5
0x1d10 PUSH DE          ; D5
0x1d11 LD C, A          ; 4F
0x1d12 RST 20H          ; E7
0x1d13 LD B, A          ; 47
0x1d14 PUSH BC          ; C5
0x1d15 PUSH HL          ; E5
0x1d16 LD HL, (0x40DF)  ; 2A DF 40
0x1d19 EX (SP), HL      ; E3
0x1d1a LD B, 0x81       ; 06 81
0x1d1c PUSH BC          ; C5
0x1d1d INC SP           ; 33

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RUNSTM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1d1e CALL 0x0358      ; CD 58 03
0x1d21 OR A             ; B7
0x1d22 CALL NZ, 0x1DA0  ; C4 A0 1D
0x1d25 LD (0x40E6), HL  ; 22 E6 40
0x1d28 LD (0x40E8), SP  ; ED 73 E8 40
0x1d2c LD A, (HL)       ; 7E
0x1d2d CP N             ; FE 3A
0x1d2f JR Z, 0x2B       ; 28 29
0x1d31 OR A             ; B7
0x1d32 JP NZ, 0x1997    ; C2 97 19
0x1d35 INC HL           ; 23
0x1d36 LD A, (HL)       ; 7E
0x1d37 INC HL           ; 23
0x1d38 OR (HL)          ; B6
0x1d39 JP Z, 0x197E     ; CA 7E 19
0x1d3c INC HL           ; 23
0x1d3d LD E, (HL)       ; 5E
0x1d3e INC HL           ; 23
0x1d3f LD D, (HL)       ; 56
0x1d40 EX DE, HL        ; EB
0x1d41 LD (0x40A2), HL  ; 22 A2 40
0x1d44 LD A, (0x411B)   ; 3A 1B 41
0x1d47 OR A             ; B7
0x1d48 JR Z, 0x11       ; 28 0F
0x1d4a PUSH DE          ; D5
0x1d4b LD A, 0x3C       ; 3E 3C
0x1d4d CALL 0x032A      ; CD 2A 03
0x1d50 CALL 0x0FAF      ; CD AF 0F
0x1d53 LD A, 0x3E       ; 3E 3E
0x1d55 CALL 0x032A      ; CD 2A 03
0x1d58 POP DE           ; D1
0x1d59 EX DE, HL        ; EB
0x1d5a RST 10H          ; D7
0x1d5b LD DE, 0x1D1E    ; 11 1E 1D
0x1d5e PUSH DE          ; D5
0x1d5f RET Z            ; C8
0x1d60 SUB N            ; D6 80
0x1d62 JP C, 0x1F21     ; DA 21 1F
0x1d65 CP N             ; FE 3C
0x1d67 JP NC, 0x2AE7    ; D2 E7 2A
0x1d6a RLCA             ; 07
0x1d6b LD C, A          ; 4F
0x1d6c LD B, 0x00       ; 06 00
0x1d6e EX DE, HL        ; EB
0x1d6f LD HL, 0x1822    ; 21 22 18
0x1d72 ADD HL, BC       ; 09
0x1d73 LD C, (HL)       ; 4E
0x1d74 INC HL           ; 23
0x1d75 LD B, (HL)       ; 46
0x1d76 PUSH BC          ; C5
0x1d77 EX DE, HL        ; EB
0x1d78 INC HL           ; 23
0x1d79 LD A, (HL)       ; 7E
0x1d7a CP N             ; FE 3A
0x1d7c RET NC           ; D0
0x1d7d CP N             ; FE 20
0x1d7f JP Z, 0x1D78     ; CA 78 1D
0x1d82 CP N             ; FE 0B
0x1d84 JR NC, 0x07      ; 30 05
0x1d86 CP N             ; FE 09
0x1d88 JP NC, 0x1D78    ; D2 78 1D
0x1d8b CP N             ; FE 30
0x1d8d CCF              ; 3F
0x1d8e INC A            ; 3C
0x1d8f DEC A            ; 3D
0x1d90 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RESTORE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1d91 EX DE, HL        ; EB
0x1d92 LD HL, (0x40A4)  ; 2A A4 40
0x1d95 DEC HL           ; 2B
0x1d96 LD (0x40FF), HL  ; 22 FF 40
0x1d99 EX DE, HL        ; EB
0x1d9a RET              ; C9

0x1d9b CALL 0x0358      ; CD 58 03
0x1d9e OR A             ; B7
0x1d9f RET Z            ; C8
0x1da0 CP N             ; FE 60
0x1da2 CALL Z, 0x0384   ; CC 84 03
0x1da5 LD (0x4099), A   ; 32 99 40
0x1da8 DEC A            ; 3D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; STOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1da9 RET NZ           ; C0
0x1daa INC A            ; 3C
0x1dab JP 0x1DB4        ; C3 B4 1D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1dae RET NZ           ; C0
0x1daf PUSH AF          ; F5
0x1db0 CALL Z, 0x41BB   ; CC BB 41
0x1db3 POP AF           ; F1
0x1db4 LD (0x40E6), HL  ; 22 E6 40
0x1db7 LD HL, 0x40B5    ; 21 B5 40
0x1dba LD (0x40B3), HL  ; 22 B3 40
0x1dbd LD HL, 0xFFF6    ; 21 F6 FF
0x1dbe OR N             ; F6 FF
0x1dc0 POP BC           ; C1
0x1dc1 LD HL, (0x40A2)  ; 2A A2 40
0x1dc4 PUSH HL          ; E5
0x1dc5 PUSH AF          ; F5
0x1dc6 LD A, L          ; 7D
0x1dc7 AND H            ; A4
0x1dc8 INC A            ; 3C
0x1dc9 JR Z, 0x0B       ; 28 09
0x1dcb LD (0x40F5), HL  ; 22 F5 40
0x1dce LD HL, (0x40E6)  ; 2A E6 40
0x1dd1 LD (0x40F7), HL  ; 22 F7 40
0x1dd4 CALL 0x038B      ; CD 8B 03
0x1dd7 CALL 0x20F9      ; CD F9 20
0x1dda POP AF           ; F1
0x1ddb LD HL, 0x1930    ; 21 30 19
0x1dde JP NZ, 0x1A06    ; C2 06 1A
0x1de1 JP 0x1A18        ; C3 18 1A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1de4 LD HL, (0x40F7)  ; 2A F7 40
0x1de7 LD A, H          ; 7C
0x1de8 OR L             ; B5
0x1de9 LD E, 0x20       ; 1E 20
0x1deb JP Z, 0x19A2     ; CA A2 19
0x1dee EX DE, HL        ; EB
0x1def LD HL, (0x40F5)  ; 2A F5 40
0x1df2 LD (0x40A2), HL  ; 22 A2 40
0x1df5 EX DE, HL        ; EB
0x1df6 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TRON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1df7 LD A, 0xAF       ; 3E AF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TROFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1df8 XOR A            ; AF
0x1df9 LD (0x411B), A   ; 32 1B 41
0x1dfc RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEFSTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e00 LD E, 0x03       ; 1E 03
0x1e02 LD BC, 0x021E    ; 01 1E 02

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEFINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e03 LD E, 0x02       ; 1E 02
0x1e05 LD BC, 0x041E    ; 01 1E 04

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEFSNG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e06 LD E, 0x04       ; 1E 04
0x1e08 LD BC, 0x081E    ; 01 1E 08

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEFDBL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e09 LD E, 0x08       ; 1E 08
0x1e0b CALL 0x1E3D      ; CD 3D 1E
0x1e0e LD BC, 0x1997    ; 01 97 19
0x1e11 PUSH BC          ; C5
0x1e12 RET C            ; D8
0x1e13 SUB N            ; D6 41
0x1e15 LD C, A          ; 4F
0x1e16 LD B, A          ; 47
0x1e17 RST 10H          ; D7
0x1e18 CP N             ; FE CE
0x1e1a JR NZ, 0x0B      ; 20 09
0x1e1c RST 10H          ; D7
0x1e1d CALL 0x1E3D      ; CD 3D 1E
0x1e20 RET C            ; D8
0x1e21 SUB N            ; D6 41
0x1e23 LD B, A          ; 47
0x1e24 RST 10H          ; D7
0x1e25 LD A, B          ; 78
0x1e26 SUB C            ; 91
0x1e27 RET C            ; D8
0x1e28 INC A            ; 3C
0x1e29 EX (SP), HL      ; E3
0x1e2a LD HL, 0x4101    ; 21 01 41
0x1e2d LD B, 0x00       ; 06 00
0x1e2f ADD HL, BC       ; 09
0x1e30 LD (HL), E       ; 73
0x1e31 INC HL           ; 23
0x1e32 DEC A            ; 3D
0x1e33 JR NZ, -0x03     ; 20 FB
0x1e35 POP HL           ; E1
0x1e36 LD A, (HL)       ; 7E
0x1e37 CP N             ; FE 2C
0x1e39 RET NZ           ; C0
0x1e3a RST 10H          ; D7
0x1e3b JR -0x30         ; 18 CE

0x1e3d LD A, (HL)       ; 7E
0x1e3e CP N             ; FE 41
0x1e40 RET C            ; D8
0x1e41 CP N             ; FE 5B
0x1e43 CCF              ; 3F
0x1e44 RET              ; C9

0x1e46 CALL 0x2B02      ; CD 02 2B
0x1e49 RET P            ; F0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FCERR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e4a LD E, 0x08       ; 1E 08
0x1e4c JP 0x19A2        ; C3 A2 19

0x1e4f LD A, (HL)       ; 7E
0x1e50 CP N             ; FE 2E
0x1e52 EX DE, HL        ; EB
0x1e53 LD HL, (0x40EC)  ; 2A EC 40
0x1e56 EX DE, HL        ; EB
0x1e57 JP Z, 0x1D78     ; CA 78 1D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e5a DEC HL           ; 2B
0x1e5b LD DE, 0x0000    ; 11 00 00
0x1e5e RST 10H          ; D7
0x1e5f RET NC           ; D0
0x1e60 PUSH HL          ; E5
0x1e61 PUSH AF          ; F5
0x1e62 LD HL, 0x1998    ; 21 98 19
0x1e65 RST 18H          ; DF
0x1e66 JP C, 0x1997     ; DA 97 19
0x1e69 LD H, D          ; 62
0x1e6a LD L, E          ; 6B
0x1e6b ADD HL, DE       ; 19
0x1e6c ADD HL, HL       ; 29
0x1e6d ADD HL, DE       ; 19
0x1e6e ADD HL, HL       ; 29
0x1e6f POP AF           ; F1
0x1e70 SUB N            ; D6 30
0x1e72 LD E, A          ; 5F
0x1e73 LD D, 0x00       ; 16 00
0x1e75 ADD HL, DE       ; 19
0x1e76 EX DE, HL        ; EB
0x1e77 POP HL           ; E1
0x1e78 JR -0x1A         ; 18 E4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CLEAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1e7a JP Z, 0x1B61     ; CA 61 1B
0x1e7d CALL 0x1E46      ; CD 46 1E
0x1e80 DEC HL           ; 2B
0x1e81 RST 10H          ; D7
0x1e82 RET NZ           ; C0
0x1e83 PUSH HL          ; E5
0x1e84 LD HL, (0x40B1)  ; 2A B1 40
0x1e87 LD A, L          ; 7D
0x1e88 SUB E            ; 93
0x1e89 LD E, A          ; 5F
0x1e8a LD A, H          ; 7C
0x1e8b SBC D            ; 9A
0x1e8c LD D, A          ; 57
0x1e8d JP C, 0x197A     ; DA 7A 19
0x1e90 LD HL, (0x40F9)  ; 2A F9 40
0x1e93 LD BC, 0x0028    ; 01 28 00
0x1e96 ADD HL, BC       ; 09
0x1e97 RST 18H          ; DF
0x1e98 JP NC, 0x197A    ; D2 7A 19
0x1e9b EX DE, HL        ; EB
0x1e9c LD (0x40A0), HL  ; 22 A0 40
0x1e9f POP HL           ; E1
0x1ea0 JP 0x1B61        ; C3 61 1B

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RUN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1ea3 JP Z, 0x1B5D     ; CA 5D 1B
0x1ea6 CALL 0x41C7      ; CD C7 41
0x1ea9 CALL 0x1B61      ; CD 61 1B
0x1eac LD BC, 0x1D1E    ; 01 1E 1D
0x1eaf JR 0x12          ; 18 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GOSUB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1eb1 LD C, 0x03       ; 0E 03
0x1eb3 CALL 0x1963      ; CD 63 19
0x1eb6 POP BC           ; C1
0x1eb7 PUSH HL          ; E5
0x1eb8 PUSH HL          ; E5
0x1eb9 LD HL, (0x40A2)  ; 2A A2 40
0x1ebc EX (SP), HL      ; E3
0x1ebd LD A, 0x91       ; 3E 91
0x1ebf PUSH AF          ; F5
0x1ec0 INC SP           ; 33
0x1ec1 PUSH BC          ; C5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GOTO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1ec2 CALL 0x1E5A      ; CD 5A 1E
0x1ec5 CALL 0x1F07      ; CD 07 1F
0x1ec8 PUSH HL          ; E5
0x1ec9 LD HL, (0x40A2)  ; 2A A2 40
0x1ecc RST 18H          ; DF
0x1ecd POP HL           ; E1
0x1ece INC HL           ; 23
0x1ecf CALL C, 0x1B2F   ; DC 2F 1B
0x1ed2 CALL NC, 0x1B2C  ; D4 2C 1B
0x1ed5 LD H, B          ; 60
0x1ed6 LD L, C          ; 69
0x1ed7 DEC HL           ; 2B
0x1ed8 RET C            ; D8
0x1ed9 LD E, 0x0E       ; 1E 0E
0x1edb JP 0x19A2        ; C3 A2 19

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RETURN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1ede RET NZ           ; C0
0x1edf LD D, 0xFF       ; 16 FF
0x1ee1 CALL 0x1936      ; CD 36 19
0x1ee4 LD SP, HL        ; F9
0x1ee5 LD (0x40E8), HL  ; 22 E8 40
0x1ee8 CP N             ; FE 91
0x1eea LD E, 0x04       ; 1E 04
0x1eec JP NZ, 0x19A2    ; C2 A2 19
0x1eef POP HL           ; E1
0x1ef0 LD (0x40A2), HL  ; 22 A2 40
0x1ef3 INC HL           ; 23
0x1ef4 LD A, H          ; 7C
0x1ef5 OR L             ; B5
0x1ef6 JR NZ, 0x09      ; 20 07
0x1ef8 LD A, (0x40DD)   ; 3A DD 40
0x1efb OR A             ; B7
0x1efc JP NZ, 0x1A18    ; C2 18 1A
0x1eff LD HL, 0x1D1E    ; 21 1E 1D
0x1f02 EX (SP), HL      ; E3
0x1f03 LD A, 0xE1       ; 3E E1
0x1f04 POP HL           ; E1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1f05 LD BC, 0x0E3A    ; 01 3A 0E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; REM/ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1f07 LD C, 0x00       ; 0E 00
0x1f08 NOP              ; 00
0x1f09 LD B, 0x00       ; 06 00
0x1f0b LD A, C          ; 79
0x1f0c LD C, B          ; 48
0x1f0d LD B, A          ; 47
0x1f0e LD A, (HL)       ; 7E
0x1f0f OR A             ; B7
0x1f10 RET Z            ; C8
0x1f11 CP B             ; B8
0x1f12 RET Z            ; C8
0x1f13 INC HL           ; 23
0x1f14 CP N             ; FE 22
0x1f16 JR Z, -0x0B      ; 28 F3
0x1f18 SUB N            ; D6 8F
0x1f1a JR NZ, -0x0C     ; 20 F2
0x1f1c CP B             ; B8
0x1f1d ADC A, D         ; 8A
0x1f1e LD D, A          ; 57
0x1f1f JR -0x11         ; 18 ED

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVALU
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1f21 CALL 0x260D      ; CD 0D 26
0x1f24 RST 8H           ; CF
0x1f25 PUSH DE          ; D5
0x1f26 EX DE, HL        ; EB
0x1f27 LD (0x40DF), HL  ; 22 DF 40
0x1f2a EX DE, HL        ; EB
0x1f2b PUSH DE          ; D5
0x1f2c RST 20H          ; E7
0x1f2d PUSH AF          ; F5
0x1f2e CALL 0x2337      ; CD 37 23
0x1f31 POP AF           ; F1
0x1f32 EX (SP), HL      ; E3
0x1f33 ADD A, 0x03      ; C6 03
0x1f35 CALL 0x2819      ; CD 19 28
0x1f38 CALL 0x0A03      ; CD 03 0A
0x1f3b PUSH HL          ; E5
0x1f3c JR NZ, 0x2A      ; 20 28
0x1f3e LD HL, (0x4121)  ; 2A 21 41
0x1f41 PUSH HL          ; E5
0x1f42 INC HL           ; 23
0x1f43 LD E, (HL)       ; 5E
0x1f44 INC HL           ; 23
0x1f45 LD D, (HL)       ; 56
0x1f46 LD HL, (0x40A4)  ; 2A A4 40
0x1f49 RST 18H          ; DF
0x1f4a JR NC, 0x10      ; 30 0E
0x1f4c LD HL, (0x40A0)  ; 2A A0 40
0x1f4f RST 18H          ; DF
0x1f50 POP DE           ; D1
0x1f51 JR NC, 0x11      ; 30 0F
0x1f53 LD HL, (0x40F9)  ; 2A F9 40
0x1f56 RST 18H          ; DF
0x1f57 JR NC, 0x0B      ; 30 09
0x1f59 LD A, 0xD1       ; 3E D1
0x1f5a POP DE           ; D1
0x1f5b CALL 0x29F5      ; CD F5 29
0x1f5e EX DE, HL        ; EB
0x1f5f CALL 0x2843      ; CD 43 28
0x1f62 CALL 0x29F5      ; CD F5 29
0x1f65 EX (SP), HL      ; E3
0x1f66 CALL 0x09D3      ; CD D3 09
0x1f69 POP DE           ; D1
0x1f6a POP HL           ; E1
0x1f6b RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1f6c CP N             ; FE 9E
0x1f6e JR NZ, 0x27      ; 20 25
0x1f70 RST 10H          ; D7
0x1f71 RST 8H           ; CF
0x1f72 ADC A, L         ; 8D
0x1f73 CALL 0x1E5A      ; CD 5A 1E
0x1f76 LD A, D          ; 7A
0x1f77 OR E             ; B3
0x1f78 JR Z, 0x0B       ; 28 09
0x1f7a CALL 0x1B2A      ; CD 2A 1B
0x1f7d LD D, B          ; 50
0x1f7e LD E, C          ; 59
0x1f7f POP HL           ; E1
0x1f80 JP NC, 0x1ED9    ; D2 D9 1E
0x1f83 EX DE, HL        ; EB
0x1f84 LD (0x40F0), HL  ; 22 F0 40
0x1f87 EX DE, HL        ; EB
0x1f88 RET C            ; D8
0x1f89 LD A, (0x40F2)   ; 3A F2 40
0x1f8c OR A             ; B7
0x1f8d RET Z            ; C8
0x1f8e LD A, (0x409A)   ; 3A 9A 40
0x1f91 LD E, A          ; 5F
0x1f92 JP 0x19AB        ; C3 AB 19

0x1f95 CALL 0x2B1C      ; CD 1C 2B
0x1f98 LD A, (HL)       ; 7E
0x1f99 LD B, A          ; 47
0x1f9a CP N             ; FE 91
0x1f9c JR Z, 0x05       ; 28 03
0x1f9e RST 8H           ; CF
0x1f9f ADC A, L         ; 8D
0x1fa0 DEC HL           ; 2B
0x1fa1 LD C, E          ; 4B
0x1fa2 DEC C            ; 0D
0x1fa3 LD A, B          ; 78
0x1fa4 JP Z, 0x1D60     ; CA 60 1D
0x1fa7 CALL 0x1E5B      ; CD 5B 1E
0x1faa CP N             ; FE 2C
0x1fac RET NZ           ; C0
0x1fad JR -0x0B         ; 18 F3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RESUME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1faf LD DE, 0x40F2    ; 11 F2 40
0x1fb2 LD A, (DE)       ; 1A
0x1fb3 OR A             ; B7
0x1fb4 JP Z, 0x19A0     ; CA A0 19
0x1fb7 INC A            ; 3C
0x1fb8 LD (0x409A), A   ; 32 9A 40
0x1fbb LD (DE), A       ; 12
0x1fbc LD A, (HL)       ; 7E
0x1fbd CP N             ; FE 87
0x1fbf JR Z, 0x0E       ; 28 0C
0x1fc1 CALL 0x1E5A      ; CD 5A 1E
0x1fc4 RET NZ           ; C0
0x1fc5 LD A, D          ; 7A
0x1fc6 OR E             ; B3
0x1fc7 JP NZ, 0x1EC5    ; C2 C5 1E
0x1fca INC A            ; 3C
0x1fcb JR 0x04          ; 18 02

0x1fcd RST 10H          ; D7
0x1fce RET NZ           ; C0
0x1fcf LD HL, (0x40EE)  ; 2A EE 40
0x1fd2 EX DE, HL        ; EB
0x1fd3 LD HL, (0x40EA)  ; 2A EA 40
0x1fd6 LD (0x40A2), HL  ; 22 A2 40
0x1fd9 EX DE, HL        ; EB
0x1fda RET NZ           ; C0
0x1fdb LD A, (HL)       ; 7E
0x1fdc OR A             ; B7
0x1fdd JR NZ, 0x06      ; 20 04
0x1fdf INC HL           ; 23
0x1fe0 INC HL           ; 23
0x1fe1 INC HL           ; 23
0x1fe2 INC HL           ; 23
0x1fe3 INC HL           ; 23
0x1fe4 LD A, D          ; 7A
0x1fe5 AND E            ; A3
0x1fe6 INC A            ; 3C
0x1fe7 JP NZ, 0x1F05    ; C2 05 1F
0x1fea LD A, (0x40DD)   ; 3A DD 40
0x1fed DEC A            ; 3D
0x1fee JP Z, 0x1DBE     ; CA BE 1D
0x1ff1 JP 0x1F05        ; C3 05 1F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ERROR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x1ff4 CALL 0x2B1C      ; CD 1C 2B
0x1ff7 RET NZ           ; C0
0x1ff8 OR A             ; B7
0x1ff9 JP Z, 0x1E4A     ; CA 4A 1E
0x1ffc DEC A            ; 3D
0x1ffd ADD A, A         ; 87
0x1ffe LD E, A          ; 5F
0x1fff CP N             ; FE 2D
0x2001 JR C, 0x04       ; 38 02
0x2003 LD E, 0x26       ; 1E 26
0x2005 JP 0x19A2        ; C3 A2 19

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AUTO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2008 LD DE, 0x000A    ; 11 0A 00
0x200b PUSH DE          ; D5
0x200c JR Z, 0x19       ; 28 17
0x200e CALL 0x1E4F      ; CD 4F 1E
0x2011 EX DE, HL        ; EB
0x2012 EX (SP), HL      ; E3
0x2013 JR Z, 0x13       ; 28 11
0x2015 EX DE, HL        ; EB
0x2016 RST 8H           ; CF
0x2017 INC L            ; 2C
0x2018 EX DE, HL        ; EB
0x2019 LD HL, (0x40E4)  ; 2A E4 40
0x201c EX DE, HL        ; EB
0x201d JR Z, 0x08       ; 28 06
0x201f CALL 0x1E5A      ; CD 5A 1E
0x2022 JP NZ, 0x1997    ; C2 97 19
0x2025 EX DE, HL        ; EB
0x2026 LD A, H          ; 7C
0x2027 OR L             ; B5
0x2028 JP Z, 0x1E4A     ; CA 4A 1E
0x202b LD (0x40E4), HL  ; 22 E4 40
0x202e LD (0x40E1), A   ; 32 E1 40
0x2031 POP HL           ; E1
0x2032 LD (0x40E2), HL  ; 22 E2 40
0x2035 POP BC           ; C1
0x2036 JP 0x1A33        ; C3 33 1A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2039 CALL 0x2337      ; CD 37 23
0x203c LD A, (HL)       ; 7E
0x203d CP N             ; FE 2C
0x203f CALL Z, 0x1D78   ; CC 78 1D
0x2042 CP N             ; FE CA
0x2044 CALL Z, 0x1D78   ; CC 78 1D
0x2047 DEC HL           ; 2B
0x2048 PUSH HL          ; E5
0x2049 CALL 0x0994      ; CD 94 09
0x204c POP HL           ; E1
0x204d JR Z, 0x09       ; 28 07
0x204f RST 10H          ; D7
0x2050 JP C, 0x1EC2     ; DA C2 1E
0x2053 JP 0x1D5F        ; C3 5F 1D

0x2056 LD D, 0x01       ; 16 01
0x2058 CALL 0x1F05      ; CD 05 1F
0x205b OR A             ; B7
0x205c RET Z            ; C8
0x205d RST 10H          ; D7
0x205e CP N             ; FE 95
0x2060 JR NZ, -0x08     ; 20 F6
0x2062 DEC D            ; 15
0x2063 JR NZ, -0x0B     ; 20 F3
0x2065 JR -0x16         ; 18 E8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LPRINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2067 LD A, 0x01       ; 3E 01
0x2069 LD (0x409C), A   ; 32 9C 40
0x206c JP 0x207C        ; C3 7C 20

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PRINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x206f CALL 0x41CA      ; CD CA 41
0x2072 CP N             ; FE 23
0x2074 JR NZ, 0x08      ; 20 06
0x2076 CALL 0x0284      ; CD 84 02
0x2079 LD (0x409C), A   ; 32 9C 40
0x207c DEC HL           ; 2B
0x207d RST 10H          ; D7
0x207e CALL Z, 0x20FE   ; CC FE 20
0x2081 JP Z, 0x2169     ; CA 69 21
0x2084 OR N             ; F6 20
0x2086 CP N             ; FE 60
0x2088 JR NZ, 0x1D      ; 20 1B
0x208a CALL 0x2B01      ; CD 01 2B
0x208d CP N             ; FE 04
0x208f JP NC, 0x1E4A    ; D2 4A 1E
0x2092 PUSH HL          ; E5
0x2093 LD HL, 0x3C00    ; 21 00 3C
0x2096 ADD HL, DE       ; 19
0x2097 LD (0x4020), HL  ; 22 20 40
0x209a LD A, E          ; 7B
0x209b AND N            ; E6 3F
0x209d LD (0x40A6), A   ; 32 A6 40
0x20a0 POP HL           ; E1
0x20a1 RST 8H           ; CF
0x20a2 INC L            ; 2C
0x20a3 JR -0x37         ; 18 C7

0x20a5 LD A, (HL)       ; 7E
0x20a6 CP N             ; FE BF
0x20a8 JP Z, 0x2CBD     ; CA BD 2C
0x20ab CP N             ; FE BC
0x20ad JP Z, 0x2137     ; CA 37 21
0x20b0 PUSH HL          ; E5
0x20b1 CP N             ; FE 2C
0x20b3 JR Z, 0x55       ; 28 53
0x20b5 CP N             ; FE 3B
0x20b7 JR Z, 0x60       ; 28 5E
0x20b9 CALL 0x2337      ; CD 37 23
0x20bc EX (SP), HL      ; E3
0x20bd RST 20H          ; E7
0x20be JR Z, 0x34       ; 28 32
0x20c0 CALL 0x0FBD      ; CD BD 0F
0x20c3 CALL 0x2865      ; CD 65 28
0x20c6 CALL 0x41CD      ; CD CD 41
0x20c9 LD HL, (0x4121)  ; 2A 21 41
0x20cc LD A, (0x409C)   ; 3A 9C 40
0x20cf OR A             ; B7
0x20d0 JP M, 0x20E9     ; FA E9 20
0x20d3 JR Z, 0x0A       ; 28 08
0x20d5 LD A, (0x409B)   ; 3A 9B 40
0x20d8 ADD A, (HL)      ; 86
0x20d9 CP N             ; FE 84
0x20db JR 0x0B          ; 18 09

0x20dd LD A, (0x409D)   ; 3A 9D 40
0x20e0 LD B, A          ; 47
0x20e1 LD A, (0x40A6)   ; 3A A6 40
0x20e4 ADD A, (HL)      ; 86
0x20e5 CP B             ; B8
0x20e6 CALL NC, 0x20FE  ; D4 FE 20
0x20e9 CALL 0x28AA      ; CD AA 28
0x20ec LD A, 0x20       ; 3E 20
0x20ee CALL 0x032A      ; CD 2A 03
0x20f1 OR A             ; B7
0x20f2 CALL Z, 0x28AA   ; CC AA 28
0x20f5 POP HL           ; E1
0x20f6 JP 0x207C        ; C3 7C 20

0x20f9 LD A, (0x40A6)   ; 3A A6 40
0x20fc OR A             ; B7
0x20fd RET Z            ; C8
0x20fe LD A, 0x0D       ; 3E 0D
0x2100 CALL 0x032A      ; CD 2A 03
0x2103 CALL 0x41D0      ; CD D0 41
0x2106 XOR A            ; AF
0x2107 RET              ; C9

0x2108 CALL 0x41D3      ; CD D3 41
0x210b LD A, (0x409C)   ; 3A 9C 40
0x210e OR A             ; B7
0x210f JP P, 0x2119     ; F2 19 21
0x2112 LD A, 0x2C       ; 3E 2C
0x2114 CALL 0x032A      ; CD 2A 03
0x2117 JR 0x4D          ; 18 4B

0x2119 JR Z, 0x0A       ; 28 08
0x211b LD A, (0x409B)   ; 3A 9B 40
0x211e CP N             ; FE 70
0x2120 JP 0x212B        ; C3 2B 21

0x2123 LD A, (0x409E)   ; 3A 9E 40
0x2126 LD B, A          ; 47
0x2127 LD A, (0x40A6)   ; 3A A6 40
0x212a CP B             ; B8
0x212b CALL NC, 0x20FE  ; D4 FE 20
0x212e JR NC, 0x36      ; 30 34
0x2130 SUB N            ; D6 10
0x2132 JR NC, -0x02     ; 30 FC
0x2134 CPL              ; 2F
0x2135 JR 0x25          ; 18 23

0x2137 CALL 0x2B1B      ; CD 1B 2B
0x213a AND N            ; E6 7F
0x213c LD E, A          ; 5F
0x213d RST 8H           ; CF
0x213e ADD HL, HL       ; 29
0x213f DEC HL           ; 2B
0x2140 PUSH HL          ; E5
0x2141 CALL 0x41D3      ; CD D3 41
0x2144 LD A, (0x409C)   ; 3A 9C 40
0x2147 OR A             ; B7
0x2148 JP M, 0x1E4A     ; FA 4A 1E
0x214b JP Z, 0x2153     ; CA 53 21
0x214e LD A, (0x409B)   ; 3A 9B 40
0x2151 JR 0x05          ; 18 03

0x2153 LD A, (0x40A6)   ; 3A A6 40
0x2156 CPL              ; 2F
0x2157 ADD A, E         ; 83
0x2158 JR NC, 0x0C      ; 30 0A
0x215a INC A            ; 3C
0x215b LD B, A          ; 47
0x215c LD A, 0x20       ; 3E 20
0x215e CALL 0x032A      ; CD 2A 03
0x2161 DEC B            ; 05
0x2162 JR NZ, -0x04     ; 20 FA
0x2164 POP HL           ; E1
0x2165 RST 10H          ; D7
0x2166 JP 0x2081        ; C3 81 20

0x2169 LD A, (0x409C)   ; 3A 9C 40
0x216c OR A             ; B7
0x216d CALL M, 0x01F8   ; FC F8 01
0x2170 XOR A            ; AF
0x2171 LD (0x409C), A   ; 32 9C 40
0x2174 CALL 0x41BE      ; CD BE 41
0x2177 RET              ; C9

0x217f LD A, (0x40DE)   ; 3A DE 40
0x2182 OR A             ; B7
0x2183 JP NZ, 0x1991    ; C2 91 19
0x2186 LD A, (0x40A9)   ; 3A A9 40
0x2189 OR A             ; B7
0x218a LD E, 0x2A       ; 1E 2A
0x218c JP Z, 0x19A2     ; CA A2 19
0x218f POP BC           ; C1
0x2190 LD HL, 0x2178    ; 21 78 21
0x2193 CALL 0x28A7      ; CD A7 28
0x2196 LD HL, (0x40E6)  ; 2A E6 40
0x2199 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INPUT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x219a CALL 0x2828      ; CD 28 28
0x219d LD A, (HL)       ; 7E
0x219e CALL 0x41D6      ; CD D6 41
0x21a1 SUB N            ; D6 23
0x21a3 LD (0x40A9), A   ; 32 A9 40
0x21a6 LD A, (HL)       ; 7E
0x21a7 JR NZ, 0x22      ; 20 20
0x21a9 CALL 0x0293      ; CD 93 02
0x21ac PUSH HL          ; E5
0x21ad LD B, 0xFA       ; 06 FA
0x21af LD HL, (0x40A7)  ; 2A A7 40
0x21b2 CALL 0x0235      ; CD 35 02
0x21b5 LD (HL), A       ; 77
0x21b6 INC HL           ; 23
0x21b7 CP N             ; FE 0D
0x21b9 JR Z, 0x04       ; 28 02
0x21bb DJNZ N           ; 10 F5
0x21bd DEC HL           ; 2B
0x21be LD (HL), 0x00    ; 36 00
0x21c0 CALL 0x01F8      ; CD F8 01
0x21c3 LD HL, (0x40A7)  ; 2A A7 40
0x21c6 DEC HL           ; 2B
0x21c7 JR 0x24          ; 18 22

0x21c9 LD BC, 0x21DB    ; 01 DB 21
0x21cc PUSH BC          ; C5
0x21cd CP N             ; FE 22
0x21cf RET NZ           ; C0
0x21d0 CALL 0x2866      ; CD 66 28
0x21d3 RST 8H           ; CF
0x21d4 DEC SP           ; 3B
0x21d5 PUSH HL          ; E5
0x21d6 CALL 0x28AA      ; CD AA 28
0x21d9 POP HL           ; E1
0x21da RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MVSTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x21e3 INC HL           ; 23
0x21e4 LD A, (HL)       ; 7E
0x21e5 OR A             ; B7
0x21e6 DEC HL           ; 2B
0x21e7 PUSH BC          ; C5
0x21e8 JP Z, 0x1F04     ; CA 04 1F
0x21eb LD (HL), 0x2C    ; 36 2C
0x21ed JR 0x07          ; 18 05

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; READ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x21ef PUSH HL          ; E5
0x21f0 LD HL, (0x40FF)  ; 2A FF 40
0x21f3 OR N             ; F6 AF
0x21f4 XOR A            ; AF
0x21f5 LD (0x40DE), A   ; 32 DE 40
0x21f8 EX (SP), HL      ; E3
0x21f9 JR 0x04          ; 18 02

0x21fb RST 8H           ; CF
0x21fc INC L            ; 2C
0x21fd CALL 0x260D      ; CD 0D 26
0x2200 EX (SP), HL      ; E3
0x2201 PUSH DE          ; D5
0x2202 LD A, (HL)       ; 7E
0x2203 CP N             ; FE 2C
0x2205 JR Z, 0x28       ; 28 26
0x2207 LD A, (0x40DE)   ; 3A DE 40
0x220a OR A             ; B7
0x220b JP NZ, 0x2296    ; C2 96 22
0x220e LD A, (0x40A9)   ; 3A A9 40
0x2211 OR A             ; B7
0x2212 LD E, 0x06       ; 1E 06
0x2214 JP Z, 0x19A2     ; CA A2 19
0x2217 LD A, 0x3F       ; 3E 3F
0x2219 CALL 0x032A      ; CD 2A 03
0x221c CALL 0x1BB3      ; CD B3 1B
0x221f POP DE           ; D1
0x2220 POP BC           ; C1
0x2221 JP C, 0x1DBE     ; DA BE 1D
0x2224 INC HL           ; 23
0x2225 LD A, (HL)       ; 7E
0x2226 OR A             ; B7
0x2227 DEC HL           ; 2B
0x2228 PUSH BC          ; C5
0x2229 JP Z, 0x1F04     ; CA 04 1F
0x222c PUSH DE          ; D5
0x222d CALL 0x41DC      ; CD DC 41
0x2230 RST 20H          ; E7
0x2231 PUSH AF          ; F5
0x2232 JR NZ, 0x1B      ; 20 19
0x2234 RST 10H          ; D7
0x2235 LD D, A          ; 57
0x2236 LD B, A          ; 47
0x2237 CP N             ; FE 22
0x2239 JR Z, 0x07       ; 28 05
0x223b LD D, 0x3A       ; 16 3A
0x223d LD B, 0x2C       ; 06 2C
0x223f DEC HL           ; 2B
0x2240 CALL 0x2869      ; CD 69 28
0x2243 POP AF           ; F1
0x2244 EX DE, HL        ; EB
0x2245 LD HL, 0x225A    ; 21 5A 22
0x2248 EX (SP), HL      ; E3
0x2249 PUSH DE          ; D5
0x224a JP 0x1F33        ; C3 33 1F

0x224d RST 10H          ; D7
0x224e POP AF           ; F1
0x224f PUSH AF          ; F5
0x2250 LD BC, 0x2243    ; 01 43 22
0x2253 PUSH BC          ; C5
0x2254 JP C, 0x0E6C     ; DA 6C 0E
0x2257 JP NC, 0x0E65    ; D2 65 0E
0x225a DEC HL           ; 2B
0x225b RST 10H          ; D7
0x225c JR Z, 0x07       ; 28 05
0x225e CP N             ; FE 2C
0x2260 JP NZ, 0x217F    ; C2 7F 21
0x2263 EX (SP), HL      ; E3
0x2264 DEC HL           ; 2B
0x2265 RST 10H          ; D7
0x2266 JP NZ, 0x21FB    ; C2 FB 21
0x2269 POP DE           ; D1
0x226a NOP              ; 00
0x226b NOP              ; 00
0x226c NOP              ; 00
0x226d NOP              ; 00
0x226e NOP              ; 00
0x226f LD A, (0x40DE)   ; 3A DE 40
0x2272 OR A             ; B7
0x2273 EX DE, HL        ; EB
0x2274 JP NZ, 0x1D96    ; C2 96 1D
0x2277 PUSH DE          ; D5
0x2278 CALL 0x41DF      ; CD DF 41
0x227b OR (HL)          ; B6
0x227c LD HL, 0x2286    ; 21 86 22
0x227f CALL NZ, 0x28A7  ; C4 A7 28
0x2282 POP HL           ; E1
0x2283 JP 0x2169        ; C3 69 21

0x2296 CALL 0x1F05      ; CD 05 1F
0x2299 OR A             ; B7
0x229a JR NZ, 0x14      ; 20 12
0x229c INC HL           ; 23
0x229d LD A, (HL)       ; 7E
0x229e INC HL           ; 23
0x229f OR (HL)          ; B6
0x22a0 LD E, 0x06       ; 1E 06
0x22a2 JP Z, 0x19A2     ; CA A2 19
0x22a5 INC HL           ; 23
0x22a6 LD E, (HL)       ; 5E
0x22a7 INC HL           ; 23
0x22a8 LD D, (HL)       ; 56
0x22a9 EX DE, HL        ; EB
0x22aa LD (0x40DA), HL  ; 22 DA 40
0x22ad EX DE, HL        ; EB
0x22ae RST 10H          ; D7
0x22af CP N             ; FE 88
0x22b1 JR NZ, -0x1B     ; 20 E3
0x22b3 JP 0x222D        ; C3 2D 22

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x22b6 LD DE, 0x0000    ; 11 00 00
0x22b9 CALL NZ, 0x260D  ; C4 0D 26
0x22bc LD (0x40DF), HL  ; 22 DF 40
0x22bf CALL 0x1936      ; CD 36 19
0x22c2 JP NZ, 0x199D    ; C2 9D 19
0x22c5 LD SP, HL        ; F9
0x22c6 LD (0x40E8), HL  ; 22 E8 40
0x22c9 PUSH DE          ; D5
0x22ca LD A, (HL)       ; 7E
0x22cb INC HL           ; 23
0x22cc PUSH AF          ; F5
0x22cd PUSH DE          ; D5
0x22ce LD A, (HL)       ; 7E
0x22cf INC HL           ; 23
0x22d0 OR A             ; B7
0x22d1 JP M, 0x22EA     ; FA EA 22
0x22d4 CALL 0x09B1      ; CD B1 09
0x22d7 EX (SP), HL      ; E3
0x22d8 PUSH HL          ; E5
0x22d9 CALL 0x070B      ; CD 0B 07
0x22dc POP HL           ; E1
0x22dd CALL 0x09CB      ; CD CB 09
0x22e0 POP HL           ; E1
0x22e1 CALL 0x09C2      ; CD C2 09
0x22e4 PUSH HL          ; E5
0x22e5 CALL 0x0A0C      ; CD 0C 0A
0x22e8 JR 0x2B          ; 18 29

0x22ea INC HL           ; 23
0x22eb INC HL           ; 23
0x22ec INC HL           ; 23
0x22ed INC HL           ; 23
0x22ee LD C, (HL)       ; 4E
0x22ef INC HL           ; 23
0x22f0 LD B, (HL)       ; 46
0x22f1 INC HL           ; 23
0x22f2 EX (SP), HL      ; E3
0x22f3 LD E, (HL)       ; 5E
0x22f4 INC HL           ; 23
0x22f5 LD D, (HL)       ; 56
0x22f6 PUSH HL          ; E5
0x22f7 LD L, C          ; 69
0x22f8 LD H, B          ; 60
0x22f9 CALL 0x0BD2      ; CD D2 0B
0x22fc LD A, (0x40AF)   ; 3A AF 40
0x22ff CP N             ; FE 04
0x2301 JP Z, 0x07B2     ; CA B2 07
0x2304 EX DE, HL        ; EB
0x2305 POP HL           ; E1
0x2306 LD (HL), D       ; 72
0x2307 DEC HL           ; 2B
0x2308 LD (HL), E       ; 73
0x2309 POP HL           ; E1
0x230a PUSH DE          ; D5
0x230b LD E, (HL)       ; 5E
0x230c INC HL           ; 23
0x230d LD D, (HL)       ; 56
0x230e INC HL           ; 23
0x230f EX (SP), HL      ; E3
0x2310 CALL 0x0A39      ; CD 39 0A
0x2313 POP HL           ; E1
0x2314 POP BC           ; C1
0x2315 SUB B            ; 90
0x2316 CALL 0x09C2      ; CD C2 09
0x2319 JR Z, 0x0B       ; 28 09
0x231b EX DE, HL        ; EB
0x231c LD (0x40A2), HL  ; 22 A2 40
0x231f LD L, C          ; 69
0x2320 LD H, B          ; 60
0x2321 JP 0x1D1A        ; C3 1A 1D

0x2324 LD SP, HL        ; F9
0x2325 LD (0x40E8), HL  ; 22 E8 40
0x2328 LD HL, (0x40DF)  ; 2A DF 40
0x232b LD A, (HL)       ; 7E
0x232c CP N             ; FE 2C
0x232e JP NZ, 0x1D1E    ; C2 1E 1D
0x2331 RST 10H          ; D7
0x2332 CALL 0x22B9      ; CD B9 22
0x2335 RST 8H           ; CF
0x2336 JR Z, 0x2D       ; 28 2B
0x2337 DEC HL           ; 2B
0x2338 LD D, 0x00       ; 16 00
0x233a PUSH DE          ; D5
0x233b LD C, 0x01       ; 0E 01
0x233d CALL 0x1963      ; CD 63 19
0x2340 CALL 0x249F      ; CD 9F 24
0x2343 LD (0x40F3), HL  ; 22 F3 40
0x2346 LD HL, (0x40F3)  ; 2A F3 40
0x2349 POP BC           ; C1
0x234a LD A, (HL)       ; 7E
0x234b LD D, 0x00       ; 16 00
0x234d SUB N            ; D6 D4
0x234f JR C, 0x15       ; 38 13
0x2351 CP N             ; FE 03
0x2353 JR NC, 0x11      ; 30 0F
0x2355 CP N             ; FE 01
0x2357 RLA              ; 17
0x2358 XOR D            ; AA
0x2359 CP D             ; BA
0x235a LD D, A          ; 57
0x235b JP C, 0x1997     ; DA 97 19
0x235e LD (0x40D8), HL  ; 22 D8 40
0x2361 RST 10H          ; D7
0x2362 JR -0x15         ; 18 E9

0x2363 JP (HL)          ; E9
0x2364 LD A, D          ; 7A
0x2365 OR A             ; B7
0x2366 JP NZ, 0x23EC    ; C2 EC 23
0x2369 LD A, (HL)       ; 7E
0x236a LD (0x40D8), HL  ; 22 D8 40
0x236d SUB N            ; D6 CD
0x236f RET C            ; D8
0x2370 CP N             ; FE 07
0x2372 RET NC           ; D0
0x2373 LD E, A          ; 5F
0x2374 LD A, (0x40AF)   ; 3A AF 40
0x2377 SUB N            ; D6 03
0x2379 OR E             ; B3
0x237a JP Z, 0x298F     ; CA 8F 29
0x237d LD HL, 0x189A    ; 21 9A 18
0x2380 ADD HL, DE       ; 19
0x2381 LD A, B          ; 78
0x2382 LD D, (HL)       ; 56
0x2383 CP D             ; BA
0x2384 RET NC           ; D0
0x2385 PUSH BC          ; C5
0x2386 LD BC, 0x2346    ; 01 46 23
0x2389 PUSH BC          ; C5
0x238a LD A, D          ; 7A
0x238b CP N             ; FE 7F
0x238d JP Z, 0x23D4     ; CA D4 23
0x2390 CP N             ; FE 51
0x2392 JP C, 0x23E1     ; DA E1 23
0x2395 LD HL, 0x4121    ; 21 21 41
0x2398 OR A             ; B7
0x2399 LD A, (0x40AF)   ; 3A AF 40
0x239c DEC A            ; 3D
0x239d DEC A            ; 3D
0x239e DEC A            ; 3D
0x239f JP Z, 0x0AF6     ; CA F6 0A
0x23a2 LD C, (HL)       ; 4E
0x23a3 INC HL           ; 23
0x23a4 LD B, (HL)       ; 46
0x23a5 PUSH BC          ; C5
0x23a6 JP M, 0x23C5     ; FA C5 23
0x23a9 INC HL           ; 23
0x23aa LD C, (HL)       ; 4E
0x23ab INC HL           ; 23
0x23ac LD B, (HL)       ; 46
0x23ad PUSH BC          ; C5
0x23ae PUSH AF          ; F5
0x23af OR A             ; B7
0x23b0 JP PO, 0x23C4    ; E2 C4 23
0x23b3 POP AF           ; F1
0x23b4 INC HL           ; 23
0x23b5 JR C, 0x05       ; 38 03
0x23b7 LD HL, 0x411D    ; 21 1D 41
0x23ba LD C, (HL)       ; 4E
0x23bb INC HL           ; 23
0x23bc LD B, (HL)       ; 46
0x23bd INC HL           ; 23
0x23be PUSH BC          ; C5
0x23bf LD C, (HL)       ; 4E
0x23c0 INC HL           ; 23
0x23c1 LD B, (HL)       ; 46
0x23c2 PUSH BC          ; C5
0x23c3 LD B, 0xF1       ; 06 F1
0x23c4 POP AF           ; F1
0x23c5 ADD A, 0x03      ; C6 03
0x23c7 LD C, E          ; 4B
0x23c8 LD B, A          ; 47
0x23c9 PUSH BC          ; C5
0x23ca LD BC, 0x2406    ; 01 06 24
0x23cd PUSH BC          ; C5
0x23ce LD HL, (0x40D8)  ; 2A D8 40
0x23d1 JP 0x233A        ; C3 3A 23

0x23d4 CALL 0x0AB1      ; CD B1 0A
0x23d7 CALL 0x09A4      ; CD A4 09
0x23da LD BC, 0x13F2    ; 01 F2 13
0x23dd LD D, 0x7F       ; 16 7F
0x23df JR -0x12         ; 18 EC

0x23e1 PUSH DE          ; D5
0x23e2 CALL 0x0A7F      ; CD 7F 0A
0x23e5 POP DE           ; D1
0x23e6 PUSH HL          ; E5
0x23e7 LD BC, 0x25E9    ; 01 E9 25
0x23ea JR -0x1D         ; 18 E1

0x23ec LD A, B          ; 78
0x23ed CP N             ; FE 64
0x23ef RET NC           ; D0
0x23f0 PUSH BC          ; C5
0x23f1 PUSH DE          ; D5
0x23f2 LD DE, 0x6404    ; 11 04 64
0x23f5 LD HL, 0x25B8    ; 21 B8 25
0x23f8 PUSH HL          ; E5
0x23f9 RST 20H          ; E7
0x23fa JP NZ, 0x2395    ; C2 95 23
0x23fd LD HL, (0x4121)  ; 2A 21 41
0x2400 PUSH HL          ; E5
0x2401 LD BC, 0x258C    ; 01 8C 25
0x2404 JR -0x37         ; 18 C7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DIVINT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2490 PUSH HL          ; E5
0x2491 EX DE, HL        ; EB
0x2492 CALL 0x0ACF      ; CD CF 0A
0x2495 POP HL           ; E1
0x2496 CALL 0x09A4      ; CD A4 09
0x2499 CALL 0x0ACF      ; CD CF 0A
0x249c JP 0x08A0        ; C3 A0 08

0x249f RST 10H          ; D7
0x24a0 LD E, 0x28       ; 1E 28
0x24a2 JP Z, 0x19A2     ; CA A2 19
0x24a5 JP C, 0x0E6C     ; DA 6C 0E
0x24a8 CALL 0x1E3D      ; CD 3D 1E
0x24ab JP NC, 0x2540    ; D2 40 25
0x24ae CP N             ; FE CD
0x24b0 JR Z, -0x11      ; 28 ED
0x24b2 CP N             ; FE 2E
0x24b4 JP Z, 0x0E6C     ; CA 6C 0E
0x24b7 CP N             ; FE CE
0x24b9 JP Z, 0x2532     ; CA 32 25
0x24bc CP N             ; FE 22
0x24be JP Z, 0x2866     ; CA 66 28
0x24c1 CP N             ; FE CB
0x24c3 JP Z, 0x25C4     ; CA C4 25
0x24c6 CP N             ; FE 26
0x24c8 JP Z, 0x4194     ; CA 94 41
0x24cb CP N             ; FE C3
0x24cd JR NZ, 0x0C      ; 20 0A
0x24cf RST 10H          ; D7
0x24d0 LD A, (0x409A)   ; 3A 9A 40
0x24d3 PUSH HL          ; E5
0x24d4 CALL 0x27F8      ; CD F8 27
0x24d7 POP HL           ; E1
0x24d8 RET              ; C9

0x24d9 CP N             ; FE C2
0x24db JR NZ, 0x0C      ; 20 0A
0x24dd RST 10H          ; D7
0x24de PUSH HL          ; E5
0x24df LD HL, (0x40EA)  ; 2A EA 40
0x24e2 CALL 0x0C66      ; CD 66 0C
0x24e5 POP HL           ; E1
0x24e6 RET              ; C9

0x24e7 CP N             ; FE C0
0x24e9 JR NZ, 0x16      ; 20 14
0x24eb RST 10H          ; D7
0x24ec RST 8H           ; CF
0x24ed JR Z, -0x31      ; 28 CD
0x24ef DEC C            ; 0D
0x24f0 LD H, 0xCF       ; 26 CF
0x24f2 ADD HL, HL       ; 29
0x24f3 PUSH HL          ; E5
0x24f4 EX DE, HL        ; EB
0x24f5 LD A, H          ; 7C
0x24f6 OR L             ; B5
0x24f7 JP Z, 0x1E4A     ; CA 4A 1E
0x24fa CALL 0x0A9A      ; CD 9A 0A
0x24fd POP HL           ; E1
0x24fe RET              ; C9

0x24ff CP N             ; FE C1
0x2501 JP Z, 0x27FE     ; CA FE 27
0x2504 CP N             ; FE C5
0x2506 JP Z, 0x419D     ; CA 9D 41
0x2509 CP N             ; FE C8
0x250b JP Z, 0x27C9     ; CA C9 27
0x250e CP N             ; FE C7
0x2510 JP Z, 0x4176     ; CA 76 41
0x2513 CP N             ; FE C6
0x2515 JP Z, 0x0132     ; CA 32 01
0x2518 CP N             ; FE C9
0x251a JP Z, 0x019D     ; CA 9D 01
0x251d CP N             ; FE C4
0x251f JP Z, 0x2A2F     ; CA 2F 2A
0x2522 CP N             ; FE BE
0x2524 JP Z, 0x4155     ; CA 55 41
0x2527 SUB N            ; D6 D7
0x2529 JP NC, 0x254E    ; D2 4E 25
0x252c CALL 0x2335      ; CD 35 23
0x252f RST 8H           ; CF
0x2530 ADD HL, HL       ; 29
0x2531 RET              ; C9

0x2532 LD D, 0x7D       ; 16 7D
0x2534 CALL 0x233A      ; CD 3A 23
0x2537 LD HL, (0x40F3)  ; 2A F3 40
0x253a PUSH HL          ; E5
0x253b CALL 0x097B      ; CD 7B 09
0x253e POP HL           ; E1
0x253f RET              ; C9

0x2540 CALL 0x260D      ; CD 0D 26
0x2543 PUSH HL          ; E5
0x2544 EX DE, HL        ; EB
0x2545 LD (0x4121), HL  ; 22 21 41
0x2548 RST 20H          ; E7
0x2549 CALL NZ, 0x09F7  ; C4 F7 09
0x254c POP HL           ; E1
0x254d RET              ; C9

0x254e LD B, 0x00       ; 06 00
0x2550 RLCA             ; 07
0x2551 LD C, A          ; 4F
0x2552 PUSH BC          ; C5
0x2553 RST 10H          ; D7
0x2554 LD A, C          ; 79
0x2555 CP N             ; FE 41
0x2557 JR C, 0x18       ; 38 16
0x2559 CALL 0x2335      ; CD 35 23
0x255c RST 8H           ; CF
0x255d INC L            ; 2C
0x255e CALL 0x0AF4      ; CD F4 0A
0x2561 EX DE, HL        ; EB
0x2562 LD HL, (0x4121)  ; 2A 21 41
0x2565 EX (SP), HL      ; E3
0x2566 PUSH HL          ; E5
0x2567 EX DE, HL        ; EB
0x2568 CALL 0x2B1C      ; CD 1C 2B
0x256b EX DE, HL        ; EB
0x256c EX (SP), HL      ; E3
0x256d JR 0x16          ; 18 14

0x256f CALL 0x252C      ; CD 2C 25
0x2572 EX (SP), HL      ; E3
0x2573 LD A, L          ; 7D
0x2574 CP N             ; FE 0C
0x2576 JR C, 0x09       ; 38 07
0x2578 CP N             ; FE 1B
0x257a PUSH HL          ; E5
0x257b CALL C, 0x0AB1   ; DC B1 0A
0x257e POP HL           ; E1
0x257f LD DE, 0x253E    ; 11 3E 25
0x2582 PUSH DE          ; D5
0x2583 LD BC, 0x1608    ; 01 08 16
0x2586 ADD HL, BC       ; 09
0x2587 LD C, (HL)       ; 4E
0x2588 INC HL           ; 23
0x2589 LD H, (HL)       ; 66
0x258a LD L, C          ; 69
0x258b JP (HL)          ; E9
0x258c CALL 0x29D7      ; CD D7 29
0x258f LD A, (HL)       ; 7E
0x2590 INC HL           ; 23
0x2591 LD C, (HL)       ; 4E
0x2592 INC HL           ; 23
0x2593 LD B, (HL)       ; 46
0x2594 POP DE           ; D1
0x2595 PUSH BC          ; C5
0x2596 PUSH AF          ; F5
0x2597 CALL 0x29DE      ; CD DE 29
0x259a POP DE           ; D1
0x259b LD E, (HL)       ; 5E
0x259c INC HL           ; 23
0x259d LD C, (HL)       ; 4E
0x259e INC HL           ; 23
0x259f LD B, (HL)       ; 46
0x25a0 POP HL           ; E1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CPSTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x25a1 LD A, E          ; 7B
0x25a2 OR D             ; B2
0x25a3 RET Z            ; C8
0x25a4 LD A, D          ; 7A
0x25a5 SUB N            ; D6 01
0x25a7 RET C            ; D8
0x25a8 XOR A            ; AF
0x25a9 CP E             ; BB
0x25aa INC A            ; 3C
0x25ab RET NC           ; D0
0x25ac DEC D            ; 15
0x25ad DEC E            ; 1D
0x25ae LD A, (BC)       ; 0A
0x25af CP (HL)          ; BE
0x25b0 INC HL           ; 23
0x25b1 INC BC           ; 03
0x25b2 JR Z, -0x11      ; 28 ED
0x25b4 CCF              ; 3F
0x25b5 JP 0x0960        ; C3 60 09

0x25c4 LD D, 0x5A       ; 16 5A
0x25c6 CALL 0x233A      ; CD 3A 23
0x25c9 CALL 0x0A7F      ; CD 7F 0A
0x25cc LD A, L          ; 7D
0x25cd CPL              ; 2F
0x25ce LD L, A          ; 6F
0x25cf LD A, H          ; 7C
0x25d0 CPL              ; 2F
0x25d1 LD H, A          ; 67
0x25d2 LD (0x4121), HL  ; 22 21 41
0x25d5 POP BC           ; C1
0x25d6 JP 0x2346        ; C3 46 23

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DIM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2608 LD BC, 0x2603    ; 01 03 26
0x260b PUSH BC          ; C5
0x260c OR N             ; F6 AF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VARPTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x260d XOR A            ; AF
0x260e LD (0x40AE), A   ; 32 AE 40
0x2611 LD B, (HL)       ; 46
0x2612 CALL 0x1E3D      ; CD 3D 1E
0x2615 JP C, 0x1997     ; DA 97 19
0x2618 XOR A            ; AF
0x2619 LD C, A          ; 4F
0x261a RST 10H          ; D7
0x261b JR C, 0x07       ; 38 05
0x261d CALL 0x1E3D      ; CD 3D 1E
0x2620 JR C, 0x0B       ; 38 09
0x2622 LD C, A          ; 4F
0x2623 RST 10H          ; D7
0x2624 JR C, -0x01      ; 38 FD
0x2626 CALL 0x1E3D      ; CD 3D 1E
0x2629 JR NC, -0x06     ; 30 F8
0x262b LD DE, 0x2652    ; 11 52 26
0x262e PUSH DE          ; D5
0x262f LD D, 0x02       ; 16 02
0x2631 CP N             ; FE 25
0x2633 RET Z            ; C8
0x2634 INC D            ; 14
0x2635 CP N             ; FE 24
0x2637 RET Z            ; C8
0x2638 INC D            ; 14
0x2639 CP N             ; FE 21
0x263b RET Z            ; C8
0x263c LD D, 0x08       ; 16 08
0x263e CP N             ; FE 23
0x2640 RET Z            ; C8
0x2641 LD A, B          ; 78
0x2642 SUB N            ; D6 41
0x2644 AND N            ; E6 7F
0x2646 LD E, A          ; 5F
0x2647 LD D, 0x00       ; 16 00
0x2649 PUSH HL          ; E5
0x264a LD HL, 0x4101    ; 21 01 41
0x264d ADD HL, DE       ; 19
0x264e LD D, (HL)       ; 56
0x264f POP HL           ; E1
0x2650 DEC HL           ; 2B
0x2651 RET              ; C9

0x27c9 XOR A            ; AF
0x27ca PUSH HL          ; E5
0x27cb LD (0x40AF), A   ; 32 AF 40
0x27ce CALL 0x27D4      ; CD D4 27
0x27d1 POP HL           ; E1
0x27d2 RST 10H          ; D7
0x27d3 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FRE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x27d4 LD HL, (0x40FD)  ; 2A FD 40
0x27d7 EX DE, HL        ; EB
0x27d8 LD HL, 0x0000    ; 21 00 00
0x27db ADD HL, SP       ; 39
0x27dc RST 20H          ; E7
0x27dd JR NZ, 0x0F      ; 20 0D
0x27df CALL 0x29DA      ; CD DA 29
0x27e2 CALL 0x28E6      ; CD E6 28
0x27e5 LD HL, (0x40A0)  ; 2A A0 40
0x27e8 EX DE, HL        ; EB
0x27e9 LD HL, (0x40D6)  ; 2A D6 40
0x27ec LD A, L          ; 7D
0x27ed SUB E            ; 93
0x27ee LD L, A          ; 6F
0x27ef LD A, H          ; 7C
0x27f0 SBC D            ; 9A
0x27f1 LD H, A          ; 67
0x27f2 JP 0x0C66        ; C3 66 0C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x27f5 LD A, (0x40A6)   ; 3A A6 40
0x27f8 LD L, A          ; 6F
0x27f9 XOR A            ; AF
0x27fa LD H, A          ; 67
0x27fb JP 0x0A9A        ; C3 9A 0A

0x27fe CALL 0x41A9      ; CD A9 41
0x2801 RST 10H          ; D7
0x2802 CALL 0x252C      ; CD 2C 25
0x2805 PUSH HL          ; E5
0x2806 LD HL, 0x0890    ; 21 90 08
0x2809 PUSH HL          ; E5
0x280a LD A, (0x40AF)   ; 3A AF 40
0x280d PUSH AF          ; F5
0x280e CP N             ; FE 03
0x2810 CALL Z, 0x29DA   ; CC DA 29
0x2813 POP AF           ; F1
0x2814 EX DE, HL        ; EB
0x2815 LD HL, (0x408E)  ; 2A 8E 40
0x2818 JP (HL)          ; E9
0x2819 PUSH HL          ; E5
0x281a AND N            ; E6 07
0x281c LD HL, 0x18A1    ; 21 A1 18
0x281f LD C, A          ; 4F
0x2820 LD B, 0x00       ; 06 00
0x2822 ADD HL, BC       ; 09
0x2823 CALL 0x2586      ; CD 86 25
0x2826 POP HL           ; E1
0x2827 RET              ; C9

0x2828 PUSH HL          ; E5
0x2829 LD HL, (0x40A2)  ; 2A A2 40
0x282c INC HL           ; 23
0x282d LD A, H          ; 7C
0x282e OR L             ; B5
0x282f POP HL           ; E1
0x2830 RET NZ           ; C0
0x2831 LD E, 0x16       ; 1E 16
0x2833 JP 0x19A2        ; C3 A2 19

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; STR$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2836 CALL 0x0FBD      ; CD BD 0F
0x2839 CALL 0x2865      ; CD 65 28
0x283c CALL 0x29DA      ; CD DA 29
0x283f LD BC, 0x2A2B    ; 01 2B 2A
0x2842 PUSH BC          ; C5
0x2843 LD A, (HL)       ; 7E
0x2844 INC HL           ; 23
0x2845 PUSH HL          ; E5
0x2846 CALL 0x28BF      ; CD BF 28
0x2849 POP HL           ; E1
0x284a LD C, (HL)       ; 4E
0x284b INC HL           ; 23
0x284c LD B, (HL)       ; 46
0x284d CALL 0x285A      ; CD 5A 28
0x2850 PUSH HL          ; E5
0x2851 LD L, A          ; 6F
0x2852 CALL 0x29CE      ; CD CE 29
0x2855 POP DE           ; D1
0x2856 RET              ; C9

0x2857 CALL 0x28BF      ; CD BF 28
0x285a LD HL, 0x40D3    ; 21 D3 40
0x285d PUSH HL          ; E5
0x285e LD (HL), A       ; 77
0x285f INC HL           ; 23
0x2860 LD (HL), E       ; 73
0x2861 INC HL           ; 23
0x2862 LD (HL), D       ; 72
0x2863 POP HL           ; E1
0x2864 RET              ; C9

0x2865 DEC HL           ; 2B
0x2866 LD B, 0x22       ; 06 22
0x2868 LD D, B          ; 50
0x2869 PUSH HL          ; E5
0x286a LD C, 0xFF       ; 0E FF
0x286c INC HL           ; 23
0x286d LD A, (HL)       ; 7E
0x286e INC C            ; 0C
0x286f OR A             ; B7
0x2870 JR Z, 0x08       ; 28 06
0x2872 CP D             ; BA
0x2873 JR Z, 0x05       ; 28 03
0x2875 CP B             ; B8
0x2876 JR NZ, -0x0A     ; 20 F4
0x2878 CP N             ; FE 22
0x287a CALL Z, 0x1D78   ; CC 78 1D
0x287d EX (SP), HL      ; E3
0x287e INC HL           ; 23
0x287f EX DE, HL        ; EB
0x2880 LD A, C          ; 79
0x2881 CALL 0x285A      ; CD 5A 28
0x2884 LD DE, 0x40D3    ; 11 D3 40
0x2887 LD A, 0xD5       ; 3E D5
0x2889 LD HL, (0x40B3)  ; 2A B3 40
0x288c LD (0x4121), HL  ; 22 21 41
0x288f LD A, 0x03       ; 3E 03
0x2891 LD (0x40AF), A   ; 32 AF 40
0x2894 CALL 0x09D3      ; CD D3 09
0x2897 LD DE, 0x40D6    ; 11 D6 40
0x289a RST 18H          ; DF
0x289b LD (0x40B3), HL  ; 22 B3 40
0x289e POP HL           ; E1
0x289f LD A, (HL)       ; 7E
0x28a0 RET NZ           ; C0
0x28a1 LD E, 0x1E       ; 1E 1E
0x28a3 JP 0x19A2        ; C3 A2 19

0x28a6 INC HL           ; 23

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OUTSTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x28a7 CALL 0x2865      ; CD 65 28
0x28aa CALL 0x29DA      ; CD DA 29
0x28ad CALL 0x09C4      ; CD C4 09
0x28b0 INC D            ; 14
0x28b1 DEC D            ; 15
0x28b2 RET Z            ; C8
0x28b3 LD A, (BC)       ; 0A
0x28b4 CALL 0x032A      ; CD 2A 03
0x28b7 CP N             ; FE 0D
0x28b9 CALL Z, 0x2103   ; CC 03 21
0x28bc INC BC           ; 03
0x28bd JR -0x0C         ; 18 F2

0x28bf OR A             ; B7
0x28c0 LD C, 0xF1       ; 0E F1
0x28c2 PUSH AF          ; F5
0x28c3 LD HL, (0x40A0)  ; 2A A0 40
0x28c6 EX DE, HL        ; EB
0x28c7 LD HL, (0x40D6)  ; 2A D6 40
0x28ca CPL              ; 2F
0x28cb LD C, A          ; 4F
0x28cc LD B, 0xFF       ; 06 FF
0x28ce ADD HL, BC       ; 09
0x28cf INC HL           ; 23
0x28d0 RST 18H          ; DF
0x28d1 JR C, 0x09       ; 38 07
0x28d3 LD (0x40D6), HL  ; 22 D6 40
0x28d6 INC HL           ; 23
0x28d7 EX DE, HL        ; EB
0x28d8 POP AF           ; F1
0x28d9 RET              ; C9

0x28da POP AF           ; F1
0x28db LD E, 0x1A       ; 1E 1A
0x28dd JP Z, 0x19A2     ; CA A2 19
0x28e0 CP A             ; BF
0x28e1 PUSH AF          ; F5
0x28e2 LD BC, 0x28C1    ; 01 C1 28
0x28e5 PUSH BC          ; C5
0x28e6 LD HL, (0x40B1)  ; 2A B1 40
0x28e9 LD (0x40D6), HL  ; 22 D6 40
0x28ec LD HL, 0x0000    ; 21 00 00
0x28ef PUSH HL          ; E5
0x28f0 LD HL, (0x40A0)  ; 2A A0 40
0x28f3 PUSH HL          ; E5
0x28f4 LD HL, 0x40B5    ; 21 B5 40
0x28f7 EX DE, HL        ; EB
0x28f8 LD HL, (0x40B3)  ; 2A B3 40
0x28fb EX DE, HL        ; EB
0x28fc RST 18H          ; DF
0x28fd LD BC, 0x28F7    ; 01 F7 28
0x2900 JP NZ, 0x294A    ; C2 4A 29
0x2903 LD HL, (0x40F9)  ; 2A F9 40
0x2906 EX DE, HL        ; EB
0x2907 LD HL, (0x40FB)  ; 2A FB 40
0x290a EX DE, HL        ; EB
0x290b RST 18H          ; DF
0x290c JR Z, 0x15       ; 28 13
0x290e LD A, (HL)       ; 7E
0x290f INC HL           ; 23
0x2910 INC HL           ; 23
0x2911 INC HL           ; 23
0x2912 CP N             ; FE 03
0x2914 JR NZ, 0x06      ; 20 04
0x2916 CALL 0x294B      ; CD 4B 29
0x2919 XOR A            ; AF
0x291a LD E, A          ; 5F
0x291b LD D, 0x00       ; 16 00
0x291d ADD HL, DE       ; 19
0x291e JR -0x18         ; 18 E6

0x2920 POP BC           ; C1
0x2921 EX DE, HL        ; EB
0x2922 LD HL, (0x40FD)  ; 2A FD 40
0x2925 EX DE, HL        ; EB
0x2926 RST 18H          ; DF
0x2927 JP Z, 0x296B     ; CA 6B 29
0x292a LD A, (HL)       ; 7E
0x292b INC HL           ; 23
0x292c CALL 0x09C2      ; CD C2 09
0x292f PUSH HL          ; E5
0x2930 ADD HL, BC       ; 09
0x2931 CP N             ; FE 03
0x2933 JR NZ, -0x13     ; 20 EB
0x2935 LD (0x40D8), HL  ; 22 D8 40
0x2938 POP HL           ; E1
0x2939 LD C, (HL)       ; 4E
0x293a LD B, 0x00       ; 06 00
0x293c ADD HL, BC       ; 09
0x293d ADD HL, BC       ; 09
0x293e INC HL           ; 23
0x293f EX DE, HL        ; EB
0x2940 LD HL, (0x40D8)  ; 2A D8 40
0x2943 EX DE, HL        ; EB
0x2944 RST 18H          ; DF
0x2945 JR Z, -0x24      ; 28 DA
0x2947 LD BC, 0x293F    ; 01 3F 29
0x294a PUSH BC          ; C5
0x294b XOR A            ; AF
0x294c OR (HL)          ; B6
0x294d INC HL           ; 23
0x294e LD E, (HL)       ; 5E
0x294f INC HL           ; 23
0x2950 LD D, (HL)       ; 56
0x2951 INC HL           ; 23
0x2952 RET Z            ; C8
0x2953 LD B, H          ; 44
0x2954 LD C, L          ; 4D
0x2955 LD HL, (0x40D6)  ; 2A D6 40
0x2958 RST 18H          ; DF
0x2959 LD H, B          ; 60
0x295a LD L, C          ; 69
0x295b RET C            ; D8
0x295c POP HL           ; E1
0x295d EX (SP), HL      ; E3
0x295e RST 18H          ; DF
0x295f EX (SP), HL      ; E3
0x2960 PUSH HL          ; E5
0x2961 LD H, B          ; 60
0x2962 LD L, C          ; 69
0x2963 RET NC           ; D0
0x2964 POP BC           ; C1
0x2965 POP AF           ; F1
0x2966 POP AF           ; F1
0x2967 PUSH HL          ; E5
0x2968 PUSH DE          ; D5
0x2969 PUSH BC          ; C5
0x296a RET              ; C9

0x296b POP DE           ; D1
0x296c POP HL           ; E1
0x296d LD A, L          ; 7D
0x296e OR H             ; B4
0x296f RET Z            ; C8
0x2970 DEC HL           ; 2B
0x2971 LD B, (HL)       ; 46
0x2972 DEC HL           ; 2B
0x2973 LD C, (HL)       ; 4E
0x2974 PUSH HL          ; E5
0x2975 DEC HL           ; 2B
0x2976 LD L, (HL)       ; 6E
0x2977 LD H, 0x00       ; 26 00
0x2979 ADD HL, BC       ; 09
0x297a LD D, B          ; 50
0x297b LD E, C          ; 59
0x297c DEC HL           ; 2B
0x297d LD B, H          ; 44
0x297e LD C, L          ; 4D
0x297f LD HL, (0x40D6)  ; 2A D6 40
0x2982 CALL 0x1958      ; CD 58 19
0x2985 POP HL           ; E1
0x2986 LD (HL), C       ; 71
0x2987 INC HL           ; 23
0x2988 LD (HL), B       ; 70
0x2989 LD L, C          ; 69
0x298a LD H, B          ; 60
0x298b DEC HL           ; 2B
0x298c JP 0x28E9        ; C3 E9 28

0x298f PUSH BC          ; C5
0x2990 PUSH HL          ; E5
0x2991 LD HL, (0x4121)  ; 2A 21 41
0x2994 EX (SP), HL      ; E3
0x2995 CALL 0x249F      ; CD 9F 24
0x2998 EX (SP), HL      ; E3
0x2999 CALL 0x0AF4      ; CD F4 0A
0x299c LD A, (HL)       ; 7E
0x299d PUSH HL          ; E5
0x299e LD HL, (0x4121)  ; 2A 21 41
0x29a1 PUSH HL          ; E5
0x29a2 ADD A, (HL)      ; 86
0x29a3 LD E, 0x1C       ; 1E 1C
0x29a5 JP C, 0x19A2     ; DA A2 19
0x29a8 CALL 0x2857      ; CD 57 28
0x29ab POP DE           ; D1
0x29ac CALL 0x29DE      ; CD DE 29
0x29af EX (SP), HL      ; E3
0x29b0 CALL 0x29DD      ; CD DD 29
0x29b3 PUSH HL          ; E5
0x29b4 LD HL, (0x40D4)  ; 2A D4 40
0x29b7 EX DE, HL        ; EB
0x29b8 CALL 0x29C6      ; CD C6 29
0x29bb CALL 0x29C6      ; CD C6 29
0x29be LD HL, 0x2349    ; 21 49 23
0x29c1 EX (SP), HL      ; E3
0x29c2 PUSH HL          ; E5
0x29c3 JP 0x2884        ; C3 84 28

0x29c6 POP HL           ; E1
0x29c7 EX (SP), HL      ; E3
0x29c8 LD A, (HL)       ; 7E
0x29c9 INC HL           ; 23
0x29ca LD C, (HL)       ; 4E
0x29cb INC HL           ; 23
0x29cc LD B, (HL)       ; 46
0x29cd LD L, A          ; 6F
0x29ce INC L            ; 2C
0x29cf DEC L            ; 2D
0x29d0 RET Z            ; C8
0x29d1 LD A, (BC)       ; 0A
0x29d2 LD (DE), A       ; 12
0x29d3 INC BC           ; 03
0x29d4 INC DE           ; 13
0x29d5 JR -0x06         ; 18 F8

0x29d7 CALL 0x0AF4      ; CD F4 0A
0x29da LD HL, (0x4121)  ; 2A 21 41
0x29dd EX DE, HL        ; EB
0x29de CALL 0x29F5      ; CD F5 29
0x29e1 EX DE, HL        ; EB
0x29e2 RET NZ           ; C0
0x29e3 PUSH DE          ; D5
0x29e4 LD D, B          ; 50
0x29e5 LD E, C          ; 59
0x29e6 DEC DE           ; 1B
0x29e7 LD C, (HL)       ; 4E
0x29e8 LD HL, (0x40D6)  ; 2A D6 40
0x29eb RST 18H          ; DF
0x29ec JR NZ, 0x07      ; 20 05
0x29ee LD B, A          ; 47
0x29ef ADD HL, BC       ; 09
0x29f0 LD (0x40D6), HL  ; 22 D6 40
0x29f3 POP HL           ; E1
0x29f4 RET              ; C9

0x29f5 LD HL, (0x40B3)  ; 2A B3 40
0x29f8 DEC HL           ; 2B
0x29f9 LD B, (HL)       ; 46
0x29fa DEC HL           ; 2B
0x29fb LD C, (HL)       ; 4E
0x29fc DEC HL           ; 2B
0x29fd RST 18H          ; DF
0x29fe RET NZ           ; C0
0x29ff LD (0x40B3), HL  ; 22 B3 40
0x2a00 OR E             ; B3
0x2a01 LD B, B          ; 40
0x2a02 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a03 LD BC, 0x27F8    ; 01 F8 27
0x2a06 PUSH BC          ; C5
0x2a07 CALL 0x29D7      ; CD D7 29
0x2a0a XOR A            ; AF
0x2a0b LD D, A          ; 57
0x2a0c LD A, (HL)       ; 7E
0x2a0d OR A             ; B7
0x2a0e RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ASC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a0f LD BC, 0x27F8    ; 01 F8 27
0x2a12 PUSH BC          ; C5
0x2a13 CALL 0x2A07      ; CD 07 2A
0x2a16 JP Z, 0x1E4A     ; CA 4A 1E
0x2a19 INC HL           ; 23
0x2a1a LD E, (HL)       ; 5E
0x2a1b INC HL           ; 23
0x2a1c LD D, (HL)       ; 56
0x2a1d LD A, (DE)       ; 1A
0x2a1e RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CHR$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a1f LD A, 0x01       ; 3E 01
0x2a21 CALL 0x2857      ; CD 57 28
0x2a24 CALL 0x2B1F      ; CD 1F 2B
0x2a27 LD HL, (0x40D4)  ; 2A D4 40
0x2a2a LD (HL), E       ; 73
0x2a2b POP BC           ; C1
0x2a2c JP 0x2884        ; C3 84 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; STRING$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a2f RST 10H          ; D7
0x2a30 RST 8H           ; CF
0x2a31 JR Z, -0x31      ; 28 CD
0x2a33 INC E            ; 1C
0x2a34 DEC HL           ; 2B
0x2a35 PUSH DE          ; D5
0x2a36 RST 8H           ; CF
0x2a37 INC L            ; 2C
0x2a38 CALL 0x2337      ; CD 37 23
0x2a3b RST 8H           ; CF
0x2a3c ADD HL, HL       ; 29
0x2a3d EX (SP), HL      ; E3
0x2a3e PUSH HL          ; E5
0x2a3f RST 20H          ; E7
0x2a40 JR Z, 0x07       ; 28 05
0x2a42 CALL 0x2B1F      ; CD 1F 2B
0x2a45 JR 0x05          ; 18 03

0x2a47 CALL 0x2A13      ; CD 13 2A
0x2a4a POP DE           ; D1
0x2a4b PUSH AF          ; F5
0x2a4c PUSH AF          ; F5
0x2a4d LD A, E          ; 7B
0x2a4e CALL 0x2857      ; CD 57 28
0x2a51 LD E, A          ; 5F
0x2a52 POP AF           ; F1
0x2a53 INC E            ; 1C
0x2a54 DEC E            ; 1D
0x2a55 JR Z, -0x2A      ; 28 D4
0x2a57 LD HL, (0x40D4)  ; 2A D4 40
0x2a5a LD (HL), A       ; 77
0x2a5b INC HL           ; 23
0x2a5c DEC E            ; 1D
0x2a5d JR NZ, -0x03     ; 20 FB
0x2a5f JR -0x34         ; 18 CA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEFT$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a61 CALL 0x2ADF      ; CD DF 2A
0x2a64 XOR A            ; AF
0x2a65 EX (SP), HL      ; E3
0x2a66 LD C, A          ; 4F
0x2a67 LD A, 0xE5       ; 3E E5
0x2a68 PUSH HL          ; E5
0x2a69 PUSH HL          ; E5
0x2a6a LD A, (HL)       ; 7E
0x2a6b CP B             ; B8
0x2a6c JR C, 0x04       ; 38 02
0x2a6e LD A, B          ; 78
0x2a6f LD DE, 0x000E    ; 11 0E 00
0x2a70 LD C, 0x00       ; 0E 00
0x2a72 PUSH BC          ; C5
0x2a73 CALL 0x28BF      ; CD BF 28
0x2a76 POP BC           ; C1
0x2a77 POP HL           ; E1
0x2a78 PUSH HL          ; E5
0x2a79 INC HL           ; 23
0x2a7a LD B, (HL)       ; 46
0x2a7b INC HL           ; 23
0x2a7c LD H, (HL)       ; 66
0x2a7d LD L, B          ; 68
0x2a7e LD B, 0x00       ; 06 00
0x2a80 ADD HL, BC       ; 09
0x2a81 LD B, H          ; 44
0x2a82 LD C, L          ; 4D
0x2a83 CALL 0x285A      ; CD 5A 28
0x2a86 LD L, A          ; 6F
0x2a87 CALL 0x29CE      ; CD CE 29
0x2a8a POP DE           ; D1
0x2a8b CALL 0x29DE      ; CD DE 29
0x2a8e JP 0x2884        ; C3 84 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RIGHT$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a91 CALL 0x2ADF      ; CD DF 2A
0x2a94 POP DE           ; D1
0x2a95 PUSH DE          ; D5
0x2a96 LD A, (DE)       ; 1A
0x2a97 SUB B            ; 90
0x2a98 JR -0x33         ; 18 CB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MID$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2a9a EX DE, HL        ; EB
0x2a9b LD A, (HL)       ; 7E
0x2a9c CALL 0x2AE2      ; CD E2 2A
0x2a9f INC B            ; 04
0x2aa0 DEC B            ; 05
0x2aa1 JP Z, 0x1E4A     ; CA 4A 1E
0x2aa4 PUSH BC          ; C5
0x2aa5 LD E, 0xFF       ; 1E FF
0x2aa7 CP N             ; FE 29
0x2aa9 JR Z, 0x07       ; 28 05
0x2aab RST 8H           ; CF
0x2aac INC L            ; 2C
0x2aad CALL 0x2B1C      ; CD 1C 2B
0x2ab0 RST 8H           ; CF
0x2ab1 ADD HL, HL       ; 29
0x2ab2 POP AF           ; F1
0x2ab3 EX (SP), HL      ; E3
0x2ab4 LD BC, 0x2A69    ; 01 69 2A
0x2ab7 PUSH BC          ; C5
0x2ab8 DEC A            ; 3D
0x2ab9 CP (HL)          ; BE
0x2aba LD B, 0x00       ; 06 00
0x2abc RET NC           ; D0
0x2abd LD C, A          ; 4F
0x2abe LD A, (HL)       ; 7E
0x2abf SUB C            ; 91
0x2ac0 CP E             ; BB
0x2ac1 LD B, A          ; 47
0x2ac2 RET C            ; D8
0x2ac3 LD B, E          ; 43
0x2ac4 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2ac5 CALL 0x2A07      ; CD 07 2A
0x2ac8 JP Z, 0x27F8     ; CA F8 27
0x2acb LD E, A          ; 5F
0x2acc INC HL           ; 23
0x2acd LD A, (HL)       ; 7E
0x2ace INC HL           ; 23
0x2acf LD H, (HL)       ; 66
0x2ad0 LD L, A          ; 6F
0x2ad1 PUSH HL          ; E5
0x2ad2 ADD HL, DE       ; 19
0x2ad3 LD B, (HL)       ; 46
0x2ad4 LD (HL), D       ; 72
0x2ad5 EX (SP), HL      ; E3
0x2ad6 PUSH BC          ; C5
0x2ad7 LD A, (HL)       ; 7E
0x2ad8 CALL 0x0E65      ; CD 65 0E
0x2adb POP BC           ; C1
0x2adc POP HL           ; E1
0x2add LD (HL), B       ; 70
0x2ade RET              ; C9

0x2adf EX DE, HL        ; EB
0x2ae0 RST 8H           ; CF
0x2ae1 ADD HL, HL       ; 29
0x2ae2 POP BC           ; C1
0x2ae3 POP DE           ; D1
0x2ae4 PUSH BC          ; C5
0x2ae5 LD B, E          ; 43
0x2ae6 RET              ; C9

0x2ae7 CP N             ; FE 7A
0x2ae9 JP NZ, 0x1997    ; C2 97 19
0x2aec JP 0x41D9        ; C3 D9 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2aef CALL 0x2B1F      ; CD 1F 2B
0x2af2 LD (0x4094), A   ; 32 94 40
0x2af5 CALL 0x4093      ; CD 93 40
0x2af8 JP 0x27F8        ; C3 F8 27

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OUT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2afb CALL 0x2B0E      ; CD 0E 2B
0x2afe JP 0x4096        ; C3 96 40

0x2b01 RST 10H          ; D7
0x2b02 CALL 0x2337      ; CD 37 23
0x2b05 PUSH HL          ; E5
0x2b06 CALL 0x0A7F      ; CD 7F 0A
0x2b09 EX DE, HL        ; EB
0x2b0a POP HL           ; E1
0x2b0b LD A, D          ; 7A
0x2b0c OR A             ; B7
0x2b0d RET              ; C9

0x2b0e CALL 0x2B1C      ; CD 1C 2B
0x2b11 LD (0x4094), A   ; 32 94 40
0x2b14 LD (0x4097), A   ; 32 97 40
0x2b17 RST 8H           ; CF
0x2b18 INC L            ; 2C
0x2b19 JR 0x03          ; 18 01

0x2b1b RST 10H          ; D7
0x2b1c CALL 0x2337      ; CD 37 23
0x2b1f CALL 0x2B05      ; CD 05 2B
0x2b22 JP NZ, 0x1E4A    ; C2 4A 1E
0x2b25 DEC HL           ; 2B
0x2b26 RST 10H          ; D7
0x2b27 LD A, E          ; 7B
0x2b28 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LLIST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2b29 LD A, 0x01       ; 3E 01
0x2b2b LD (0x409C), A   ; 32 9C 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LIST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2b2e POP BC           ; C1
0x2b2f CALL 0x1B10      ; CD 10 1B
0x2b32 PUSH BC          ; C5
0x2b33 LD HL, 0xFFFF    ; 21 FF FF
0x2b36 LD (0x40A2), HL  ; 22 A2 40
0x2b39 POP HL           ; E1
0x2b3a POP DE           ; D1
0x2b3b LD C, (HL)       ; 4E
0x2b3c INC HL           ; 23
0x2b3d LD B, (HL)       ; 46
0x2b3e INC HL           ; 23
0x2b3f LD A, B          ; 78
0x2b40 OR C             ; B1
0x2b41 JP Z, 0x1A19     ; CA 19 1A
0x2b44 CALL 0x41DF      ; CD DF 41
0x2b47 CALL 0x1D9B      ; CD 9B 1D
0x2b4a PUSH BC          ; C5
0x2b4b LD C, (HL)       ; 4E
0x2b4c INC HL           ; 23
0x2b4d LD B, (HL)       ; 46
0x2b4e INC HL           ; 23
0x2b4f PUSH BC          ; C5
0x2b50 EX (SP), HL      ; E3
0x2b51 EX DE, HL        ; EB
0x2b52 RST 18H          ; DF
0x2b53 POP BC           ; C1
0x2b54 JP C, 0x1A18     ; DA 18 1A
0x2b57 EX (SP), HL      ; E3
0x2b58 PUSH HL          ; E5
0x2b59 PUSH BC          ; C5
0x2b5a EX DE, HL        ; EB
0x2b5b LD (0x40EC), HL  ; 22 EC 40
0x2b5e CALL 0x0FAF      ; CD AF 0F
0x2b61 LD A, 0x20       ; 3E 20
0x2b63 POP HL           ; E1
0x2b64 CALL 0x032A      ; CD 2A 03
0x2b67 CALL 0x2B7E      ; CD 7E 2B
0x2b6a LD HL, (0x40A7)  ; 2A A7 40
0x2b6d CALL 0x2B75      ; CD 75 2B
0x2b70 CALL 0x20FE      ; CD FE 20
0x2b73 JR -0x40         ; 18 BE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OSTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2b75 LD A, (HL)       ; 7E
0x2b76 OR A             ; B7
0x2b77 RET Z            ; C8
0x2b78 CALL 0x032A      ; CD 2A 03
0x2b7b INC HL           ; 23
0x2b7c JR -0x07         ; 18 F7

0x2b7e PUSH HL          ; E5
0x2b7f LD HL, (0x40A7)  ; 2A A7 40
0x2b82 LD B, H          ; 44
0x2b83 LD C, L          ; 4D
0x2b84 POP HL           ; E1
0x2b85 JP 0x069A        ; C3 9A 06

0x2b89 INC BC           ; 03
0x2b8a DEC D            ; 15
0x2b8b RET Z            ; C8
0x2b8c INC HL           ; 23
0x2b8d LD A, (HL)       ; 7E
0x2b8e OR A             ; B7
0x2b8f LD (BC), A       ; 02
0x2b90 RET Z            ; C8
0x2b91 JP 0x302D        ; C3 2D 30

0x2ba0 CP N             ; FE 95
0x2ba2 CALL Z, 0x0B24   ; CC 24 0B
0x2ba5 SUB N            ; D6 7F
0x2ba7 PUSH HL          ; E5
0x2ba8 LD E, A          ; 5F
0x2ba9 LD HL, 0x1650    ; 21 50 16
0x2bac LD A, (HL)       ; 7E
0x2bad OR A             ; B7
0x2bae INC HL           ; 23
0x2baf JP P, 0x2BAC     ; F2 AC 2B
0x2bb2 DEC E            ; 1D
0x2bb3 JR NZ, -0x07     ; 20 F7
0x2bb5 AND N            ; E6 7F
0x2bb7 LD (BC), A       ; 02
0x2bb8 INC BC           ; 03
0x2bb9 DEC D            ; 15
0x2bba JP Z, 0x28D8     ; CA D8 28
0x2bbd LD A, (HL)       ; 7E
0x2bbe INC HL           ; 23
0x2bbf OR A             ; B7
0x2bc0 JP P, 0x2BB7     ; F2 B7 2B
0x2bc3 POP HL           ; E1
0x2bc4 JR -0x38         ; 18 C6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DELETE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2bc6 CALL 0x1B10      ; CD 10 1B
0x2bc9 POP DE           ; D1
0x2bca PUSH BC          ; C5
0x2bcb PUSH BC          ; C5
0x2bcc CALL 0x1B2C      ; CD 2C 1B
0x2bcf JR NC, 0x07      ; 30 05
0x2bd1 LD D, H          ; 54
0x2bd2 LD E, L          ; 5D
0x2bd3 EX (SP), HL      ; E3
0x2bd4 PUSH HL          ; E5
0x2bd5 RST 18H          ; DF
0x2bd6 JP NC, 0x1E4A    ; D2 4A 1E
0x2bd9 LD HL, 0x1929    ; 21 29 19
0x2bdc CALL 0x28A7      ; CD A7 28
0x2bdf POP BC           ; C1
0x2be0 LD HL, 0x1AE8    ; 21 E8 1A
0x2be3 EX (SP), HL      ; E3
0x2be4 EX DE, HL        ; EB
0x2be5 LD HL, (0x40F9)  ; 2A F9 40
0x2be8 LD A, (DE)       ; 1A
0x2be9 LD (BC), A       ; 02
0x2bea INC BC           ; 03
0x2beb INC DE           ; 13
0x2bec RST 18H          ; DF
0x2bed JR NZ, -0x05     ; 20 F9
0x2bef LD H, B          ; 60
0x2bf0 LD L, C          ; 69
0x2bf1 LD (0x40F9), HL  ; 22 F9 40
0x2bf4 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CSAVE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2bf5 CALL 0x0284      ; CD 84 02
0x2bf8 CALL 0x2337      ; CD 37 23
0x2bfb PUSH HL          ; E5
0x2bfc CALL 0x2A13      ; CD 13 2A
0x2bff LD A, 0xD3       ; 3E D3
0x2c01 CALL 0x0264      ; CD 64 02
0x2c04 CALL 0x0261      ; CD 61 02
0x2c07 LD A, (DE)       ; 1A
0x2c08 CALL 0x0264      ; CD 64 02
0x2c0b LD HL, (0x40A4)  ; 2A A4 40
0x2c0e EX DE, HL        ; EB
0x2c0f LD HL, (0x40F9)  ; 2A F9 40
0x2c12 LD A, (DE)       ; 1A
0x2c13 INC DE           ; 13
0x2c14 CALL 0x0264      ; CD 64 02
0x2c17 RST 18H          ; DF
0x2c18 JR NZ, -0x06     ; 20 F8
0x2c1a CALL 0x01F8      ; CD F8 01
0x2c1d POP HL           ; E1
0x2c1e RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CLOAD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2c1f SUB N            ; D6 B2
0x2c21 JR Z, 0x04       ; 28 02
0x2c23 XOR A            ; AF
0x2c24 LD BC, 0x232F    ; 01 2F 23
0x2c25 CPL              ; 2F
0x2c26 INC HL           ; 23
0x2c27 PUSH AF          ; F5
0x2c28 LD A, (HL)       ; 7E
0x2c29 OR A             ; B7
0x2c2a JR Z, 0x09       ; 28 07
0x2c2c CALL 0x2337      ; CD 37 23
0x2c2f CALL 0x2A13      ; CD 13 2A
0x2c32 LD A, (DE)       ; 1A
0x2c33 LD L, A          ; 6F
0x2c34 POP AF           ; F1
0x2c35 OR A             ; B7
0x2c36 LD H, A          ; 67
0x2c37 LD (0x4121), HL  ; 22 21 41
0x2c3a CALL Z, 0x1B4D   ; CC 4D 1B
0x2c3d LD HL, 0x0000    ; 21 00 00
0x2c40 CALL 0x0293      ; CD 93 02
0x2c43 LD HL, (0x4121)  ; 2A 21 41
0x2c46 EX DE, HL        ; EB
0x2c47 LD B, 0x03       ; 06 03
0x2c49 CALL 0x0235      ; CD 35 02
0x2c4c SUB N            ; D6 D3
0x2c4e JR NZ, -0x07     ; 20 F7
0x2c50 DJNZ N           ; 10 F7
0x2c52 CALL 0x0235      ; CD 35 02
0x2c55 INC E            ; 1C
0x2c56 DEC E            ; 1D
0x2c57 JR Z, 0x05       ; 28 03
0x2c59 CP E             ; BB
0x2c5a JR NZ, 0x39      ; 20 37
0x2c5c LD HL, (0x40A4)  ; 2A A4 40
0x2c5f LD B, 0x03       ; 06 03
0x2c61 CALL 0x0235      ; CD 35 02
0x2c64 LD E, A          ; 5F
0x2c65 SUB (HL)         ; 96
0x2c66 AND D            ; A2
0x2c67 JR NZ, 0x23      ; 20 21
0x2c69 LD (HL), E       ; 73
0x2c6a CALL 0x196C      ; CD 6C 19
0x2c6d LD A, (HL)       ; 7E
0x2c6e OR A             ; B7
0x2c6f INC HL           ; 23
0x2c70 JR NZ, -0x11     ; 20 ED
0x2c72 CALL 0x022C      ; CD 2C 02
0x2c75 DJNZ N           ; 10 EA
0x2c77 LD (0x40F9), HL  ; 22 F9 40
0x2c7a CALL 0x01F8      ; CD F8 01
0x2c7d LD HL, 0x1929    ; 21 29 19
0x2c80 CALL 0x28A7      ; CD A7 28
0x2c83 LD HL, (0x40A4)  ; 2A A4 40
0x2c86 PUSH HL          ; E5
0x2c87 JP 0x1AE8        ; C3 E8 1A

0x2c8a CALL 0x31BD      ; CD BD 31
0x2c8d CALL 0x28A7      ; CD A7 28
0x2c90 JP 0x1A18        ; C3 18 1A

0x2c93 LD (0x3C3E), A   ; 32 3E 3C
0x2c96 LD B, 0x03       ; 06 03
0x2c98 CALL 0x0235      ; CD 35 02
0x2c9b OR A             ; B7
0x2c9c JR NZ, -0x06     ; 20 F8
0x2c9e DJNZ N           ; 10 F8
0x2ca0 CALL 0x0296      ; CD 96 02
0x2ca3 JR -0x5C         ; 18 A2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PEEK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2caa CALL 0x0A7F      ; CD 7F 0A
0x2cad LD A, (HL)       ; 7E
0x2cae JP 0x27F8        ; C3 F8 27

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POKE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2cb1 CALL 0x2B02      ; CD 02 2B
0x2cb4 PUSH DE          ; D5
0x2cb5 RST 8H           ; CF
0x2cb6 INC L            ; 2C
0x2cb7 CALL 0x2B1C      ; CD 1C 2B
0x2cba POP DE           ; D1
0x2cbb LD (DE), A       ; 12
0x2cbc RET              ; C9

0x2cbd CALL 0x2338      ; CD 38 23
0x2cc0 CALL 0x0AF4      ; CD F4 0A
0x2cc3 RST 8H           ; CF
0x2cc4 DEC SP           ; 3B
0x2cc5 EX DE, HL        ; EB
0x2cc6 LD HL, (0x4121)  ; 2A 21 41
0x2cc9 JR 0x0A          ; 18 08

0x2ccb LD A, (0x40DE)   ; 3A DE 40
0x2cce OR A             ; B7
0x2ccf JR Z, 0x0E       ; 28 0C
0x2cd1 POP DE           ; D1
0x2cd2 EX DE, HL        ; EB
0x2cd3 PUSH HL          ; E5
0x2cd4 XOR A            ; AF
0x2cd5 LD (0x40DE), A   ; 32 DE 40
0x2cd8 CP D             ; BA
0x2cd9 PUSH AF          ; F5
0x2cda PUSH DE          ; D5
0x2cdb LD B, (HL)       ; 46
0x2cdc OR B             ; B0
0x2cdd JP Z, 0x1E4A     ; CA 4A 1E
0x2ce0 INC HL           ; 23
0x2ce1 LD C, (HL)       ; 4E
0x2ce2 INC HL           ; 23
0x2ce3 LD H, (HL)       ; 66
0x2ce4 LD L, C          ; 69
0x2ce5 JR 0x1E          ; 18 1C

0x2ce7 LD E, B          ; 58
0x2ce8 PUSH HL          ; E5
0x2ce9 LD C, 0x02       ; 0E 02
0x2ceb LD A, (HL)       ; 7E
0x2cec INC HL           ; 23
0x2ced CP N             ; FE 25
0x2cef JP Z, 0x2E17     ; CA 17 2E
0x2cf2 CP N             ; FE 20
0x2cf4 JR NZ, 0x05      ; 20 03
0x2cf6 INC C            ; 0C
0x2cf7 DJNZ N           ; 10 F2
0x2cf9 POP HL           ; E1
0x2cfa LD B, E          ; 43
0x2cfb LD A, 0x25       ; 3E 25
0x2cfd CALL 0x2E49      ; CD 49 2E
0x2d00 CALL 0x032A      ; CD 2A 03
0x2d03 XOR A            ; AF
0x2d04 LD E, A          ; 5F
0x2d05 LD D, A          ; 57
0x2d06 CALL 0x2E49      ; CD 49 2E
0x2d09 LD D, A          ; 57
0x2d0a LD A, (HL)       ; 7E
0x2d0b INC HL           ; 23
0x2d0c CP N             ; FE 21
0x2d0e JP Z, 0x2E14     ; CA 14 2E
0x2d11 CP N             ; FE 23
0x2d13 JR Z, 0x39       ; 28 37
0x2d15 DEC B            ; 05
0x2d16 JP Z, 0x2DFE     ; CA FE 2D
0x2d19 CP N             ; FE 2B
0x2d1b LD A, 0x08       ; 3E 08
0x2d1d JR Z, -0x17      ; 28 E7
0x2d1f DEC HL           ; 2B
0x2d20 LD A, (HL)       ; 7E
0x2d21 INC HL           ; 23
0x2d22 CP N             ; FE 2E
0x2d24 JR Z, 0x42       ; 28 40
0x2d26 CP N             ; FE 25
0x2d28 JR Z, -0x41      ; 28 BD
0x2d2a CP (HL)          ; BE
0x2d2b JR NZ, -0x2E     ; 20 D0
0x2d2d CP N             ; FE 24
0x2d2f JR Z, 0x16       ; 28 14
0x2d31 CP N             ; FE 2A
0x2d33 JR NZ, -0x36     ; 20 C8
0x2d35 LD A, B          ; 78
0x2d36 CP N             ; FE 02
0x2d38 INC HL           ; 23
0x2d39 JR C, 0x05       ; 38 03
0x2d3b LD A, (HL)       ; 7E
0x2d3c CP N             ; FE 24
0x2d3e LD A, 0x20       ; 3E 20
0x2d40 JR NZ, 0x09      ; 20 07
0x2d42 DEC B            ; 05
0x2d43 INC E            ; 1C
0x2d44 CP N             ; FE AF
0x2d45 XOR A            ; AF
0x2d46 ADD A, 0x10      ; C6 10
0x2d48 INC HL           ; 23
0x2d49 INC E            ; 1C
0x2d4a ADD A, D         ; 82
0x2d4b LD D, A          ; 57
0x2d4c INC E            ; 1C
0x2d4d LD C, 0x00       ; 0E 00
0x2d4f DEC B            ; 05
0x2d50 JR Z, 0x49       ; 28 47
0x2d52 LD A, (HL)       ; 7E
0x2d53 INC HL           ; 23
0x2d54 CP N             ; FE 2E
0x2d56 JR Z, 0x1A       ; 28 18
0x2d58 CP N             ; FE 23
0x2d5a JR Z, -0x0E      ; 28 F0
0x2d5c CP N             ; FE 2C
0x2d5e JR NZ, 0x1C      ; 20 1A
0x2d60 LD A, D          ; 7A
0x2d61 OR N             ; F6 40
0x2d63 LD D, A          ; 57
0x2d64 JR -0x18         ; 18 E6

0x2d66 LD A, (HL)       ; 7E
0x2d67 CP N             ; FE 23
0x2d69 LD A, 0x2E       ; 3E 2E
0x2d6b JR NZ, -0x6E     ; 20 90
0x2d6d LD C, 0x01       ; 0E 01
0x2d6f INC HL           ; 23
0x2d70 INC C            ; 0C
0x2d71 DEC B            ; 05
0x2d72 JR Z, 0x27       ; 28 25
0x2d74 LD A, (HL)       ; 7E
0x2d75 INC HL           ; 23
0x2d76 CP N             ; FE 23
0x2d78 JR Z, -0x08      ; 28 F6
0x2d7a PUSH DE          ; D5
0x2d7b LD DE, 0x2D97    ; 11 97 2D
0x2d7e PUSH DE          ; D5
0x2d7f LD D, H          ; 54
0x2d80 LD E, L          ; 5D
0x2d81 CP N             ; FE 5B
0x2d83 RET NZ           ; C0
0x2d84 CP (HL)          ; BE
0x2d85 RET NZ           ; C0
0x2d86 INC HL           ; 23
0x2d87 CP (HL)          ; BE
0x2d88 RET NZ           ; C0
0x2d89 INC HL           ; 23
0x2d8a CP (HL)          ; BE
0x2d8b RET NZ           ; C0
0x2d8c INC HL           ; 23
0x2d8d LD A, B          ; 78
0x2d8e SUB N            ; D6 04
0x2d90 RET C            ; D8
0x2d91 POP DE           ; D1
0x2d92 POP DE           ; D1
0x2d93 LD B, A          ; 47
0x2d94 INC D            ; 14
0x2d95 INC HL           ; 23
0x2d96 JP Z, 0xD1EB     ; CA EB D1
0x2d99 LD A, D          ; 7A
0x2d9a DEC HL           ; 2B
0x2d9b INC E            ; 1C
0x2d9c AND N            ; E6 08
0x2d9e JR NZ, 0x17      ; 20 15
0x2da0 DEC E            ; 1D
0x2da1 LD A, B          ; 78
0x2da2 OR A             ; B7
0x2da3 JR Z, 0x12       ; 28 10
0x2da5 LD A, (HL)       ; 7E
0x2da6 SUB N            ; D6 2D
0x2da8 JR Z, 0x08       ; 28 06
0x2daa CP N             ; FE FE
0x2dac JR NZ, 0x09      ; 20 07
0x2dae LD A, 0x08       ; 3E 08
0x2db0 ADD A, 0x04      ; C6 04
0x2db2 ADD A, D         ; 82
0x2db3 LD D, A          ; 57
0x2db4 DEC B            ; 05
0x2db5 POP HL           ; E1
0x2db6 POP AF           ; F1
0x2db7 JR Z, 0x52       ; 28 50
0x2db9 PUSH BC          ; C5
0x2dba PUSH DE          ; D5
0x2dbb CALL 0x2337      ; CD 37 23
0x2dbe POP DE           ; D1
0x2dbf POP BC           ; C1
0x2dc0 PUSH BC          ; C5
0x2dc1 PUSH HL          ; E5
0x2dc2 LD B, E          ; 43
0x2dc3 LD A, B          ; 78
0x2dc4 ADD A, C         ; 81
0x2dc5 CP N             ; FE 19
0x2dc7 JP NC, 0x1E4A    ; D2 4A 1E
0x2dca LD A, D          ; 7A
0x2dcb OR N             ; F6 80
0x2dcd CALL 0x0FBE      ; CD BE 0F
0x2dd0 CALL 0x28A7      ; CD A7 28
0x2dd3 POP HL           ; E1
0x2dd4 DEC HL           ; 2B
0x2dd5 RST 10H          ; D7
0x2dd6 SCF              ; 37
0x2dd7 JR Z, 0x0F       ; 28 0D
0x2dd9 LD (0x40DE), A   ; 32 DE 40
0x2ddc CP N             ; FE 3B
0x2dde JR Z, 0x07       ; 28 05
0x2de0 CP N             ; FE 2C
0x2de2 JP NZ, 0x1997    ; C2 97 19
0x2de5 RST 10H          ; D7
0x2de6 POP BC           ; C1
0x2de7 EX DE, HL        ; EB
0x2de8 POP HL           ; E1
0x2de9 PUSH HL          ; E5
0x2dea PUSH AF          ; F5
0x2deb PUSH DE          ; D5
0x2dec LD A, (HL)       ; 7E
0x2ded SUB B            ; 90
0x2dee INC HL           ; 23
0x2def LD C, (HL)       ; 4E
0x2df0 INC HL           ; 23
0x2df1 LD H, (HL)       ; 66
0x2df2 LD L, C          ; 69
0x2df3 LD D, 0x00       ; 16 00
0x2df5 LD E, A          ; 5F
0x2df6 ADD HL, DE       ; 19
0x2df7 LD A, B          ; 78
0x2df8 OR A             ; B7
0x2df9 JP NZ, 0x2D03    ; C2 03 2D
0x2dfc JR 0x08          ; 18 06

0x2dfe CALL 0x2E49      ; CD 49 2E
0x2e01 CALL 0x032A      ; CD 2A 03
0x2e04 POP HL           ; E1
0x2e05 POP AF           ; F1
0x2e06 JP NZ, 0x2CCB    ; C2 CB 2C
0x2e09 CALL C, 0x20FE   ; DC FE 20
0x2e0c EX (SP), HL      ; E3
0x2e0d CALL 0x29DD      ; CD DD 29
0x2e10 POP HL           ; E1
0x2e11 JP 0x2169        ; C3 69 21

0x2e14 LD C, 0x01       ; 0E 01
0x2e16 LD A, 0xF1       ; 3E F1
0x2e17 POP AF           ; F1
0x2e18 DEC B            ; 05
0x2e19 CALL 0x2E49      ; CD 49 2E
0x2e1c POP HL           ; E1
0x2e1d POP AF           ; F1
0x2e1e JR Z, -0x15      ; 28 E9
0x2e20 PUSH BC          ; C5
0x2e21 CALL 0x2337      ; CD 37 23
0x2e24 CALL 0x0AF4      ; CD F4 0A
0x2e27 POP BC           ; C1
0x2e28 PUSH BC          ; C5
0x2e29 PUSH HL          ; E5
0x2e2a LD HL, (0x4121)  ; 2A 21 41
0x2e2d LD B, C          ; 41
0x2e2e LD C, 0x00       ; 0E 00
0x2e30 PUSH BC          ; C5
0x2e31 CALL 0x2A68      ; CD 68 2A
0x2e34 CALL 0x28AA      ; CD AA 28
0x2e37 LD HL, (0x4121)  ; 2A 21 41
0x2e3a POP AF           ; F1
0x2e3b SUB (HL)         ; 96
0x2e3c LD B, A          ; 47
0x2e3d LD A, 0x20       ; 3E 20
0x2e3f INC B            ; 04
0x2e40 DEC B            ; 05
0x2e41 JP Z, 0x2DD3     ; CA D3 2D
0x2e44 CALL 0x032A      ; CD 2A 03
0x2e47 JR -0x07         ; 18 F7

0x2e49 PUSH AF          ; F5
0x2e4a LD A, D          ; 7A
0x2e4b OR A             ; B7
0x2e4c LD A, 0x2B       ; 3E 2B
0x2e4e CALL NZ, 0x032A  ; C4 2A 03
0x2e51 POP AF           ; F1
0x2e52 RET              ; C9

0x2e53 LD (0x409A), A   ; 32 9A 40
0x2e56 LD HL, (0x40EA)  ; 2A EA 40
0x2e59 OR H             ; B4
0x2e5a AND L            ; A5
0x2e5b INC A            ; 3C
0x2e5c EX DE, HL        ; EB
0x2e5d RET Z            ; C8
0x2e5e JR 0x06          ; 18 04

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EDIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2e60 CALL 0x1E4F      ; CD 4F 1E
0x2e63 RET NZ           ; C0
0x2e64 POP HL           ; E1
0x2e65 EX DE, HL        ; EB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EDITOR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x2e66 LD (0x40EC), HL  ; 22 EC 40
0x2e69 EX DE, HL        ; EB
0x2e6a CALL 0x1B2C      ; CD 2C 1B
0x2e6d JP NC, 0x1ED9    ; D2 D9 1E
0x2e70 LD H, B          ; 60
0x2e71 LD L, C          ; 69
0x2e72 INC HL           ; 23
0x2e73 INC HL           ; 23
0x2e74 LD C, (HL)       ; 4E
0x2e75 INC HL           ; 23
0x2e76 LD B, (HL)       ; 46
0x2e77 INC HL           ; 23
0x2e78 PUSH BC          ; C5
0x2e79 CALL 0x2B7E      ; CD 7E 2B
0x2e7c POP HL           ; E1
0x2e7d PUSH HL          ; E5
0x2e7e CALL 0x0FAF      ; CD AF 0F
0x2e81 LD A, 0x20       ; 3E 20
0x2e83 CALL 0x032A      ; CD 2A 03
0x2e86 LD HL, (0x40A7)  ; 2A A7 40
0x2e89 LD A, 0x0E       ; 3E 0E
0x2e8b CALL 0x032A      ; CD 2A 03
0x2e8e PUSH HL          ; E5
0x2e8f LD C, 0xFF       ; 0E FF
0x2e91 INC C            ; 0C
0x2e92 LD A, (HL)       ; 7E
0x2e93 OR A             ; B7
0x2e94 INC HL           ; 23
0x2e95 JR NZ, -0x04     ; 20 FA
0x2e97 POP HL           ; E1
0x2e98 LD B, A          ; 47
0x2e99 LD D, 0x00       ; 16 00
0x2e9b CALL 0x0384      ; CD 84 03
0x2e9e SUB N            ; D6 30
0x2ea0 JR C, 0x10       ; 38 0E
0x2ea2 CP N             ; FE 0A
0x2ea4 JR NC, 0x0C      ; 30 0A
0x2ea6 LD E, A          ; 5F
0x2ea7 LD A, D          ; 7A
0x2ea8 RLCA             ; 07
0x2ea9 RLCA             ; 07
0x2eaa ADD A, D         ; 82
0x2eab RLCA             ; 07
0x2eac ADD A, E         ; 83
0x2ead LD D, A          ; 57
0x2eae JR -0x13         ; 18 EB

0x2eb0 PUSH HL          ; E5
0x2eb1 LD HL, 0x2E99    ; 21 99 2E
0x2eb4 EX (SP), HL      ; E3
0x2eb5 DEC D            ; 15
0x2eb6 INC D            ; 14
0x2eb7 JP NZ, 0x2EBB    ; C2 BB 2E
0x2eba INC D            ; 14
0x2ebb CP N             ; FE D8
0x2ebd JP Z, 0x2FD2     ; CA D2 2F
0x2ec0 CP N             ; FE DD
0x2ec2 JP Z, 0x2FE0     ; CA E0 2F
0x2ec5 CP N             ; FE F0
0x2ec7 JR Z, 0x43       ; 28 41
0x2ec9 CP N             ; FE 31
0x2ecb JR C, 0x04       ; 38 02
0x2ecd SUB N            ; D6 20
0x2ecf CP N             ; FE 21
0x2ed1 JP Z, 0x2FF6     ; CA F6 2F
0x2ed4 CP N             ; FE 1C
0x2ed6 JP Z, 0x2F40     ; CA 40 2F
0x2ed9 CP N             ; FE 23
0x2edb JR Z, 0x41       ; 28 3F
0x2edd CP N             ; FE 19
0x2edf JP Z, 0x2F7D     ; CA 7D 2F
0x2ee2 CP N             ; FE 14
0x2ee4 JP Z, 0x2F4A     ; CA 4A 2F
0x2ee7 CP N             ; FE 13
0x2ee9 JP Z, 0x2F65     ; CA 65 2F
0x2eec CP N             ; FE 15
0x2eee JP Z, 0x2FE3     ; CA E3 2F
0x2ef1 CP N             ; FE 28
0x2ef3 JP Z, 0x2F78     ; CA 78 2F
0x2ef6 CP N             ; FE 1B
0x2ef8 JR Z, 0x1E       ; 28 1C
0x2efa CP N             ; FE 18
0x2efc JP Z, 0x2F75     ; CA 75 2F
0x2eff CP N             ; FE 11
0x2f01 RET NZ           ; C0
0x2f02 POP BC           ; C1
0x2f03 POP DE           ; D1
0x2f04 CALL 0x20FE      ; CD FE 20
0x2f07 JP 0x2E65        ; C3 65 2E

0x2f0a LD A, (HL)       ; 7E
0x2f0b OR A             ; B7
0x2f0c RET Z            ; C8
0x2f0d INC B            ; 04
0x2f0e CALL 0x032A      ; CD 2A 03
0x2f11 INC HL           ; 23
0x2f12 DEC D            ; 15
0x2f13 JR NZ, -0x09     ; 20 F5
0x2f15 RET              ; C9

0x2f16 PUSH HL          ; E5
0x2f17 LD HL, 0x2F5F    ; 21 5F 2F
0x2f1a EX (SP), HL      ; E3
0x2f1b SCF              ; 37
0x2f1c PUSH AF          ; F5
0x2f1d CALL 0x0384      ; CD 84 03
0x2f20 LD E, A          ; 5F
0x2f21 POP AF           ; F1
0x2f22 PUSH AF          ; F5
0x2f23 CALL C, 0x2F5F   ; DC 5F 2F
0x2f26 LD A, (HL)       ; 7E
0x2f27 OR A             ; B7
0x2f28 JP Z, 0x2F3E     ; CA 3E 2F
0x2f2b CALL 0x032A      ; CD 2A 03
0x2f2e POP AF           ; F1
0x2f2f PUSH AF          ; F5
0x2f30 CALL C, 0x2FA1   ; DC A1 2F
0x2f33 JR C, 0x04       ; 38 02
0x2f35 INC HL           ; 23
0x2f36 INC B            ; 04
0x2f37 LD A, (HL)       ; 7E
0x2f38 CP E             ; BB
0x2f39 JR NZ, -0x13     ; 20 EB
0x2f3b DEC D            ; 15
0x2f3c JR NZ, -0x16     ; 20 E8
0x2f3e POP AF           ; F1
0x2f3f RET              ; C9

0x2f40 CALL 0x2B75      ; CD 75 2B
0x2f43 CALL 0x20FE      ; CD FE 20
0x2f46 POP BC           ; C1
0x2f47 JP 0x2E7C        ; C3 7C 2E

0x2f4a LD A, (HL)       ; 7E
0x2f4b OR A             ; B7
0x2f4c RET Z            ; C8
0x2f4d LD A, 0x21       ; 3E 21
0x2f4f CALL 0x032A      ; CD 2A 03
0x2f52 LD A, (HL)       ; 7E
0x2f53 OR A             ; B7
0x2f54 JR Z, 0x0B       ; 28 09
0x2f56 CALL 0x032A      ; CD 2A 03
0x2f59 CALL 0x2FA1      ; CD A1 2F
0x2f5c DEC D            ; 15
0x2f5d JR NZ, -0x0B     ; 20 F3
0x2f5f LD A, 0x21       ; 3E 21
0x2f61 CALL 0x032A      ; CD 2A 03
0x2f64 RET              ; C9

0x2f65 LD A, (HL)       ; 7E
0x2f66 OR A             ; B7
0x2f67 RET Z            ; C8
0x2f68 CALL 0x0384      ; CD 84 03
0x2f6b LD (HL), A       ; 77
0x2f6c CALL 0x032A      ; CD 2A 03
0x2f6f INC HL           ; 23
0x2f70 INC B            ; 04
0x2f71 DEC D            ; 15
0x2f72 JR NZ, -0x0D     ; 20 F1
0x2f74 RET              ; C9

0x2f75 LD (HL), 0x00    ; 36 00
0x2f77 LD C, B          ; 48
0x2f78 LD D, 0xFF       ; 16 FF
0x2f7a CALL 0x2F0A      ; CD 0A 2F
0x2f7d CALL 0x0384      ; CD 84 03
0x2f80 OR A             ; B7
0x2f81 JP Z, 0x2F7D     ; CA 7D 2F
0x2f84 CP N             ; FE 08
0x2f86 JR Z, 0x0C       ; 28 0A
0x2f88 CP N             ; FE 0D
0x2f8a JP Z, 0x2FE0     ; CA E0 2F
0x2f8d CP N             ; FE 1B
0x2f8f RET Z            ; C8
0x2f90 JR NZ, 0x20      ; 20 1E
0x2f92 LD A, 0x08       ; 3E 08
0x2f94 DEC B            ; 05
0x2f95 INC B            ; 04
0x2f96 JR Z, 0x21       ; 28 1F
0x2f98 CALL 0x032A      ; CD 2A 03
0x2f9b DEC HL           ; 2B
0x2f9c DEC B            ; 05
0x2f9d LD DE, 0x2F7D    ; 11 7D 2F
0x2fa0 PUSH DE          ; D5
0x2fa1 PUSH HL          ; E5
0x2fa2 DEC C            ; 0D
0x2fa3 LD A, (HL)       ; 7E
0x2fa4 OR A             ; B7
0x2fa5 SCF              ; 37
0x2fa6 JP Z, 0x0890     ; CA 90 08
0x2fa9 INC HL           ; 23
0x2faa LD A, (HL)       ; 7E
0x2fab DEC HL           ; 2B
0x2fac LD (HL), A       ; 77
0x2fad INC HL           ; 23
0x2fae JR -0x0B         ; 18 F3

0x2fb0 PUSH AF          ; F5
0x2fb1 LD A, C          ; 79
0x2fb2 CP N             ; FE FF
0x2fb4 JR C, 0x05       ; 38 03
0x2fb6 POP AF           ; F1
0x2fb7 JR -0x3A         ; 18 C4

0x2fb9 SUB B            ; 90
0x2fba INC C            ; 0C
0x2fbb INC B            ; 04
0x2fbc PUSH BC          ; C5
0x2fbd EX DE, HL        ; EB
0x2fbe LD L, A          ; 6F
0x2fbf LD H, 0x00       ; 26 00
0x2fc1 ADD HL, DE       ; 19
0x2fc2 LD B, H          ; 44
0x2fc3 LD C, L          ; 4D
0x2fc4 INC HL           ; 23
0x2fc5 CALL 0x1958      ; CD 58 19
0x2fc8 POP BC           ; C1
0x2fc9 POP AF           ; F1
0x2fca LD (HL), A       ; 77
0x2fcb CALL 0x032A      ; CD 2A 03
0x2fce INC HL           ; 23
0x2fcf JP 0x2F7D        ; C3 7D 2F

0x2fd2 LD A, B          ; 78
0x2fd3 OR A             ; B7
0x2fd4 RET Z            ; C8
0x2fd5 DEC B            ; 05
0x2fd6 DEC HL           ; 2B
0x2fd7 LD A, 0x08       ; 3E 08
0x2fd9 CALL 0x032A      ; CD 2A 03
0x2fdc DEC D            ; 15
0x2fdd JR NZ, -0x0B     ; 20 F3
0x2fdf RET              ; C9

0x2fe0 CALL 0x2B75      ; CD 75 2B
0x2fe3 CALL 0x20FE      ; CD FE 20
0x2fe6 POP BC           ; C1
0x2fe7 POP DE           ; D1
0x2fe8 LD A, D          ; 7A
0x2fe9 AND E            ; A3
0x2fea INC A            ; 3C
0x2feb LD HL, (0x40A7)  ; 2A A7 40
0x2fee DEC HL           ; 2B
0x2fef RET Z            ; C8
0x2ff0 SCF              ; 37
0x2ff1 INC HL           ; 23
0x2ff2 PUSH AF          ; F5
0x2ff3 JP 0x1A98        ; C3 98 1A

0x2ff6 POP BC           ; C1
0x2ff7 POP DE           ; D1
0x2ff8 JP 0x1A19        ; C3 19 1A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass500BWriteleader_JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3000 JP 0x325E        ; C3 5E 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - 1500 Baud - Write leader & sync byte - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3003 JP 0x329B        ; C3 9B 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass -  500 Baud - Read leader till sync - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3006 JP 0x3274        ; C3 74 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - 1500 Baud - Read leader till sync - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3009 JP 0x32DA        ; C3 DA 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - Turn Cassette off - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x300c JP 0x31C0        ; C3 C0 31

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - Turn Cassette on & wait full speed - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x300f JP 0x31D1        ; C3 D1 31

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Disk - Test if Drive ready, then Reset - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3012 JP 0x34AB        ; C3 AB 34

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IPL_RESET_ENTRY_JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3015 JP 0x3455        ; C3 55 34

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interrupt - Service Routine - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3018 JP 0x35C2        ; C3 C2 35

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RS-232C - Initialise - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x301b JP 0x35FB        ; C3 FB 35

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RS-232C - Input Routine - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x301e JP 0x365A        ; C3 5A 36

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RS-232C - Output Routine - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3021 JP 0x3680        ; C3 80 36

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Keyboard - Input Routine - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3024 JP 0x338E        ; C3 8E 33

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; I/O - Change Device Routing - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3027 JP 0x3739        ; C3 39 37

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC - \"#\" processing (e.g.Print#) - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x302a JP 0x31F7        ; C3 F7 31

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC line print processing - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x302d JP 0x377B        ; C3 7B 37

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC line print processing - JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3030 JP 0x3799        ; C3 99 37

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GETDAT_JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3033 JP 0x35BB        ; C3 BB 35

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GETTIM_JMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3036 JP 0x35A0        ; C3 A0 35

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ???
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3042 JP 0x37B5        ; C3 B5 37

0x3060 LD A, (0x37EA)   ; 3A EA 37
0x3063 OR A             ; B7
0x3064 RET              ; C9

0x307d LD HL, 0x05DC    ; 21 DC 05
0x3080 LD (0x41FF), HL  ; 22 FF 41
0x3083 XOR A            ; AF
0x3084 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GETTIM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x30a0 LD (HL), A       ; 77
0x30a1 XOR A            ; AF
0x30a2 RET              ; C9

0x30bd LD A, 0x01       ; 3E 01
0x30bf LD HL, 0x4019    ; 21 19 40
0x30c2 XOR (HL)         ; AE
0x30c3 JR -0x23         ; 18 DB

0x30e0 CALL 0x01D9      ; CD D9 01
0x30e3 XOR A            ; AF
0x30e4 RET              ; C9

0x30fd JR Z, -0x1D      ; 28 E1
0x30ff AND (HL)         ; A6
0x3100 CP N             ; FE 01
0x3102 RET NZ           ; C0
0x3103 RST 28H          ; EF
0x3104 RET              ; C9

0x3120 INC D            ; 14
0x3121 INC HL           ; 23
0x3122 RLC C            ; CB 01
0x3124 RET              ; C9

0x313d LD A, (0x41FD)   ; 3A FD 41
0x3140 LD L, A          ; 6F
0x3141 LD A, (0x41FE)   ; 3A FE 41
0x3144 RET              ; C9

0x31a5 LD A, 0x01       ; 3E 01
0x31a7 OUT (N), A       ; D3 FF
0x31a9 LD B, 0x0D       ; 06 0D
0x31ab DJNZ N           ; 10 FE
0x31ad LD A, 0x02       ; 3E 02
0x31af OUT (N), A       ; D3 FF
0x31b1 LD B, 0x0D       ; 06 0D
0x31b3 DJNZ N           ; 10 FE
0x31b5 CALL 0x31F3      ; CD F3 31
0x31b8 LD B, 0x78       ; 06 78
0x31ba DJNZ N           ; 10 FE
0x31bc RET              ; C9

0x31bd LD HL, 0x2CA5    ; 21 A5 2C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - Turn Cassette off
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x31c0 LD A, (0x4213)   ; 3A 13 42
0x31c3 OUT (N), A       ; D3 E0
0x31c5 IN A, (N)        ; DB FF
0x31c7 LD A, (0x4210)   ; 3A 10 42
0x31ca AND N            ; E6 FD
0x31cc CALL 0x31ED      ; CD ED 31
0x31cf EI               ; FB
0x31d0 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - Turn Cassette on & wait full speed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x31d1 EX DE, HL        ; EB
0x31d2 EX (SP), HL      ; E3
0x31d3 PUSH BC          ; C5
0x31d4 PUSH HL          ; E5
0x31d5 EX DE, HL        ; EB
0x31d6 IN A, (N)        ; DB EC
0x31d8 LD DE, 0x2020    ; 11 20 20
0x31db LD (0x3C3E), DE  ; ED 53 3E 3C
0x31df CALL 0x31E8      ; CD E8 31
0x31e2 LD BC, 0x7D00    ; 01 00 7D
0x31e5 JP 0x0060        ; C3 60 00

0x31e8 LD A, (0x4210)   ; 3A 10 42
0x31eb OR N             ; F6 02
0x31ed LD (0x4210), A   ; 32 10 42
0x31f0 OUT (N), A       ; D3 EC
0x31f2 RET              ; C9

0x31f3 XOR A            ; AF
0x31f4 OUT (N), A       ; D3 FF
0x31f6 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC - \"#\" processing (e.g.Print#)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x31f7 LD A, (HL)       ; 7E
0x31f8 SUB N            ; D6 23
0x31fa JP NZ, 0x0253    ; C2 53 02
0x31fd CALL 0x2B01      ; CD 01 2B
0x3200 RST 8H           ; CF
0x3201 INC L            ; 2C
0x3202 RET              ; C9

0x321e JR 0x7A          ; 18 78

0x3220 PUSH BC          ; C5
0x3221 IN A, (N)        ; DB FF
0x3223 RLA              ; 17
0x3224 JR C, 0x0A       ; 38 08
0x3226 CALL 0x028D      ; CD 8D 02
0x3229 JR Z, -0x08      ; 28 F6
0x322b JP 0x335C        ; C3 5C 33

0x322e LD B, 0x6E       ; 06 6E
0x3230 DJNZ N           ; 10 FE
0x3232 CALL 0x31F3      ; CD F3 31
0x3235 LD B, 0x98       ; 06 98
0x3237 DJNZ N           ; 10 FE
0x3239 IN A, (N)        ; DB FF
0x323b POP BC           ; C1
0x323c RLA              ; 17
0x323d RL D             ; CB 12
0x323f JR -0x4C         ; 18 B2

0x3241 PUSH AF          ; F5
0x3242 PUSH BC          ; C5
0x3243 PUSH DE          ; D5
0x3244 LD C, 0x08       ; 0E 08
0x3246 LD D, A          ; 57
0x3247 CALL 0x31A5      ; CD A5 31
0x324a RLC D            ; CB 02
0x324c JR NC, 0x0C      ; 30 0A
0x324e CALL 0x31A5      ; CD A5 31
0x3251 DEC C            ; 0D
0x3252 JR NZ, -0x0B     ; 20 F3
0x3254 POP DE           ; D1
0x3255 POP BC           ; C1
0x3256 POP AF           ; F1
0x3257 RET              ; C9

0x3258 LD B, 0x9A       ; 06 9A
0x325a DJNZ N           ; 10 FE
0x325c JR -0x0B         ; 18 F3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass500BWriteleader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x325e PUSH HL          ; E5
0x325f LD HL, 0x3241    ; 21 41 32
0x3262 LD (0x420C), HL  ; 22 0C 42
0x3265 LD B, 0x53       ; 06 53
0x3267 XOR A            ; AF
0x3268 CALL 0x3241      ; CD 41 32
0x326b DJNZ N           ; 10 FB
0x326d LD A, 0xA5       ; 3E A5
0x326f CALL 0x3241      ; CD 41 32
0x3272 JR 0x25          ; 18 23

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass -  500 Baud - Read leader till sync
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3274 PUSH HL          ; E5
0x3275 LD HL, 0x3203    ; 21 03 32
0x3278 LD (0x420E), HL  ; 22 0E 42
0x327b LD B, 0x40       ; 06 40
0x327d LD D, 0x00       ; 16 00
0x327f CALL 0x3220      ; CD 20 32
0x3282 LD A, D          ; 7A
0x3283 OR A             ; B7
0x3284 JR NZ, -0x09     ; 20 F5
0x3286 DJNZ N           ; 10 F7
0x3288 CALL 0x3220      ; CD 20 32
0x328b LD A, D          ; 7A
0x328c CP N             ; FE A5
0x328e JR NZ, -0x06     ; 20 F8
0x3290 LD HL, 0x2A2A    ; 21 2A 2A
0x3293 LD (0x3C3E), HL  ; 22 3E 3C
0x3296 LD A, H          ; 7C
0x3297 POP HL           ; E1
0x3298 POP BC           ; C1
0x3299 POP DE           ; D1
0x329a RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - 1500 Baud - Write leader & sync byte
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x329b PUSH HL          ; E5
0x329c LD HL, 0x32BA    ; 21 BA 32
0x329f LD (0x420C), HL  ; 22 0C 42
0x32a2 LD B, 0x00       ; 06 00
0x32a4 LD A, 0x55       ; 3E 55
0x32a6 CALL 0x32B4      ; CD B4 32
0x32a9 DJNZ N           ; 10 F9
0x32ab LD A, 0x7F       ; 3E 7F
0x32ad CALL 0x32B4      ; CD B4 32
0x32b0 LD A, 0xA5       ; 3E A5
0x32b2 JR -0x1B         ; 18 E3

0x32b4 PUSH AF          ; F5
0x32b5 PUSH BC          ; C5
0x32b6 PUSH DE          ; D5
0x32b7 LD C, A          ; 4F
0x32b8 JR 0x09          ; 18 07

0x32c1 LD B, 0x08       ; 06 08
0x32c3 CALL 0x3335      ; CD 35 33
0x32c6 DJNZ N           ; 10 FB
0x32c8 JR -0x74         ; 18 8A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cass - 1500 Baud - Read leader till sync
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x32da PUSH HL          ; E5
0x32db LD HL, 0x32CA    ; 21 CA 32
0x32de LD (0x420E), HL  ; 22 0E 42
0x32e1 LD A, 0x01       ; 3E 01
0x32e3 OUT (N), A       ; D3 E0
0x32e5 LD B, 0x80       ; 06 80
0x32e7 CALL 0x3350      ; CD 50 33
0x32ea LD A, C          ; 79
0x32eb CP N             ; FE 0F
0x32ed JR C, -0x08      ; 38 F6
0x32ef CP N             ; FE 3E
0x32f1 JR NC, -0x0C     ; 30 F2
0x32f3 DJNZ N           ; 10 F2
0x32f5 LD HL, 0x0000    ; 21 00 00
0x32f8 LD B, 0x40       ; 06 40
0x32fa CALL 0x3350      ; CD 50 33
0x32fd CALL 0x3350      ; CD 50 33
0x3300 LD D, C          ; 51
0x3301 CALL 0x3350      ; CD 50 33
0x3304 LD A, D          ; 7A
0x3305 SUB C            ; 91
0x3306 JR NC, 0x04      ; 30 02
0x3308 NEG              ; ED 44
0x330a CP N             ; FE 0D
0x330c JR C, 0x07       ; 38 05
0x330e INC H            ; 24
0x330f DJNZ N           ; 10 E9
0x3311 JR 0x05          ; 18 03

0x3313 INC L            ; 2C
0x3314 DJNZ N           ; 10 E4
0x3316 LD A, 0x40       ; 3E 40
0x3318 CP H             ; BC
0x3319 JR Z, 0x0C       ; 28 0A
0x331b CP L             ; BD
0x331c JR NZ, -0x27     ; 20 D7
0x331e LD A, 0x02       ; 3E 02
0x3320 OUT (N), A       ; D3 E0
0x3322 CALL 0x3350      ; CD 50 33
0x3325 LD D, 0x00       ; 16 00
0x3327 CALL 0x3350      ; CD 50 33
0x332a CALL 0x337C      ; CD 7C 33
0x332d LD A, D          ; 7A
0x332e CP N             ; FE 7F
0x3330 JR NZ, -0x09     ; 20 F5
0x3332 JP 0x3290        ; C3 90 32

0x3335 RLC C            ; CB 01
0x3337 JR NC, 0x07      ; 30 05
0x3339 LD DE, 0x1217    ; 11 17 12
0x333c JR 0x05          ; 18 03

0x333e LD DE, 0x2B2F    ; 11 2F 2B
0x3341 DEC D            ; 15
0x3342 JR NZ, -0x01     ; 20 FD
0x3344 LD A, 0x02       ; 3E 02
0x3346 OUT (N), A       ; D3 FF
0x3348 DEC E            ; 1D
0x3349 JR NZ, -0x01     ; 20 FD
0x334b LD A, 0x01       ; 3E 01
0x334d OUT (N), A       ; D3 FF
0x334f RET              ; C9

0x3350 EI               ; FB
0x3351 LD C, 0x00       ; 0E 00
0x3353 INC C            ; 0C
0x3354 LD A, (0x3840)   ; 3A 40 38
0x3357 AND N            ; E6 04
0x3359 JR Z, -0x06      ; 28 F8
0x335b DI               ; F3
0x335c LD HL, 0x4B42    ; 21 42 4B
0x335f LD (0x3C3E), HL  ; 22 3E 3C
0x3362 JP 0x4203        ; C3 03 42

0x3365 LD E, 0x01       ; 1E 01
0x3367 JR 0x04          ; 18 02

0x3369 LD E, 0x00       ; 1E 00
0x336b LD A, 0x06       ; 3E 06
0x336d ADD A, C         ; 81
0x336e LD C, A          ; 4F
0x336f IN A, (N)        ; DB FF
0x3371 AND N            ; E6 01
0x3373 CP E             ; BB
0x3374 JR NZ, 0x05      ; 20 03
0x3376 POP AF           ; F1
0x3377 POP AF           ; F1
0x3378 RET              ; C9

0x3379 POP AF           ; F1
0x337a EI               ; FB
0x337b RET              ; C9

0x337c LD A, C          ; 79
0x337d CP N             ; FE 22
0x337f RL D             ; CB 12
0x3381 CP N             ; FE 0F
0x3383 JR C, 0x05       ; 38 03
0x3385 CP N             ; FE 3E
0x3387 RET C            ; D8
0x3388 LD A, 0x44       ; 3E 44
0x338a LD (0x3C3E), A   ; 32 3E 3C
0x338d RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Keyboard - Input Routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x338e CALL 0x3060      ; CD 60 30
0x3391 JR NZ, 0x12      ; 20 10
0x3393 LD BC, 0x3880    ; 01 80 38
0x3396 LD HL, 0x4018    ; 21 18 40
0x3399 LD A, (BC)       ; 0A
0x339a AND N            ; E6 02
0x339c LD E, A          ; 5F
0x339d XOR (HL)         ; AE
0x339e LD (HL), E       ; 73
0x339f AND E            ; A3
0x33a0 JP NZ, 0x30BD    ; C2 BD 30
0x33a3 LD A, 0xFF       ; 3E FF
0x33a5 LD HL, 0x3840    ; 21 40 38
0x33a8 BIT 4, (HL)      ; CB 66
0x33aa JR Z, 0x0A       ; 28 08
0x33ac SLA L            ; CB 25
0x33ae BIT 0, (HL)      ; CB 46
0x33b0 JR Z, 0x04       ; 28 02
0x33b2 LD A, 0x1F       ; 3E 1F
0x33b4 LD (0x4224), A   ; 32 24 42
0x33b7 LD BC, 0x3801    ; 01 01 38
0x33ba LD HL, 0x4036    ; 21 36 40
0x33bd LD D, 0x00       ; 16 00
0x33bf LD A, (BC)       ; 0A
0x33c0 LD E, A          ; 5F
0x33c1 XOR (HL)         ; AE
0x33c2 LD (HL), E       ; 73
0x33c3 AND E            ; A3
0x33c4 JR NZ, 0x34      ; 20 32
0x33c6 CALL 0x3120      ; CD 20 31
0x33c9 JP P, 0x33BF     ; F2 BF 33
0x33cc CALL 0x313D      ; CD 3D 31
0x33cf AND (HL)         ; A6
0x33d0 JR NZ, 0x0A      ; 20 08
0x33d2 SBC HL, HL       ; ED 62
0x33d4 LD (0x4201), HL  ; 22 01 42
0x33d7 JP 0x307D        ; C3 7D 30

0x33da PUSH HL          ; E5
0x33db LD HL, (0x4201)  ; 2A 01 42
0x33de INC HL           ; 23
0x33df LD (0x4201), HL  ; 22 01 42
0x33e2 LD DE, (0x41FF)  ; ED 5B FF 41
0x33e6 SBC HL, DE       ; ED 52
0x33e8 POP DE           ; D1
0x33e9 JP C, 0x30A1     ; DA A1 30
0x33ec XOR A            ; AF
0x33ed LD (DE), A       ; 12
0x33ee LD (0x4201), HL  ; 22 01 42
0x33f1 LD L, 0x96       ; 2E 96
0x33f3 LD (0x41FF), HL  ; 22 FF 41
0x33f6 JR -0x53         ; 18 AB

0x33f8 LD E, A          ; 5F
0x33f9 PUSH BC          ; C5
0x33fa LD BC, 0x05C4    ; 01 C4 05
0x33fd CALL 0x0060      ; CD 60 00
0x3400 POP BC           ; C1
0x3401 LD A, (BC)       ; 0A
0x3402 AND E            ; A3
0x3403 RET Z            ; C8
0x3404 LD (0x41FE), A   ; 32 FE 41
0x3407 LD A, L          ; 7D
0x3408 LD (0x41FD), A   ; 32 FD 41
0x340b LD A, D          ; 7A
0x340c RLA              ; 17
0x340d RLA              ; 17
0x340e RLA              ; 17
0x340f LD D, A          ; 57
0x3410 LD A, E          ; 7B
0x3411 RRCA             ; 0F
0x3412 JR C, 0x05       ; 38 03
0x3414 INC D            ; 14
0x3415 JR -0x04         ; 18 FA

0x3417 CALL 0x3060      ; CD 60 30
0x341a LD A, (0x3880)   ; 3A 80 38
0x341d JR NZ, 0x04      ; 20 02
0x341f AND N            ; E6 01
0x3421 AND N            ; E6 03
0x3423 JR Z, 0x04       ; 28 02
0x3425 SET 6, D         ; CB F2
0x3427 LD A, (0x4019)   ; 3A 19 40
0x342a OR A             ; B7
0x342b JR Z, 0x04       ; 28 02
0x342d SET 7, D         ; CB FA
0x342f LD HL, 0x3045    ; 21 45 30
0x3432 LD E, D          ; 5A
0x3433 LD D, 0x00       ; 16 00
0x3435 ADD HL, DE       ; 19
0x3436 LD A, (HL)       ; 7E
0x3437 CP N             ; FE 1A
0x3439 JP Z, 0x30A1     ; CA A1 30
0x343c LD B, A          ; 47
0x343d CALL 0x3060      ; CD 60 30
0x3440 LD A, B          ; 78
0x3441 JR Z, 0x06       ; 28 04
0x3443 OR A             ; B7
0x3444 JP Z, 0x30BD     ; CA BD 30
0x3447 LD HL, 0x4224    ; 21 24 42
0x344a CP N             ; FE 2A
0x344c JR NZ, 0x06      ; 20 04
0x344e LD A, 0x1F       ; 3E 1F
0x3450 CP (HL)          ; BE
0x3451 LD A, B          ; 78
0x3452 JP 0x30FD        ; C3 FD 30

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IPL_RESET_ENTRY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3455 IM 1             ; ED 56
0x3457 LD SP, 0x407D    ; 31 7D 40
0x345a OUT (N), A       ; D3 E4
0x345c OR N             ; F6 20
0x345e OUT (N), A       ; D3 EC
0x3460 LD A, 0x81       ; 3E 81
0x3462 OUT (N), A       ; D3 F4
0x3464 LD A, 0xD0       ; 3E D0
0x3466 OUT (N), A       ; D3 F0
0x3468 CALL 0x3518      ; CD 18 35
0x346b LD A, 0x04       ; 3E 04
0x346d OUT (N), A       ; D3 E0
0x346f LD A, 0x0B       ; 3E 0B
0x3471 OUT (N), A       ; D3 F0
0x3473 LD HL, 0x36AA    ; 21 AA 36
0x3476 LD DE, 0x4000    ; 11 00 40
0x3479 LD BC, 0x004C    ; 01 4C 00
0x347c LDIR             ; ED B0
0x347e LD HL, 0x36F9    ; 21 F9 36
0x3481 LD DE, 0x41E5    ; 11 E5 41
0x3484 LD BC, 0x0040    ; 01 40 00
0x3487 LDIR             ; ED B0
0x3489 CALL 0x01C9      ; CD C9 01
0x348c CALL 0x028D      ; CD 8D 02
0x348f JP NZ, 0x37AF    ; C2 AF 37
0x3492 IN A, (N)        ; DB F0
0x3494 INC A            ; 3C
0x3495 JP Z, 0x37AF     ; CA AF 37
0x3498 LD BC, 0x0000    ; 01 00 00
0x349b DEC BC           ; 0B
0x349c LD A, 0x81       ; 3E 81
0x349e OUT (N), A       ; D3 F4
0x34a0 LD A, B          ; 78
0x34a1 OR C             ; B1
0x34a2 JP Z, 0x37AF     ; CA AF 37
0x34a5 IN A, (N)        ; DB F0
0x34a7 BIT 2, A         ; CB 57
0x34a9 JR Z, -0x0E      ; 28 F0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Disk - Test if Drive ready, then Reset
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x34ab LD E, 0x05       ; 1E 05
0x34ad LD BC, 0x0000    ; 01 00 00
0x34b0 IN A, (N)        ; DB F0
0x34b2 BIT 1, A         ; CB 4F
0x34b4 JR NZ, 0x13      ; 20 11
0x34b6 DEC BC           ; 0B
0x34b7 LD A, 0x81       ; 3E 81
0x34b9 OUT (N), A       ; D3 F4
0x34bb LD A, B          ; 78
0x34bc OR C             ; B1
0x34bd JR NZ, -0x0D     ; 20 F1
0x34bf LD HL, 0x0277    ; 21 77 02
0x34c2 CALL 0x021B      ; CD 1B 02
0x34c5 JR -0x1A         ; 18 E4

0x34c7 DEC E            ; 1D
0x34c8 JR NZ, -0x1B     ; 20 E3
0x34ca LD A, 0x81       ; 3E 81
0x34cc OUT (N), A       ; D3 F4
0x34ce LD HL, 0x3502    ; 21 02 35
0x34d1 LD (0x404A), HL  ; 22 4A 40
0x34d4 LD A, 0xC3       ; 3E C3
0x34d6 LD (0x4049), A   ; 32 49 40
0x34d9 LD A, 0x80       ; 3E 80
0x34db OUT (N), A       ; D3 E4
0x34dd LD BC, 0x00F3    ; 01 F3 00
0x34e0 LD HL, 0x4300    ; 21 00 43
0x34e3 LD A, 0x01       ; 3E 01
0x34e5 OUT (N), A       ; D3 F2
0x34e7 LD A, 0x80       ; 3E 80
0x34e9 OUT (N), A       ; D3 F0
0x34eb CALL 0x3518      ; CD 18 35
0x34ee IN A, (N)        ; DB F0
0x34f0 AND N            ; E6 02
0x34f2 JP Z, 0x34EE     ; CA EE 34
0x34f5 INI              ; ED A2
0x34f7 LD A, 0x81       ; 3E 81
0x34f9 OR N             ; F6 40
0x34fb OUT (N), A       ; D3 F4
0x34fd INI              ; ED A2
0x34ff JP 0x34F7        ; C3 F7 34

0x3518 PUSH BC          ; C5
0x3519 POP BC           ; C1
0x351a NOP              ; 00
0x351b RET              ; C9

0x35a0 LD DE, 0x4219    ; 11 19 42
0x35a3 LD C, 0x3A       ; 0E 3A
0x35a5 LD B, 0x03       ; 06 03
0x35a7 LD A, (DE)       ; 1A
0x35a8 DEC DE           ; 1B
0x35a9 LD (HL), 0x2F    ; 36 2F
0x35ab INC (HL)         ; 34
0x35ac SUB N            ; D6 0A
0x35ae JR NC, -0x03     ; 30 FB
0x35b0 ADD A, 0x3A      ; C6 3A
0x35b2 INC HL           ; 23
0x35b3 LD (HL), A       ; 77
0x35b4 INC HL           ; 23
0x35b5 DEC B            ; 05
0x35b6 RET Z            ; C8
0x35b7 LD (HL), C       ; 71
0x35b8 INC HL           ; 23
0x35b9 JR -0x12         ; 18 EC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GETDAT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x35bb LD DE, 0x421C    ; 11 1C 42
0x35be LD C, 0x2F       ; 0E 2F
0x35c0 JR -0x1B         ; 18 E3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interrupt - Service Routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x35c2 PUSH AF          ; F5
0x35c3 IN A, (N)        ; DB E0
0x35c5 RRA              ; 1F
0x35c6 JP NC, 0x3365    ; D2 65 33
0x35c9 RRA              ; 1F
0x35ca JP NC, 0x3369    ; D2 69 33
0x35cd PUSH BC          ; C5
0x35ce PUSH DE          ; D5
0x35cf PUSH HL          ; E5
0x35d0 PUSH IX          ; DD E5
0x35d2 PUSH IY          ; FD E5
0x35d4 LD HL, 0x35F1    ; 21 F1 35
0x35d7 PUSH HL          ; E5
0x35d8 RRA              ; 1F
0x35d9 JP NC, 0x4046    ; D2 46 40
0x35dc RRA              ; 1F
0x35dd JP NC, 0x403D    ; D2 3D 40
0x35e0 RRA              ; 1F
0x35e1 JP NC, 0x4206    ; D2 06 42
0x35e4 RRA              ; 1F
0x35e5 JP NC, 0x4209    ; D2 09 42
0x35e8 RRA              ; 1F
0x35e9 JP NC, 0x4040    ; D2 40 40
0x35ec RRA              ; 1F
0x35ed JP NC, 0x4043    ; D2 43 40
0x35f0 POP HL           ; E1
0x35f1 POP IY           ; FD E1
0x35f3 POP IX           ; DD E1
0x35f5 POP HL           ; E1
0x35f6 POP DE           ; D1
0x35f7 POP BC           ; C1
0x35f8 POP AF           ; F1
0x35f9 EI               ; FB
0x35fa RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RS-232C - Initialise
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x35fb DI               ; F3
0x35fc IN A, (N)        ; DB EA
0x35fe CP N             ; FE FF
0x3600 JR Z, 0x3A       ; 28 38
0x3602 XOR A            ; AF
0x3603 OUT (N), A       ; D3 E8
0x3605 LD A, (IX+0x03)  ; DD 7E 03
0x3608 OUT (N), A       ; D3 E9
0x360a LD A, (IX+0x04)  ; DD 7E 04
0x360d OR A             ; B7
0x360e JR Z, 0x2C       ; 28 2A
0x3610 OUT (N), A       ; D3 EA
0x3612 LD IY, 0x41E5    ; FD 21 E5 41
0x3616 CALL 0x3644      ; CD 44 36
0x3619 LD A, (IX+0x05)  ; DD 7E 05
0x361c OR A             ; B7
0x361d JR Z, 0x06       ; 28 04
0x361f SET 1, (IY+0xFD) ; FD CB 04 CE FD
0x3623 SET 2, (IY+0xFD) ; FD CB 04 D6 FD
0x3624 RLC H            ; CB 04
0x3626 SUB N            ; D6 FD
0x3628 LD HL, 0x41ED    ; 21 ED 41
0x362b OR A             ; B7
0x362c JR Z, 0x06       ; 28 04
0x362e SET 1, (IY+0xFD) ; FD CB 04 CE FD
0x3632 SET 2, (IY+0xDB) ; FD CB 04 D6 DB
0x3633 RLC H            ; CB 04
0x3635 SUB N            ; D6 DB
0x3636 IN A, (N)        ; DB E8
0x3637 RET PE           ; E8
0x3638 EI               ; FB
0x3639 RET              ; C9

0x363a XOR A            ; AF
0x363b LD B, 0x04       ; 06 04
0x363d LD C, 0xE8       ; 0E E8
0x363f OUT (C), A       ; ED 79
0x3641 INC C            ; 0C
0x3642 DJNZ N           ; 10 FB
0x3644 LD HL, 0x41E8    ; 21 E8 41
0x3647 LD B, 0x03       ; 06 03
0x3649 LD (HL), 0x00    ; 36 00
0x364b INC HL           ; 23
0x364c DJNZ N           ; 10 FB
0x364e LD HL, 0x41F0    ; 21 F0 41
0x3651 LD B, 0x03       ; 06 03
0x3653 LD (HL), 0x00    ; 36 00
0x3655 INC HL           ; 23
0x3656 DJNZ N           ; 10 FB
0x3658 JR -0x22         ; 18 DC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RS-232C - Input Routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x365a LD IX, 0x41E5    ; DD 21 E5 41
0x365e XOR A            ; AF
0x365f LD (IX+0x03), A  ; DD 77 03
0x3662 BIT 2, (IX+0x04) ; DD CB 04 56
0x3666 RET Z            ; C8
0x3667 IN A, (N)        ; DB EA
0x3669 BIT 7, A         ; CB 7F
0x366b JR NZ, 0x0F      ; 20 0D
0x366d BIT 1, (IX+0x04) ; DD CB 04 4E
0x3671 RET Z            ; C8
0x3672 CALL 0x028D      ; CD 8D 02
0x3675 JR Z, -0x0E      ; 28 F0
0x3677 JP 0x4203        ; C3 03 42

0x367a IN A, (N)        ; DB EB
0x367c LD (IX+0x03), A  ; DD 77 03
0x367f RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RS-232C - Output Routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3680 LD IX, 0x41ED    ; DD 21 ED 41
0x3684 BIT 2, (IX+0x04) ; DD CB 04 56
0x3688 RET Z            ; C8
0x3689 IN A, (N)        ; DB EA
0x368b BIT 6, A         ; CB 77
0x368d JR NZ, 0x0F      ; 20 0D
0x368f BIT 1, (IX+0x04) ; DD CB 04 4E
0x3693 RET Z            ; C8
0x3694 CALL 0x028D      ; CD 8D 02
0x3697 JR Z, -0x0E      ; 28 F0
0x3699 JP 0x4203        ; C3 03 42

0x369c LD A, (IX+0x03)  ; DD 7E 03
0x369f OR A             ; B7
0x36a0 JR NZ, 0x03      ; 20 01
0x36a2 LD A, C          ; 79
0x36a3 OUT (N), A       ; D3 EB
0x36a5 LD (IX+0x03), 0x00; DD 36 03 00
0x36a9 RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; I/O - Change Device Routing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3739 LD A, (IX+0x03)  ; DD 7E 03
0x373c CP N             ; FE 52
0x373e JR NZ, 0x05      ; 20 03
0x3740 LD A, (IX+0x04)  ; DD 7E 04
0x3743 CALL 0x375E      ; CD 5E 37
0x3746 RET NZ           ; C0
0x3747 PUSH HL          ; E5
0x3748 LD A, (IX+0x05)  ; DD 7E 05
0x374b CP N             ; FE 52
0x374d JR NZ, 0x05      ; 20 03
0x374f LD A, (IX+0x06)  ; DD 7E 06
0x3752 CALL 0x375E      ; CD 5E 37
0x3755 EX DE, HL        ; EB
0x3756 POP HL           ; E1
0x3757 RET NZ           ; C0
0x3758 LD BC, 0x0003    ; 01 03 00
0x375b LDIR             ; ED B0
0x375d RET              ; C9

0x375e LD HL, 0x376C    ; 21 6C 37
0x3761 LD BC, 0x000F    ; 01 0F 00
0x3764 CPIR             ; ED B1
0x3766 RET NZ           ; C0
0x3767 LD A, (HL)       ; 7E
0x3768 INC HL           ; 23
0x3769 LD H, (HL)       ; 66
0x376a LD L, A          ; 6F
0x376b RET              ; C9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC line print processing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x377b CP N             ; FE 22
0x377d JR NZ, 0x0C      ; 20 0A
0x377f LD A, (0x409F)   ; 3A 9F 40
0x3782 XOR N            ; EE 01
0x3784 LD (0x409F), A   ; 32 9F 40
0x3787 LD A, 0x22       ; 3E 22
0x3789 CP N             ; FE 3A
0x378b JP NZ, 0x06AA    ; C2 AA 06
0x378e LD A, (0x409F)   ; 3A 9F 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BASIC line print processing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
0x3790 LD B, B          ; 40
0x3791 RRA              ; 1F
0x3792 JP C, 0x06A8     ; DA A8 06
0x3795 RLA              ; 17
0x3796 JP 0x06A3        ; C3 A3 06

0x3799 RST 10H          ; D7
0x379a PUSH HL          ; E5
0x379b LD A, 0x11       ; 3E 11
0x379d CALL 0x2857      ; CD 57 28
0x37a0 LD HL, (0x40D4)  ; 2A D4 40
0x37a3 CALL 0x35BB      ; CD BB 35
0x37a6 LD (HL), 0x20    ; 36 20
0x37a8 INC HL           ; 23
0x37a9 CALL 0x35A0      ; CD A0 35
0x37ac JP 0x2884        ; C3 84 28

0x37af CALL 0x37B5      ; CD B5 37
0x37b2 JP 0x0075        ; C3 75 00

0x37b5 EI               ; FB
0x37b6 CALL 0x37D7      ; CD D7 37
0x37b9 LD HL, 0x37F6    ; 21 F6 37
0x37bc CALL 0x021B      ; CD 1B 02
0x37bf CALL 0x0049      ; CD 49 00
0x37c2 CP N             ; FE 0D
0x37c4 JR Z, 0x10       ; 28 0E
0x37c6 PUSH AF          ; F5
0x37c7 CALL 0x0033      ; CD 33 00
0x37ca POP AF           ; F1
0x37cb CP N             ; FE 48
0x37cd JR Z, 0x07       ; 28 05
0x37cf CP N             ; FE 4C
0x37d1 JR NZ, -0x1C     ; 20 E2
0x37d3 XOR A            ; AF
0x37d4 LD (0x4211), A   ; 32 11 42
0x37d7 LD A, 0x0D       ; 3E 0D
0x37d9 JP 0x0033        ; C3 33 00

0x37dc LD HL, 0x3030    ; 21 30 30
0x37df LD (0x4177), HL  ; 22 77 41
0x37e2 JP 0x022E        ; C3 2E 02

0x37eb CALL 0x021B      ; CD 1B 02
0x37ee LD HL, 0x0202    ; 21 02 02
0x37f1 CALL 0x021B      ; CD 1B 02
0x37f4 JR -0x18         ; 18 E6
