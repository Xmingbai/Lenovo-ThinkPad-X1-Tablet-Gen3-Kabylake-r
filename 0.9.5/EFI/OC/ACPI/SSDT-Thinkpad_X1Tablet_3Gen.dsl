DefinitionBlock ("", "SSDT", 2, "APPLE", "X1Tablet", 0x00000000)
{
    External (_SB_.MEM_._STA, UnknownObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.GLAN._STA, IntObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.TPL0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.ARTC, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
    External (_SB_.PCI0.LPCB.MATH._STA, UnknownObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.XDCI._STA, IntObj)
    External (_SB_.SLPB._STA, UnknownObj)
    External (_SB_.UBTC._STA, UnknownObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments
    External (HPTE, FieldUnitObj)
    External (LNUX, IntObj)
    External (SDS0, UnknownObj)
    External (USBH, UnknownObj)
    External (WNTF, IntObj)
    External (ZPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.SLPB._STA = 0x0B
            \_SB.PCI0.XDCI._STA = Zero
            \_SB.PCI0.LPCB.MATH._STA = 0x0F
            \LNUX = One
            \WNTF = One
            HPTE = Zero
            SDS0 = One
            USBH = One
            Name (\_S3, Package (0x04)  // _S3_: S3 System State
            {
                0x05, 
                0x05, 
                Zero, 
                Zero
            })
        }

        Scope (_SB)
        {
            Name (MEM._STA, Zero)  // _STA: Status
            Device (MEM2)
            {
                Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Name (CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x20000000,         // Address Base
                        0x00200000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x40000000,         // Address Base
                        0x00200000,         // Address Length
                        )
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (CRS) /* \_SB_.MEM2.CRS_ */
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

                Scope (GLAN)
                {
                    If (_OSI ("Darwin"))
                    {
                        Name (_STA, Zero)  // _STA: Status
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
                    Device (ARTC)
                    {
                        Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
                        Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
                        {
                            Return (0x05)
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
                        Scope (PXSX)
                        {
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If (_OSI ("Darwin"))
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x02)
                                    {
                                        "PCI-Thunderbolt", 
                                        One
                                    })
                                }

                                Return (Zero)
                            }

                            Device (DSB0)
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

                                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                {
                                    Return (GPRW (0x69, 0x04))
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If (_OSI ("Darwin"))
                                    {
                                        If ((Arg2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                        }

                                        Return (Package (0x02)
                                        {
                                            "PCIHotplugCapable", 
                                            Zero
                                        })
                                    }

                                    Return (Zero)
                                }

                                Device (NHI0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
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

                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (GPRW (0x69, 0x04))
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        If (_OSI ("Darwin"))
                                        {
                                            If ((Arg2 == Zero))
                                            {
                                                Return (Buffer (One)
                                                {
                                                     0x03                                             // .
                                                })
                                            }

                                            Return (Package (0x03)
                                            {
                                                "power-save", 
                                                One, 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }
                                            })
                                        }

                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB1)
                            {
                                Name (_ADR, 0x00010000)  // _ADR: Address
                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
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

                                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                {
                                    Return (GPRW (0x69, 0x04))
                                }

                                Device (DEV0)
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

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
                                    }

                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (GPRW (0x69, 0x04))
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)  // _ADR: Address
                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
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

                                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                {
                                    Return (GPRW (0x69, 0x04))
                                }

                                Device (DEV0)
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

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
                                    }

                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (GPRW (0x69, 0x04))
                                    }
                                }
                            }
                        }
                    }
                }

                Scope (SBUS)
                {
                    Device (BUS0)
                    {
                        Name (_CID, "smbus")  // _CID: Compatible ID
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (BLC0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_CID, "smbus-blc")  // _CID: Compatible ID
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x0E)
                                {
                                    "refnum", 
                                    Zero, 
                                    "address", 
                                    Zero, 
                                    "version", 
                                    0x02, 
                                    "fault-off", 
                                    0x03, 
                                    "fault-len", 
                                    0x04, 
                                    "type", 
                                    Zero, 
                                    "command", 
                                    Zero
                                })
                            }
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

                    Device (BUS1)
                    {
                        Name (_CID, "smbus")  // _CID: Compatible ID
                        Name (_ADR, One)  // _ADR: Address
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

            Return (ZPRW (Arg0, Arg1))
        }

        Method (XOSI, 1, NotSerialized)
        {
            Local0 = Package (0x01)
                {
                    "Windows 2015"
                }
            If (_OSI ("Darwin"))
            {
                Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
            }
            Else
            {
                Return (_OSI (Arg0))
            }
        }
    }
}

