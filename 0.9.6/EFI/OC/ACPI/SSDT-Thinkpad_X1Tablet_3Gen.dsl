DefinitionBlock ("", "SSDT", 2, "APPLE", "X1Tablet", 0x00000000)
{
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.MEM_._STA, UnknownObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.GLAN._STA, IntObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.TPL0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.RP09.TBDU, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XDCI._STA, IntObj)
    External (_SB_.SLPB._STA, UnknownObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments
    External (HPTE, FieldUnitObj)
    External (LNUX, IntObj)
    External (SDS0, UnknownObj)
    External (SSD1, IntObj)
    External (SSH1, IntObj)
    External (SSL1, IntObj)
    External (USBH, UnknownObj)
    External (WNTF, IntObj)
    External (ZPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.SLPB._STA = 0x0B
            \_SB.PCI0.XDCI._STA = Zero
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

        Scope (_PR)
        {
            Scope (PR00)
            {
                If (_OSI ("Darwin"))
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
                            "plugin-type", 
                            One
                        })
                    }
                }
            }
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

                Scope (GLAN)
                {
                    If (_OSI ("Darwin"))
                    {
                        Name (_STA, Zero)  // _STA: Status
                    }
                }

                Scope (I2C1)
                {
                    If (_OSI ("Darwin"))
                    {
                        Method (PKGX, 3, Serialized)
                        {
                            Name (PKG, Package (0x03)
                            {
                                Zero, 
                                Zero, 
                                Zero
                            })
                            PKG [Zero] = Arg0
                            PKG [One] = Arg1
                            PKG [0x02] = Arg2
                            Return (PKG) /* \_SB_.PCI0.I2C1.PKGX.PKG_ */
                        }
                    }

                    If (_OSI ("Darwin"))
                    {
                        Method (SSCN, 0, NotSerialized)
                        {
                            Return (PKGX (SSH1, SSL1, SSD1))
                        }
                    }

                    If (_OSI ("Darwin"))
                    {
                        Method (FMCN, 0, NotSerialized)
                        {
                            Name (PKG, Package (0x03)
                            {
                                0x0101, 
                                0x012C, 
                                0x62
                            })
                            Return (PKG) /* \_SB_.PCI0.I2C1.FMCN.PKG_ */
                        }
                    }

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

                Scope (RP09)
                {
                    If (_OSI ("Darwin"))
                    {
                        Scope (PXSX)
                        {
                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
                                    Return (0x0F)
                                }

                                Device (UPS0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
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
                                    Return (0x0F)
                                }

                                Device (UPS0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
                                    }
                                }
                            }
                        }
                    }
                }

                If (_OSI ("Darwin"))
                {
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
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

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
                        }

                        Device (BUS1)
                        {
                            Name (_CID, "smbus")  // _CID: Compatible ID
                            Name (_ADR, One)  // _ADR: Address
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
    }
}

