#!/bin/bash

# Welcome message
echo "${bold}Welcome to Bash Scripting 401!${normal}"
echo "This level covers expert topics like networking, debugging, and parallel processing."
echo "You're about to become a Bash scripting pro!"

pause() {
  read -p "Press [Enter] to continue..."
}

# Lesson 1: Debugging
echo
echo "${bold}Lesson 1: Debugging${normal}"
echo "You can debug scripts with 'set -x' or 'bash -x'. For example:"
echo "${yellow}set -x; echo 'Debugging'; set +x${reset} enables debugging temporarily."
pause

while true; do
  echo "Your turn! Enable debugging for a script that calculates the sum of two numbers."
  read -e -p "Enter your script: " user_input_debug

  eval "set -x; $user_input_debug; set +x" 2>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} Debugging enabled."
    break
  else
    echo "${red}Not quite.${reset} Remember to use 'set -x' for debugging."
  fi
done
pause

# Lesson 2: Networking
echo
echo "${bold}Lesson 2: Networking${normal}"
echo "Use tools like 'curl' or 'wget' in Bash scripts for networking."
echo "Example: ${yellow}curl -I https://example.com${reset} gets the HTTP headers."
pause

while true; do
  echo "Your turn! Use 'curl' to fetch the HTTP headers for 'https://example.com'."
  read -e -p "Enter your command: " user_input_curl

  result=$(eval "$user_input_curl" 2>/dev/null)
  if [[ "$result" == *"200 OK"* ]]; then
    echo "${green}Great job!${reset} You fetched the headers."
    break
  else
    echo "${red}Not quite.${reset} Use 'curl -I' to fetch HTTP headers."
  fi
done
pause

# Lesson 3: Parallel Processing
echo
echo "${bold}Lesson 3: Parallel Processing${normal}"
echo "You can run commands in parallel with '&' or 'xargs'. For example:"
echo "${yellow}echo -e 'task1\ntask2' | xargs -n 1 -P 2 echo${reset} runs tasks in parallel."
pause

while true; do
  echo "Your turn! Run two commands in parallel: 'sleep 2' and 'echo Done'."
  read -e -p "Enter your commands: " user_input_parallel

  eval "$user_input_parallel" &> /dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} You used parallel processing."
    break
  else
    echo "${red}Not quite.${reset} Use '&' or 'xargs' for parallel execution."
  fi
done
pause

# Lesson 4: Signal Trapping
echo
echo "${bold}Lesson 4: Signal Trapping${normal}"
echo "You can trap signals to clean up resources. Example:"
echo "${yellow}trap 'rm temp.txt; exit' SIGINT${reset} cleans up on Ctrl+C."
pause

while true; do
  echo "Your turn! Write a script that creates a temp file and deletes it on SIGINT."
  echo "Hint: Use 'trap' and 'rm'."
  read -e -p "Enter your script: " user_input_trap

  eval "$user_input_trap" &> /dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} You trapped the signal successfully."
    break
  else
    echo "${red}Not quite.${reset} Remember to use 'trap' with a cleanup command."
  fi
done
pause

# Conclusion
echo
echo "${green}Congratulations!${reset} You've completed Bash Scripting 401."
echo "You learned:"
echo "- Debugging scripts"
echo "- Networking with curl and wget"
echo "- Parallel processing"
echo "- Signal trapping for cleanup"
echo "You're now an advanced Bash script developer!"
