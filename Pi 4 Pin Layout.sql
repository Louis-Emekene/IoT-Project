/*

+-----+-----+---------+------+---+---Pi 4---+---+------+---------+-----+-----+
| BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
+-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
|     |     |   3.3v  |      |   |  1 | 2  |   |      | 5v      |     |     |
|  2  |  8  |   SDA1  | ALT0 | 1 |  3 | 4  |   |      | 5v      |     |     |
|  3  |  9  |   SCL1  | ALT0 | 1 |  5 | 6  |   |      | 0v      |     |     |
|  4  |  7  |  GPIO 7 | OUT  | 1 |  7 | 8  | 0 | ALT0 | TXD0    | 15  | 14  |
|     |     |      0v |      |   |  9 | 10 | 0 | ALT0 | RXD0    | 16  | 15  |
| 17  |  0  |  GPIO 0 | OUT  | 0 | 11 | 12 | 0 | OUT  | GPIO 1  | 1   | 18  |
| 27  |  2  |  GPIO 2 | OUT  | 0 | 13 | 14 |   |      | 0v      |     |     |
| 22  |  3  |  GPIO 3 | OUT  | 0 | 15 | 16 | 0 | OUT  | GPIO 4  | 4   | 23  |
|     |     |   3.3v  |      |   | 17 | 18 | 0 | OUT  | GPIO 5  | 5   | 24  |
| 10  | 12  |    MOSI | ALT0 | 1 | 19 | 20 |   |      | 0v      |     |     |
|  9  | 13  |    MISO | ALT0 | 1 | 21 | 22 | 0 | OUT  | GPIO 6  | 6   | 25  |
| 11  | 14  |    SCLK | ALT0 | 1 | 23 | 24 | 1 | ALT0 | CE0     | 10  | 8   |
|     |     |      0v |      |   | 25 | 26 | 1 | ALT0 | CE1     | 11  | 7   |
|  0  | 30  |    SDA0 | IN   | 1 | 27 | 28 | 1 | IN   | SCL0    | 31  | 1   |
|  5  | 21  |  GPIO21 | IN   | 1 | 29 | 30 |   |      | 0v      |     |     |
|  6  | 22  |  GPIO22 | IN   | 1 | 31 | 32 | 0 | OUT  | GPIO26  | 26  | 12  |
| 13  | 23  |  GPIO23 | OUT  | 0 | 33 | 34 |   |      | 0v      |     |     |
| 19  | 24  |  GPIO24 | OUT  | 0 | 35 | 36 | 0 | OUT  | GPIO27  | 27  | 16  |
| 26  | 25  |  GPIO25 | OUT  | 0 | 37 | 38 | 0 | OUT  | GPIO28  | 28  | 20  |
|     |     |      0v |      |   | 39 | 40 | 0 | OUT  | GPIO29  | 29  | 21  |
+-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+


| Pin | Name  | Function                  | Comment                                              |
|-----|-------|---------------------------|------------------------------------------------------|
| 1   | 3.3V  | 3.3V Power                | Provides 3.3V power supply                           |
| 2   | 5V    | 5V Power                  | Provides 5V power supply                             |
| 3   | GPIO 2| SDA1 (I2C)                | I2C Data Line (SDA) for communication                |
| 4   | 5V    | 5V Power                  | Provides 5V power supply                             |
| 5   | GPIO 3| SCL1 (I2C)                | I2C Clock Line (SCL) for communication               |
| 6   | GND   | Ground                    | Ground                                               |
| 7   | GPIO 4| GPIO General Purpose      | General purpose I/O                                  |
| 8   | GPIO 14| TXD0 (UART)              | UART Transmit (TX) for serial communication          |
| 9   | GND   | Ground                    | Ground                                               |
| 10  | GPIO 15| RXD0 (UART)              | UART Receive (RX) for serial communication           |
| 11  | GPIO 17| GPIO General Purpose     | General purpose I/O                                  |
| 12  | GPIO 18| GPIO General Purpose     | General purpose I/O                                  |
| 13  | GPIO 27| GPIO General Purpose     | General purpose I/O                                  |
| 14  | GND   | Ground                    | Ground                                               |
| 15  | GPIO 22| GPIO General Purpose     | General purpose I/O                                  |
| 16  | GPIO 23| GPIO General Purpose     | General purpose I/O                                  |
| 17  | 3.3V  | 3.3V Power                | Provides 3.3V power supply                           |
| 18  | GPIO 24| GPIO General Purpose     | General purpose I/O                                  |
| 19  | GPIO 10| MOSI (SPI)               | SPI MOSI (Master Out Slave In) for SPI communication |
| 20  | GND   | Ground                    | Ground                                               |
| 21  | GPIO 9 | MISO (SPI)               | SPI MISO (Master In Slave Out) for SPI communication |
| 22  | GPIO 25| GPIO General Purpose     | General purpose I/O                                  |
| 23  | GPIO 11| SCLK (SPI)               | SPI Clock (SCLK) for SPI communication               |
| 24  | GPIO 8 | CE0 (SPI)                | SPI Chip Enable 0                                    |
| 25  | GND   | Ground                    | Ground                                               |
| 26  | GPIO 7 | CE1 (SPI)                | SPI Chip Enable 1                                    |
| 27  | GPIO 0 | SDA0 (I2C)               | I2C Data Line for I2C communication (ID EEPROM)      |   DO NOT USE
| 28  | GPIO 1 | SCL0 (I2C)               | I2C Clock Line for I2C communication (ID EEPROM)     |   DO NOT USE
| 29  | GPIO 5 | GPIO General Purpose     | General purpose I/O                                  |
| 30  | GND   | Ground                    | Ground                                               |
| 31  | GPIO 6 | GPIO General Purpose     | General purpose I/O                                  |
| 32  | GPIO 12| GPIO General Purpose     | General purpose I/O                                  |
| 33  | GPIO 13| GPIO General Purpose     | General purpose I/O                                  |
| 34  | GND   | Ground                    | Ground                                               |
| 35  | GPIO 19| GPIO General Purpose     | General purpose I/O                                  |
| 36  | GPIO 16| GPIO General Purpose     | General purpose I/O                                  |
| 37  | GPIO 26| GPIO General Purpose     | General purpose I/O                                  |
| 38  | GPIO 20| GPIO General Purpose     | General purpose I/O                                  |
| 39  | GND   | Ground                    | Ground                                               |
| 40  | GPIO 21| GPIO General Purpose     | General purpose I/O                                  |

Power Pins (3.3V and 5V): These pins provide power to external devices and circuits.

Ground (GND): Common ground pins to complete the circuit.

I2C Pins (SDA, SCL): Used for I2C communication, a protocol that allows multiple devices to communicate with the Raspberry Pi.

UART Pins (TXD, RXD): Used for serial communication.

SPI Pins (MOSI, MISO, SCLK, CE0, CE1): Used for SPI communication, a protocol for high-speed data exchange between microcontrollers and small peripherals.

GPIO Pins: General-purpose input/output pins that can be programmed to interact with various sensors, LEDs, and other electronic components.
*/