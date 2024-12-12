#!/bin/bash

# Enable color output for better feedback
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

# Welcome message
echo "${bold}Welcome to Bash Scripting 301!${normal}"
echo "This level covers advanced scripting concepts such as:"
echo "Process management, error handling, scheduling, and regular expressions."
echo "Let's automate some tasks!"

pause() {
  read -p "Press [Enter] to continue..."
}

# Lesson 1: Process Management
echo
echo "${bold}Lesson 1: Process Management${normal}"
echo "You can manage processes in Bash using commands like 'ps', 'kill', and 'jobs'."
echo "Example: ${yellow}ps aux${reset} shows all processes."
echo "To terminate a process: ${yellow}kill PID${reset}"
pause

while true; do
  echo "Your turn! Find your shell's process ID using the command 'ps'."
  read -e -p "Enter your command: " user_input_process

  # Validate the input
  if [[ "$user_input_process" == *"ps"* ]]; then
    eval "$user_input_process"
    echo "${green}Great job!${reset} You listed processes."
    break
  else
    echo "${red}Not quite.${reset} Use the 'ps' command to list processes."
  fi
done
pause

# Lesson 2: Error Handling
echo
echo "${bold}Lesson 2: Error Handling${normal}"
echo "Every command in Bash returns an exit code. You can check it with \$?."
echo "Example:"
echo "${yellow}ls /nonexistent_directory"
echo "echo \$?${reset} shows the exit code (non-zero for errors)."
pause

while true; do
  echo "Your turn! Run a command that fails, then check its exit code."
  read -e -p "Enter your commands: " user_input_error

  eval "$user_input_error" 2>/dev/null
  exit_code=$?

  if [[ $exit_code -ne 0 ]]; then
    echo "${green}Correct!${reset} Exit code: $exit_code (non-zero indicates failure)."
    break
  else
    echo "${red}Not quite.${reset} Try running a failing command and checking its exit code with \$?."
  fi
done
pause

# Lesson 3: Cron Jobs and Scheduling
echo
echo "${bold}Lesson 3: Cron Jobs and Scheduling${normal}"
echo "You can schedule tasks with 'cron'. Use 'crontab -e' to edit your cron jobs."
echo "Example: ${yellow}* * * * * echo 'Hello' >> hello.log${reset} runs every minute."
pause

while true; do
  echo "Your turn! Write a cron job that logs 'Task Completed' to 'task.log' every hour."
  echo "Use the syntax: ${yellow}* * * * * command${reset}"
  echo "(Don't worry, this is just a simulation. You don't need real permissions!)"
  read -e -p "Enter your cron job: " user_input_cron

  if [[ "$user_input_cron" == *"task.log"* ]]; then
    echo "${green}Good job!${reset} You wrote a valid cron job."
    break
  else
    echo "${red}Not quite.${reset} Make sure your cron job logs to 'task.log'."
  fi
done
pause

# Lesson 4: Regular Expressions
echo
echo "${bold}Lesson 4: Regular Expressions${normal}"
echo "Regular expressions let you search text patterns. For example:"
echo "${yellow}echo 'Bash 301' | grep '[0-9]+'${reset} finds numbers in text."
pause

while true; do
  echo "Your turn! Use 'grep' to find lines containing numbers in this file:"
  echo "${yellow}echo -e 'Bash\n301\nScript' > numbers.txt${reset}"
  echo "Hint: Use '[0-9]+' as your pattern."
  echo
  eval "echo -e 'Bash\n301\nScript' > numbers.txt" # Create the test file
  read -e -p "Enter your grep command: " user_input_grep

  result=$(eval "$user_input_grep" 2>/dev/null)
  if [[ "$result" == "301" ]]; then
    echo "${green}Correct!${reset} You found the number 301."
    rm numbers.txt # Clean up
    break
  else
    echo "${red}Not quite.${reset} Try using the pattern '[0-9]+'."
  fi
done
pause

# Conclusion
echo
echo "${green}Congratulations!${reset} You've completed Bash Scripting 301."
echo "You learned about:"
echo "- Process management"
echo "- Error handling with exit codes"
echo "- Scheduling with cron"
echo "- Regular expressions for text searching"
echo "Keep practicing these concepts to master automation!"
