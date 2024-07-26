import time
import feedparser
from RPLCD.i2c import CharLCD

# Define LCD parameters
lcd = CharLCD('PCF8574', 0x27)  # Replace 0x27 with your I2C address if different

# Function to get news headlines
def get_news():
    url = 'https://news.google.com/rss'  # Replace with your preferred RSS feed URL
    feed = feedparser.parse(url)
    headlines = [entry.title for entry in feed.entries]
    return headlines

# Function to display headlines on LCD
def display_news():
    headlines = get_news()
    while True:
        for headline in headlines:
            lcd.clear()
            lcd.write_string(headline[:16])  # Display the first 16 characters
            time.sleep(2)  # Adjust delay as needed
            for i in range(16, len(headline)):
                lcd.write_string(headline[i])
                time.sleep(0.3)
                lcd.write_string('\b')  # Move cursor back to simulate scrolling

# Main program loop
try:
    display_news()
except KeyboardInterrupt:
    lcd.clear()
    print("\nProgram terminated")
