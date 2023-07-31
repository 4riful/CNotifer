# Class Notification Project


## Overview

This Bash script is designed to notify users about their class schedule via Discord. It reads a weekly routine file that contains class names, start times, and days of the week. The script then checks the current time and sends a notification if a class is about to start within the next 5 minutes. The notification message includes the class name and start time.

## Requirements

- Bash (Bourne Again SHell)
- `curl` command-line utility

## Setup

1. Set up a Discord webhook URL to receive the notification messages. Replace the `WEBHOOK_URL` variable in the script with your Discord webhook URL.

2. Create a weekly routine file (e.g., `weekly_routine.txt`) with the following format for each class:

## CLASS_NAME START_TIME DAY_OF_WEEK

Example:
```
DSA  09:00 Mon
C Programming 11:30 Wed
Linux Fundamental 14:00 Fri
```


## The `DAY_OF_WEEK` should be the abbreviated form of the day (e.g., Mon, Tue, Wed, etc.).


3. Make sure the script has execute permissions. If not, run the following command:

chmod +x script.sh


3. The script will check the current time against the class schedule and send a notification to Discord if a class is about to start within the next 5 minutes.

## Optional: Telegram Notification

This script also provides optional support for sending notifications to Telegram. To use Telegram instead of Discord, follow these steps:

1. Uncomment the relevant sections in the script related to Telegram.

2. Obtain a Telegram Bot Token and a Telegram Chat ID. You can create a Telegram bot and get the token by following the Telegram BotFather instructions.

3. Replace the `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID` variables with your Telegram Bot Token and Chat ID, respectively.

4. The script will now send notifications to your Telegram account.

## Important Note

For this script to work correctly, ensure that you have a working internet connection and the necessary permissions to execute the `curl` command to send notifications.

**Warning**: This script assumes that the routine file is well-formatted and contains valid class names, start times, and days of the week. Incorrect data in the routine file may lead to unexpected behavior or errors in the script.

## License

This project is licensed under the [MIT License](LICENSE).



