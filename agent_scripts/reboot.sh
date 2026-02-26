#!/bin/bash

echo -e "\e[38;5;82mThe system will now reboot! Press any key to cancel..."
sleep 1
echo "Rebooting in..."

# Set terminal to non-blocking mode for key detection
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  stty -echo -icanon time 0
fi

reboot_cancelled=0
for i in {5..1}
do
  echo "$i"
  
  # Check if a key was pressed
  if read -t 1 -n 1; then
    echo ""
    echo "Reboot cancelled."
    reboot_cancelled=1
    break
  fi
done

# Restore terminal settings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  stty echo icanon
fi

# Reboot if not cancelled
if [ $reboot_cancelled -eq 0 ]; then
  echo "Rebooting now!"
  sudo reboot
fi