#!/bin/bash
#Author : ArifulAnik aka xettabyte
#This script is created with an aim to notify you about class via discord or telegram , I mean if you are silly like me it will definately help you out :|

# Integral part
#TELEGRAM_BOT_TOKEN=""
#TELEGRAM_CHAT_ID=""
#!/bin/bash

# set your Discord webhook URL


# Set the Discord webhook URL to send the notification message
WEBHOOK_URL=""

# Set the path to your weekly routine file
ROUTINE_FILE="/root/bashprac/notifier/weekly_routine.txt"

# Read the routine file and iterate over each line
while read LINE; do
  # Extract the class name, start time, and day of the week from the line
  CLASS_NAME=$(echo $LINE | awk '{print $1}')
  START_TIME=$(echo $LINE | awk '{print $2}')
  DAY_OF_WEEK=$(echo $LINE | awk '{print $3}')

  # Get the current day of the week and the current time in minutes since midnight
  CURRENT_DAY=$(date +%a)
  CURRENT_TIME=$(date +%H:%M)
  CURRENT_TIME_IN_MINUTES=$(date -d "${CURRENT_TIME}" +%s | awk '{print int($1/60)}')

  # Calculate the start time of the class in minutes since midnight
  CLASS_TIME_IN_MINUTES=$(date -d "${DAY_OF_WEEK} ${START_TIME}" +%s | awk '{print int($1/60)}')

  # Check if the class is about to start in 5 minutes
  if [ "$DAY_OF_WEEK" == "$CURRENT_DAY" ] && [ "$CLASS_TIME_IN_MINUTES" -eq "$(($CURRENT_TIME_IN_MINUTES + 5))" ]; then
    # Compose the notification message with the class name and start time
    MESSAGE="Reminder: The class '$CLASS_NAME' starts at $START_TIME."

    # Send the notification message to the Discord webhook
    curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$MESSAGE\"}" $WEBHOOK_URL
  fi
done < $ROUTINE_FILE


#send to telegram
#if [[ -n "$TELEGRAM_BOT_TOKEN" && -n "$TELEGRAM_CHAT_ID" && -n "$MESSAGE" ]]; then
# curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
# #    -d "chat_id=$TELEGRAM_CHAT_ID" \
#    -d "text=$MESSAGE"
#fi

#sent to discord

# if [[ -n "$DISCORD_WEBHOOK_URL" && -n "$MESSAGE" ]]; then
#   curl -s -H "Content-Type: application/json" -X POST -d "{\"content\":\"$MESSAGE\"}" \
#     "$DISCORD_WEBHOOK_URL"
# fi
