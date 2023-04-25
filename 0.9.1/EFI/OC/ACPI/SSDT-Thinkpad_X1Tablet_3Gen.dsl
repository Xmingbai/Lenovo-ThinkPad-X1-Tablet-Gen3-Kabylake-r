/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL8lu7FT.aml, Tue Apr 25 23:03:38 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00002111 (8465)
 *     Revision         0x02
 *     Checksum         0x29
 *     OEM ID           "Hack"
 *     OEM Table ID     "X1Tablet"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Hack", "X1Tablet", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.TPL0, DeviceObj)
    External (_SB_.PCI0.I2C1.TPL0._STA, IntObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.SLPB._STA, UnknownObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments
    External (HPTE, FieldUnitObj)
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.SLPB._STA = 0x0B
            HPTE = Zero
        }

        Scope (_SB)
        {
            Scope (PCI0)
            {
                Device (GAUS)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (GFX0)
                {
                    Device (PNLF)
                    {
                        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                        Name (_CID, "backlight")  // _CID: Compatible ID
                        Name (_UID, 0x10)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (I2C1)
                {
                    Scope (TPL0)
                    {
                        If (_OSI ("Darwin"))
                        {
                            Name (OSYS, 0x07DC)
                        }
                    }
                }

                Scope (LPCB)
                {
                    Device (DMAC)
                    {
                        Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IO (Decode16,
                                0x0081,             // Range Minimum
                                0x0081,             // Range Maximum
                                0x01,               // Alignment
                                0x11,               // Length
                                )
                            IO (Decode16,
                                0x0093,             // Range Minimum
                                0x0093,             // Range Maximum
                                0x01,               // Alignment
                                0x0D,               // Length
                                )
                            IO (Decode16,
                                0x00C0,             // Range Minimum
                                0x00C0,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {4}
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Scope (EC)
                    {
                        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
                        Field (ESEN, ByteAcc, Lock, Preserve)
                        {
                            Offset (0x78), 
                            EST0,   8, 
                            EST1,   8, 
                            EST2,   8, 
                            EST3,   8, 
                            EST4,   8, 
                            EST5,   8, 
                            EST6,   8, 
                            EST7,   8, 
                            Offset (0xC0), 
                            EST8,   8, 
                            EST9,   8, 
                            ESTA,   8, 
                            ESTB,   8, 
                            ESTC,   8, 
                            ESTD,   8, 
                            ESTE,   8, 
                            ESTF,   8
                        }

                        Method (RE1B, 1, NotSerialized)
                        {
                            If (_OSI ("Darwin"))
                            {
                                OperationRegion (ERAM, EmbeddedControl, Arg0, One)
                                Field (ERAM, ByteAcc, NoLock, Preserve)
                                {
                                    BYTE,   8
                                }

                                Return (BYTE) /* \_SB_.PCI0.LPCB.EC__.RE1B.BYTE */
                            }

                            Return (Zero)
                        }

                        Method (RECB, 2, Serialized)
                        {
                            If (_OSI ("Darwin"))
                            {
                                Arg1 = ((Arg1 + 0x07) >> 0x03)
                                Name (TEMP, Buffer (Arg1){})
                                Arg1 += Arg0
                                Local0 = Zero
                                While ((Arg0 < Arg1))
                                {
                                    TEMP [Local0] = RE1B (Arg0)
                                    Arg0++
                                    Local0++
                                }

                                Return (TEMP) /* \_SB_.PCI0.LPCB.EC__.RECB.TEMP */
                            }

                            Return (Zero)
                        }

                        Method (WE1B, 2, NotSerialized)
                        {
                            If (_OSI ("Darwin"))
                            {
                                OperationRegion (ERAM, EmbeddedControl, Arg0, One)
                                Field (ERAM, ByteAcc, NoLock, Preserve)
                                {
                                    BYTE,   8
                                }

                                BYTE = Arg1
                            }
                        }

                        Method (WECB, 3, Serialized)
                        {
                            If (_OSI ("Darwin"))
                            {
                                Arg1 = ((Arg1 + 0x07) >> 0x03)
                                Name (TEMP, Buffer (Arg1){})
                                TEMP = Arg2
                                Arg1 += Arg0
                                Local0 = Zero
                                While ((Arg0 < Arg1))
                                {
                                    WE1B (Arg0, DerefOf (TEMP [Local0]))
                                    Arg0++
                                    Local0++
                                }
                            }
                        }

                        Scope (AC)
                        {
                            If (_OSI ("Darwin"))
                            {
                                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                                {
                                    0x17, 
                                    0x03
                                })
                            }
                        }

                        Scope (HKEY)
                        {
                            Method (CSSI, 1, NotSerialized)
                            {
                                If (_OSI ("Darwin"))
                                {
                                    \_SI._SST (Arg0)
                                }
                            }
                        }
                    }
                }

                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                If (_OSI ("Darwin"))
                {
                    Scope (RP09)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPSB)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                            Field (A1E0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   32, 
                                BMIE,   3, 
                                Offset (0x18), 
                                PRIB,   8, 
                                SECB,   8, 
                                SUBB,   8, 
                                Offset (0x1E), 
                                    ,   13, 
                                MABT,   1
                            }

                            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                            {
                                Return (SECB) /* \_SB_.PCI0.RP09.UPSB.SECB */
                            }

                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
                                {
                                    Local0 = Package (0x0A)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "built-in", 
                                            Buffer (One)
                                            {
                                                 0x00                                             // .
                                            }, 

                                            "model", 
                                            Buffer (0x41)
                                            {
                                                "Intel JHL6540 Alpine Ridge Thunderbolt 3 UPSB Bridge (Low Power)"
                                            }, 

                                            "device_type", 
                                            Buffer (0x0B)
                                            {
                                                "PCI Bridge"
                                            }, 

                                            "PCI-Thunderbolt", 
                                            One
                                        }
                                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                    Return (Local0)
                                }

                                Return (Zero)
                            }

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB0.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
                                    {
                                        Local0 = Package (0x0A)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "built-in", 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }, 

                                                "model", 
                                                Buffer (0x41)
                                                {
                                                    "Intel JHL6540 Alpine Ridge Thunderbolt 3 DSB0 Bridge (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x0B)
                                                {
                                                    "PCI Bridge"
                                                }, 

                                                "PCIHotplugCapable", 
                                                Zero
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Return (Zero)
                                }

                                Device (NHI0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        Local0 = Package (0x1B)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "name", 
                                                Buffer (0x24)
                                                {
                                                    "Alpine Ridge Thunderbolt Controller"
                                                }, 

                                                "model", 
                                                Buffer (0x3A)
                                                {
                                                    "Intel JHL6540 Alpine Ridge Thunderbolt 3 NHI0 (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x12)
                                                {
                                                    "System Peripheral"
                                                }, 

                                                "ThunderboltDROM", 
                                                Buffer (0x75)
                                                {
                                                    /* 0000 */  0x13, 0x00, 0xDD, 0x10, 0x88, 0xF1, 0xBC, 0x2A,  // .......*
                                                    /* 0008 */  0x8C, 0x96, 0x65, 0x21, 0x48, 0x01, 0x68, 0x00,  // ..e!H.h.
                                                    /* 0010 */  0x31, 0x00, 0x42, 0x60, 0x01, 0x28, 0x08, 0x81,  // 1.B`.(..
                                                    /* 0018 */  0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82,  // ........
                                                    /* 0020 */  0x90, 0x01, 0x80, 0x00, 0x00, 0x00, 0x08, 0x83,  // ........
                                                    /* 0028 */  0x80, 0x04, 0x80, 0x01, 0x00, 0x00, 0x08, 0x84,  // ........
                                                    /* 0030 */  0x90, 0x03, 0x80, 0x01, 0x00, 0x00, 0x02, 0x85,  // ........
                                                    /* 0038 */  0x0B, 0x86, 0x20, 0x01, 0x00, 0x64, 0x00, 0x00,  // .. ..d..
                                                    /* 0040 */  0x00, 0x00, 0x00, 0x03, 0x87, 0x80, 0x05, 0x88,  // ........
                                                    /* 0048 */  0x50, 0x00, 0x00, 0x05, 0x89, 0x50, 0x00, 0x00,  // P....P..
                                                    /* 0050 */  0x05, 0x8A, 0x50, 0x00, 0x00, 0x05, 0x8B, 0x50,  // ..P....P
                                                    /* 0058 */  0x00, 0x00, 0x0D, 0x01, 0x41, 0x70, 0x70, 0x6C,  // ....Appl
                                                    /* 0060 */  0x65, 0x20, 0x49, 0x6E, 0x63, 0x2E, 0x00, 0x0E,  // e Inc...
                                                    /* 0068 */  0x02, 0x4D, 0x61, 0x63, 0x42, 0x6F, 0x6F, 0x6B,  // .MacBook
                                                    /* 0070 */  0x20, 0x50, 0x72, 0x6F, 0x00                     //  Pro.
                                                }, 

                                                "ThunderboltConfig", 
                                                Buffer (0x20)
                                                {
                                                    /* 0000 */  0x00, 0x02, 0x1C, 0x00, 0x02, 0x00, 0x05, 0x03,  // ........
                                                    /* 0008 */  0x01, 0x00, 0x04, 0x00, 0x05, 0x03, 0x02, 0x00,  // ........
                                                    /* 0010 */  0x03, 0x00, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00,  // ........
                                                    /* 0018 */  0x03, 0x03, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00   // ........
                                                }, 

                                                "pathcr", 
                                                Buffer (0x50)
                                                {
                                                    /* 0000 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                                    /* 0008 */  0x00, 0x00, 0x07, 0x00, 0x10, 0x00, 0x10, 0x00,  // ........
                                                    /* 0010 */  0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                                    /* 0018 */  0x00, 0x00, 0x07, 0x00, 0x10, 0x00, 0x10, 0x00,  // ........
                                                    /* 0020 */  0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0E, 0x00,  // ........
                                                    /* 0028 */  0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                                    /* 0030 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                                    /* 0038 */  0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00,  // ........
                                                    /* 0040 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                                    /* 0048 */  0x00, 0x00, 0x07, 0x00, 0x02, 0x00, 0x01, 0x00   // ........
                                                }, 

                                                "linkDetails", 
                                                Buffer (0x08)
                                                {
                                                     0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
                                                }, 

                                                "TBTFlags", 
                                                Buffer (0x04)
                                                {
                                                     0x03, 0x00, 0x00, 0x00                           // ....
                                                }, 

                                                "sscOffset", 
                                                Buffer (0x02)
                                                {
                                                     0x00, 0x07                                       // ..
                                                }, 

                                                "TBTDPLowToHigh", 
                                                Buffer (0x04)
                                                {
                                                     0x01, 0x00, 0x00, 0x00                           // ....
                                                }, 

                                                "ThunderboltUUID", 
                                                ToUUID ("95e6bcfa-5a4a-5f81-b3d2-f0e4bd35cf1e") /* Unknown UUID */, 
                                                "power-save", 
                                                One, 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }
                                }
                            }

                            Device (DSB1)
                            {
                                Name (_ADR, 0x00010000)  // _ADR: Address
                                Name (_SUN, One)  // _SUN: Slot User Number
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                OperationRegion (A1E1, PCI_Config, 0xC0, 0x40)
                                Field (A1E1, ByteAcc, NoLock, Preserve)
                                {
                                    Offset (0x01), 
                                    Offset (0x02), 
                                    Offset (0x04), 
                                    Offset (0x08), 
                                    Offset (0x0A), 
                                        ,   5, 
                                    TPEN,   1, 
                                    Offset (0x0C), 
                                    SSPD,   4, 
                                        ,   16, 
                                    LACR,   1, 
                                    Offset (0x10), 
                                        ,   4, 
                                    LDIS,   1, 
                                    LRTN,   1, 
                                    Offset (0x12), 
                                    CSPD,   4, 
                                    CWDT,   6, 
                                        ,   1, 
                                    LTRN,   1, 
                                        ,   1, 
                                    LACT,   1, 
                                    Offset (0x14), 
                                    Offset (0x30), 
                                    TSPD,   4
                                }

                                OperationRegion (A1E2, PCI_Config, 0x80, 0x08)
                                Field (A1E2, ByteAcc, NoLock, Preserve)
                                {
                                    Offset (0x01), 
                                    Offset (0x02), 
                                    Offset (0x04), 
                                    PSTA,   2
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    Local0 = Package (0x08)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "model", 
                                            Buffer (0x41)
                                            {
                                                "Intel JHL6540 Alpine Ridge Thunderbolt 3 DSB1 Bridge (Low Power)"
                                            }, 

                                            "device_type", 
                                            Buffer (0x0B)
                                            {
                                                "PCI Bridge"
                                            }, 

                                            "Thunderbolt Entry ID", 
                                            0x0490
                                        }
                                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                    Return (Local0)
                                }

                                Device (UPS0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                    Field (ARE0, ByteAcc, NoLock, Preserve)
                                    {
                                        AVND,   16
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
                                    }

                                    Device (DSB0)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1, 
                                            Offset (0x3E), 
                                                ,   6, 
                                            SBRS,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB0.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }

                                        Device (DEV0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            Method (_STA, 0, NotSerialized)  // _STA: Status
                                            {
                                                Return (0x0F)
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (One)
                                            }
                                        }
                                    }

                                    Device (DSB3)
                                    {
                                        Name (_ADR, 0x00030000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB3.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }

                                        Device (UPS0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                            Field (ARE0, ByteAcc, NoLock, Preserve)
                                            {
                                                AVND,   16
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (One)
                                            }

                                            Device (DSB0)
                                            {
                                                Name (_ADR, Zero)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1, 
                                                    Offset (0x3E), 
                                                        ,   6, 
                                                    SBRS,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB3.UPS0.DSB0.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }
                                                }
                                            }

                                            Device (DSB3)
                                            {
                                                Name (_ADR, 0x00030000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB3.UPS0.DSB3.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB4)
                                            {
                                                Name (_ADR, 0x00040000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB3.UPS0.DSB4.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB5)
                                            {
                                                Name (_ADR, 0x00050000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB3.UPS0.DSB5.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }

                                            Device (DSB6)
                                            {
                                                Name (_ADR, 0x00060000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB3.UPS0.DSB6.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }
                                        }
                                    }

                                    Device (DSB4)
                                    {
                                        Name (_ADR, 0x00040000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB4.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }

                                        Device (UPS0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                            Field (ARE0, ByteAcc, NoLock, Preserve)
                                            {
                                                AVND,   16
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (One)
                                            }

                                            Device (DSB0)
                                            {
                                                Name (_ADR, Zero)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1, 
                                                    Offset (0x3E), 
                                                        ,   6, 
                                                    SBRS,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB4.UPS0.DSB0.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB3)
                                            {
                                                Name (_ADR, 0x00030000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB4.UPS0.DSB3.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB4)
                                            {
                                                Name (_ADR, 0x00040000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB4.UPS0.DSB4.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB5)
                                            {
                                                Name (_ADR, 0x00050000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB4.UPS0.DSB5.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }

                                            Device (DSB6)
                                            {
                                                Name (_ADR, 0x00060000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB4.UPS0.DSB6.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }
                                        }
                                    }

                                    Device (DSB5)
                                    {
                                        Name (_ADR, 0x00050000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB5.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }
                                    }

                                    Device (DSB6)
                                    {
                                        Name (_ADR, 0x00060000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB1.UPS0.DSB6.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }
                                    }
                                }
                            }

                            Device (DSB2)
                            {
                                Name (_ADR, 0x00020000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB2.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
                                    {
                                        Local0 = Package (0x08)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "model", 
                                                Buffer (0x41)
                                                {
                                                    "Intel JHL6540 Alpine Ridge Thunderbolt 3 DSB2 Bridge (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x0B)
                                                {
                                                    "PCI Bridge"
                                                }, 

                                                "PCIHotplugCapable", 
                                                Zero
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Return (Zero)
                                }

                                Device (XHC2)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (Package (0x02)
                                        {
                                            0x69, 
                                            0x03
                                        })
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        Local0 = Package (0x10)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "built-in", 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }, 

                                                "name", 
                                                Buffer (0x20)
                                                {
                                                    "Alpine Ridge USB 3.1 Controller"
                                                }, 

                                                "model", 
                                                Buffer (0x47)
                                                {
                                                    "Intel JHL6540 Alpine Ridge Thunderbolt 3 Type C Controller (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x0F)
                                                {
                                                    "USB controller"
                                                }, 

                                                "USBBusNumber", 
                                                Zero, 
                                                "UsbCompanionControllerPresent", 
                                                One, 
                                                "AAPL,XHC-clock-id", 
                                                One
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Device (RHUB)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        Device (SSP1)
                                        {
                                            Name (_ADR, 0x03)  // _ADR: Address
                                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                            {
                                                0xFF, 
                                                0x0A, 
                                                Zero, 
                                                Zero
                                            })
                                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                            {
                                                ToPLD (
                                                    PLD_Revision           = 0x1,
                                                    PLD_IgnoreColor        = 0x1,
                                                    PLD_Red                = 0x0,
                                                    PLD_Green              = 0x0,
                                                    PLD_Blue               = 0x0,
                                                    PLD_Width              = 0x0,
                                                    PLD_Height             = 0x0,
                                                    PLD_UserVisible        = 0x1,
                                                    PLD_Dock               = 0x0,
                                                    PLD_Lid                = 0x0,
                                                    PLD_Panel              = "UNKNOWN",
                                                    PLD_VerticalPosition   = "UPPER",
                                                    PLD_HorizontalPosition = "LEFT",
                                                    PLD_Shape              = "UNKNOWN",
                                                    PLD_GroupOrientation   = 0x0,
                                                    PLD_GroupToken         = 0x0,
                                                    PLD_GroupPosition      = 0x0,
                                                    PLD_Bay                = 0x0,
                                                    PLD_Ejectable          = 0x0,
                                                    PLD_EjectRequired      = 0x0,
                                                    PLD_CabinetNumber      = 0x0,
                                                    PLD_CardCageNumber     = 0x0,
                                                    PLD_Reference          = 0x0,
                                                    PLD_Rotation           = 0x0,
                                                    PLD_Order              = 0x0,
                                                    PLD_VerticalOffset     = 0x0,
                                                    PLD_HorizontalOffset   = 0x0)

                                            })
                                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                            {
                                                Local0 = Package (0x04)
                                                    {
                                                        "UsbCPortNumber", 
                                                        One, 
                                                        "UsbCompanionPortPresent", 
                                                        One
                                                    }
                                                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                                Return (Local0)
                                            }
                                        }

                                        Device (SSP2)
                                        {
                                            Name (_ADR, 0x04)  // _ADR: Address
                                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                            {
                                                0xFF, 
                                                0x0A, 
                                                Zero, 
                                                Zero
                                            })
                                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                            {
                                                ToPLD (
                                                    PLD_Revision           = 0x1,
                                                    PLD_IgnoreColor        = 0x1,
                                                    PLD_Red                = 0x0,
                                                    PLD_Green              = 0x0,
                                                    PLD_Blue               = 0x0,
                                                    PLD_Width              = 0x0,
                                                    PLD_Height             = 0x0,
                                                    PLD_UserVisible        = 0x1,
                                                    PLD_Dock               = 0x0,
                                                    PLD_Lid                = 0x0,
                                                    PLD_Panel              = "UNKNOWN",
                                                    PLD_VerticalPosition   = "UPPER",
                                                    PLD_HorizontalPosition = "LEFT",
                                                    PLD_Shape              = "UNKNOWN",
                                                    PLD_GroupOrientation   = 0x0,
                                                    PLD_GroupToken         = 0x0,
                                                    PLD_GroupPosition      = 0x0,
                                                    PLD_Bay                = 0x0,
                                                    PLD_Ejectable          = 0x0,
                                                    PLD_EjectRequired      = 0x0,
                                                    PLD_CabinetNumber      = 0x0,
                                                    PLD_CardCageNumber     = 0x0,
                                                    PLD_Reference          = 0x0,
                                                    PLD_Rotation           = 0x0,
                                                    PLD_Order              = 0x0,
                                                    PLD_VerticalOffset     = 0x0,
                                                    PLD_HorizontalOffset   = 0x0)

                                            })
                                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                            {
                                                Local0 = Package (0x04)
                                                    {
                                                        "UsbCPortNumber", 
                                                        0x02, 
                                                        "UsbCompanionPortPresent", 
                                                        One
                                                    }
                                                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                                Return (Local0)
                                            }
                                        }
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)  // _ADR: Address
                                Name (_SUN, 0x02)  // _SUN: Slot User Number
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                OperationRegion (A1E1, PCI_Config, 0xC0, 0x40)
                                Field (A1E1, ByteAcc, NoLock, Preserve)
                                {
                                    Offset (0x01), 
                                    Offset (0x02), 
                                    Offset (0x04), 
                                    Offset (0x08), 
                                    Offset (0x0A), 
                                        ,   5, 
                                    TPEN,   1, 
                                    Offset (0x0C), 
                                    SSPD,   4, 
                                        ,   16, 
                                    LACR,   1, 
                                    Offset (0x10), 
                                        ,   4, 
                                    LDIS,   1, 
                                    LRTN,   1, 
                                    Offset (0x12), 
                                    CSPD,   4, 
                                    CWDT,   6, 
                                        ,   1, 
                                    LTRN,   1, 
                                        ,   1, 
                                    LACT,   1, 
                                    Offset (0x14), 
                                    Offset (0x30), 
                                    TSPD,   4
                                }

                                OperationRegion (A1E2, PCI_Config, 0x80, 0x08)
                                Field (A1E2, ByteAcc, NoLock, Preserve)
                                {
                                    Offset (0x01), 
                                    Offset (0x02), 
                                    Offset (0x04), 
                                    PSTA,   2
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    Local0 = Package (0x08)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "model", 
                                            Buffer (0x41)
                                            {
                                                "Intel JHL6540 Alpine Ridge Thunderbolt 3 DSB4 Bridge (Low Power)"
                                            }, 

                                            "device_type", 
                                            Buffer (0x0B)
                                            {
                                                "PCI Bridge"
                                            }, 

                                            "Thunderbolt Entry ID", 
                                            0x0491
                                        }
                                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                    Return (Local0)
                                }

                                Device (UPS0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                    Field (ARE0, ByteAcc, NoLock, Preserve)
                                    {
                                        AVND,   16
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
                                    }

                                    Device (DSB0)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1, 
                                            Offset (0x3E), 
                                                ,   6, 
                                            SBRS,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB0.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }

                                        Device (DEV0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            Method (_STA, 0, NotSerialized)  // _STA: Status
                                            {
                                                Return (0x0F)
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (One)
                                            }
                                        }
                                    }

                                    Device (DSB3)
                                    {
                                        Name (_ADR, 0x00030000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB3.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }

                                        Device (UPS0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                            Field (ARE0, ByteAcc, NoLock, Preserve)
                                            {
                                                AVND,   16
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (One)
                                            }

                                            Device (DSB0)
                                            {
                                                Name (_ADR, Zero)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1, 
                                                    Offset (0x3E), 
                                                        ,   6, 
                                                    SBRS,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB3.UPS0.DSB0.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }
                                                }
                                            }

                                            Device (DSB3)
                                            {
                                                Name (_ADR, 0x00030000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB3.UPS0.DSB3.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB4)
                                            {
                                                Name (_ADR, 0x00040000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB3.UPS0.DSB4.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB5)
                                            {
                                                Name (_ADR, 0x00050000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB3.UPS0.DSB5.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }

                                            Device (DSB6)
                                            {
                                                Name (_ADR, 0x00060000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB3.UPS0.DSB6.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }
                                        }
                                    }

                                    Device (DSB4)
                                    {
                                        Name (_ADR, 0x00040000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB4.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }

                                        Device (UPS0)
                                        {
                                            Name (_ADR, Zero)  // _ADR: Address
                                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                                            Field (ARE0, ByteAcc, NoLock, Preserve)
                                            {
                                                AVND,   16
                                            }

                                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                            {
                                                Return (One)
                                            }

                                            Device (DSB0)
                                            {
                                                Name (_ADR, Zero)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1, 
                                                    Offset (0x3E), 
                                                        ,   6, 
                                                    SBRS,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB4.UPS0.DSB0.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB3)
                                            {
                                                Name (_ADR, 0x00030000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB4.UPS0.DSB3.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB4)
                                            {
                                                Name (_ADR, 0x00040000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB4.UPS0.DSB4.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }

                                                Device (DEV0)
                                                {
                                                    Name (_ADR, Zero)  // _ADR: Address
                                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                                    {
                                                        Return (0x0F)
                                                    }

                                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                    {
                                                        Return (One)
                                                    }
                                                }
                                            }

                                            Device (DSB5)
                                            {
                                                Name (_ADR, 0x00050000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB4.UPS0.DSB5.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }

                                            Device (DSB6)
                                            {
                                                Name (_ADR, 0x00060000)  // _ADR: Address
                                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                                {
                                                    AVND,   32, 
                                                    BMIE,   3, 
                                                    Offset (0x18), 
                                                    PRIB,   8, 
                                                    SECB,   8, 
                                                    SUBB,   8, 
                                                    Offset (0x1E), 
                                                        ,   13, 
                                                    MABT,   1
                                                }

                                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                                {
                                                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB4.UPS0.DSB6.SECB */
                                                }

                                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                                {
                                                    Return (0x0F)
                                                }

                                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                                {
                                                    Return (One)
                                                }
                                            }
                                        }
                                    }

                                    Device (DSB5)
                                    {
                                        Name (_ADR, 0x00050000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB5.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }
                                    }

                                    Device (DSB6)
                                    {
                                        Name (_ADR, 0x00060000)  // _ADR: Address
                                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                        Field (A1E0, ByteAcc, NoLock, Preserve)
                                        {
                                            AVND,   32, 
                                            BMIE,   3, 
                                            Offset (0x18), 
                                            PRIB,   8, 
                                            SECB,   8, 
                                            SUBB,   8, 
                                            Offset (0x1E), 
                                                ,   13, 
                                            MABT,   1
                                        }

                                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                        {
                                            Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB4.UPS0.DSB6.SECB */
                                        }

                                        Method (_STA, 0, NotSerialized)  // _STA: Status
                                        {
                                            Return (0x0F)
                                        }

                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (One)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Device (SRAM)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (XHC)
                {
                    If (_OSI ("Darwin"))
                    {
                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            Return (GPRW (0x6D, Zero))
                        }
                    }
                }
            }

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }

        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                            {
                                 0x03                                             // .
                            }
                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
                {
                     0x00                                             // .
                }
            Return (Zero)
        }

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        Zero
                    })
                }
            }

            Return (XPRW (Arg0, Arg1))
        }

        If (_OSI ("Darwin"))
        {
            Name (XLTP, Zero)
            Method (_TTS, 1, NotSerialized)  // _TTS: Transition To State
            {
                Debug = "Method \\__TTS Called"
                XLTP = Arg0
            }
        }
    }
}

