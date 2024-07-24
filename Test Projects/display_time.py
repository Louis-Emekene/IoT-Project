import smbus2
import time
from RPLCD.i2c import CharLCD
from datetime import datetime

# Define LCD parameters
lcd = CharLCD('PCF8574', 0x27)  # Replace 0x27 with your I2C address if different

# Function to display the time
def display_time():
    while True:
        # Get the current time
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")

        # Clear the LCD and write the current time
        lcd.clear()
        lcd.write_string("Time: " + current_time)

        # Wait for 1 second before updating
        time.sleep(1)

# Main program loop
try:
    display_time()
except KeyboardInterrupt:
    # Clear the display on exit
    lcd.clear()
