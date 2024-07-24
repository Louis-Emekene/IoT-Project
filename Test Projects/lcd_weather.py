import smbus2
import time
import requests
from RPLCD.i2c import CharLCD
from datetime import datetime

# Define LCD parameters
lcd = CharLCD('PCF8574', 0x27)  # Replace 0x27 with your I2C address if different

# OpenWeatherMap API settings
API_KEY = '80f735f1bf095328386f0e46d9b44a55'  # Replace with your OpenWeatherMap API key
CITY = 'Warri'
COUNTRY = 'NG'

# Function to get weather data
def get_weather():
    url = f'http://api.openweathermap.org/data/2.5/weather?q={CITY},{COUNTRY}&appid={API_KEY}&units=metric'
    response = requests.get(url)
    data = response.json()
    return data

# Function to display the time, location, and weather info
def display_weather():
    while True:
        weather_data = get_weather()
        
        if weather_data['cod'] == 200:
            # Extract relevant data
            temp = weather_data['main']['temp']
            weather_desc = weather_data['weather'][0]['description']
            location = f"{weather_data['name']}, {weather_data['sys']['country']}"

            # Get the current time
            now = datetime.now()
            current_time = now.strftime("%H:%M:%S")

            # Clear the LCD and write the new data
            lcd.clear()
            lcd.write_string(f"{location}\n{temp}C {weather_desc}")
            time.sleep(5)

            # Display time
            lcd.clear()
            lcd.write_string(f"Time: {current_time}")
            time.sleep(1)
        else:
            lcd.clear()
            lcd.write_string("Error fetching data")
            time.sleep(5)

# Main program loop
try:
    display_weather()
except KeyboardInterrupt:
    # Clear the display on exit
    lcd.clear()
