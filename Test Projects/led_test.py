import RPi.GPIO as GPIO
import time

# Set up the GPIO mode
GPIO.setmode(GPIO.BCM)

# Set up the GPIO pin for the LED
LED_PIN = 18  # You can change this to the pin you are using
GPIO.setup(LED_PIN, GPIO.OUT)

try:
    while True:
        GPIO.output(LED_PIN, GPIO.HIGH)  # Turn on LED
        time.sleep(1)                    # Wait for 1 second
        GPIO.output(LED_PIN, GPIO.LOW)   # Turn off LED
        time.sleep(1)                    # Wait for 1 second

except KeyboardInterrupt:
    pass

finally:
    GPIO.cleanup()  # Clean up the GPIO pins on exit
