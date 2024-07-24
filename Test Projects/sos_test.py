import RPi.GPIO as GPIO
import time

# Set up the GPIO mode
GPIO.setmode(GPIO.BCM)

# Set up the GPIO pin for the LED
LED_PIN = 18  # You can change this to the pin you are using
GPIO.setup(LED_PIN, GPIO.OUT)

# Define the timing for the SOS signal
DOT_DURATION = 0.2   # Duration of a dot
DASH_DURATION = 0.6  # Duration of a dash
INTRA_CHAR_SPACE = 0.2  # Space between dots and dashes within a character
INTER_CHAR_SPACE = 0.6  # Space between characters (S and O)

def dot():
    GPIO.output(LED_PIN, GPIO.HIGH)
    time.sleep(DOT_DURATION)
    GPIO.output(LED_PIN, GPIO.LOW)
    time.sleep(INTRA_CHAR_SPACE)

def dash():
    GPIO.output(LED_PIN, GPIO.HIGH)
    time.sleep(DASH_DURATION)
    GPIO.output(LED_PIN, GPIO.LOW)
    time.sleep(INTRA_CHAR_SPACE)

def sos():
    # S: dot-dot-dot
    dot()
    dot()
    dot()
    time.sleep(INTER_CHAR_SPACE)
    # O: dash-dash-dash
    dash()
    dash()
    dash()
    time.sleep(INTER_CHAR_SPACE)
    # S: dot-dot-dot
    dot()
    dot()
    dot()
    time.sleep(1)  # Longer space after the full SOS signal

try:
    while True:
        sos()

except KeyboardInterrupt:
    pass

finally:
    GPIO.cleanup()  # Clean up the GPIO pins on exit
