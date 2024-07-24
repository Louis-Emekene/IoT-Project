import smbus2
import time
from RPLCD.i2c import CharLCD

# Define LCD parameters
lcd = CharLCD('PCF8574', 0x27)  # Replace 0x27 with your I2C address if different

# Initialize the LCD
lcd.clear()
lcd.write_string('Hello, World!')

# Keep display on for 5 seconds
time.sleep(5)
lcd.clear()
