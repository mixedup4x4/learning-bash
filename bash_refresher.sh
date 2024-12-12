#!/bin/bash

# Enable color output for better feedback
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

# Welcome message
echo "${bold}Welcome to the Bash Scripting Refresher!${normal}"
echo "This comprehensive refresher will review key Bash scripting concepts."
echo "From basics to advanced topics, you'll solve tasks interactively."
echo "Let's begin!"

pause() {
  read -p "Press [Enter] to continue..."
}

# Section 1: Basics
echo
echo "${bold}Section 1: Basics${normal}"
echo "Let's start with a quick review of commands, variables, and loops."
pause

# Command Basics
echo
echo "${yellow}Task 1:${reset} Use the 'echo' command to print '${bold}Hello, Master!${normal}'"
while true; do
  read -e -p "Your command: " user_input
  if [[ "$user_input" == *"echo"* && "$user_input" == *"Hello, Master!"* ]]; then
    eval "$user_input"
    echo "${green}Great job!${reset}"
    break
  else
    echo "${red}Not quite.${reset} Use 'echo' to print the exact text."
  fi
done

# Variables
echo
echo "${yellow}Task 2:${reset} Set a variable 'greeting' to '${bold}Welcome Back${normal}' and print it using echo."
while true; do
  read -e -p "Set your variable: " user_input_var
  if [[ "$user_input_var" == *"greeting="* ]]; then
    eval "$user_input_var"
    if [[ -n "$greeting" ]]; then
      echo "${green}Variable set!${reset} Now print it."
      while true; do
        read -e -p "Print the variable: " user_input_echo
        if [[ "$user_input_echo" == *"echo"* && "$user_input_echo" == *"\$greeting"* ]]; then
          eval "$user_input_echo"
          echo "${green}Correct!${reset}"
          break 2
        else
          echo "${red}Not quite.${reset} Use 'echo \$greeting' to print the variable."
        fi
      done
    fi
  else
    echo "${red}Invalid input.${reset} Use the format: greeting='Welcome Back'"
  fi
done

# Loops
echo
echo "${yellow}Task 3:${reset} Write a loop to print numbers 1 to 5."
while true; do
  read -e -p "Your loop: " user_input_loop
  if [[ "$user_input_loop" == *"for"* && "$user_input_loop" == *"do"* && "$user_input_loop" == *"done"* ]]; then
    eval "$user_input_loop" 2>/dev/null
    if [[ $? -eq 0 ]]; then
      echo "${green}Great work!${reset}"
      break
    else
      echo "${red}Something went wrong.${reset} Check your loop syntax."
    fi
  else
    echo "${red}Invalid loop.${reset} Remember the syntax: for i in 1 2 3; do ... done"
  fi
done
pause

# Section 2: Advanced Topics
echo
echo "${bold}Section 2: Advanced Topics${normal}"
echo "Now let's tackle more advanced concepts: error handling, regular expressions, and parallel processing."
pause

# Error Handling
echo
echo "${yellow}Task 4:${reset} Run a command that fails (e.g., 'ls /nonexistent') and display its exit code."
while true; do
  read -e -p "Your commands: " user_input_error
  eval "$user_input_error" 2>/dev/null
  exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    echo "${green}Correct!${reset} Exit code: $exit_code indicates failure."
    break
  else
    echo "${red}Not quite.${reset} Run a failing command and check its exit code with 'echo \$?'."
  fi
done

# Regular Expressions
echo
echo "${yellow}Task 5:${reset} Use 'grep' to find lines containing numbers in this text:"
echo -e "${yellow}Bash\n301\nScripting\n501${reset}" > regex.txt
cat regex.txt
while true; do
  read -e -p "Your grep command: " user_input_grep
  result=$(eval "$user_input_grep" 2>/dev/null)
  if [[ "$result" == *"301"* && "$result" == *"501"* ]]; then
    echo "${green}Correct!${reset} You found the lines with numbers."
    rm regex.txt
    break
  else
    echo "${red}Not quite.${reset} Use the pattern '[0-9]+' with 'grep'."
  fi
done

# Parallel Processing
echo
echo "${yellow}Task 6:${reset} Run two commands in parallel: 'sleep 2' and 'echo Done'."
while true; do
  read -e -p "Your commands: " user_input_parallel
  eval "$user_input_parallel" &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Well done!${reset} You ran commands in parallel."
    break
  else
    echo "${red}Not quite.${reset} Use '&' to run commands in parallel."
  fi
done

# Section 3: Expert Techniques
echo
echo "${bold}Section 3: Expert Techniques${normal}"
echo "Let's wrap up with debugging, signal trapping, and cleanup."
pause

# Debugging
echo
echo "${yellow}Task 7:${reset} Enable debugging for a script that calculates the square of a number."
while true; do
  read -e -p "Your script: " user_input_debug
  eval "set -x; $user_input_debug; set +x" 2>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Great debugging!${reset}"
    break
  else
    echo "${red}Not quite.${reset} Use 'set -x' to enable debugging."
  fi
done

# Signal Trapping
echo
echo "${yellow}Task 8:${reset} Write a script that creates a temp file and deletes it on Ctrl+C (SIGINT)."
while true; do
  read -e -p "Your script: " user_input_trap
  eval "$user_input_trap" &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} You trapped the signal successfully."
    break
  else
    echo "${red}Not quite.${reset} Use 'trap' with a cleanup command like 'rm'."
  fi
done

# Conclusion
echo
echo "${green}Congratulations!${reset} You've completed the Bash Scripting Refresher."
echo "You reviewed topics from all levels, including:"
echo "- Basics: Commands, variables, loops"
echo "- Advanced: Error handling, regex, parallel processing"
echo "- Expert: Debugging, signal trapping"
echo "Keep practicing and applying your skills. Happy scripting!"
