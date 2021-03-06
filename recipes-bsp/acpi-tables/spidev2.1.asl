/*
 * This ASL can be used to declare a spidev device on SPI0 CS1
 */
DefinitionBlock ("", "SSDT", 5, "INTEL", "SPIDEV1", 1)
{
    External (_SB.PCI0.SPI2, DeviceObj)

    Scope (\_SB.PCI0.SPI2)
    {
        Device (TP1) {
            Name (_HID, "SPT0001")
            Name (_DDN, "SPI test device connected to CS1")
            Name (_CRS, ResourceTemplate () {
                SpiSerialBus (
                    1,                      // Chip select
                    PolarityLow,            // Chip select is active low
                    FourWireMode,           // Full duplex
                    8,                      // Bits per word is 8 (byte)
                    ControllerInitiated,    // Don't care
                    1000000,                // 10 MHz
                    ClockPolarityLow,       // SPI mode 0
                    ClockPhaseFirst,        // SPI mode 0
                    "\\_SB.PCI0.SPI2",      // SPI host controller
                    0                       // Must be 0
                )
            })
        }
    }
}
