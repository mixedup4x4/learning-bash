#!/bin/bash

# Enable color output for better feedback
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

# Welcome message
echo "${bold}Welcome to the Interactive Bash Scripting Tutor! 101 ${normal}"
echo "This script will guide you through basic Bash commands and scripting concepts."
echo "You'll practice each concept and get feedback until you master it."

# Pause function
pause() {
  read -p "Press [Enter] to continue..."
}

# Validate and retry function for user commands
validate_command() {
  local expected_output="$1"
  local prompt_message="$2"
  local hint="$3"

  while true; do
    read -e -p "$prompt_message" user_input
    actual_output=$(eval "$user_input" 2>/dev/null)

    if [[ "$actual_output" == "$expected_output" ]]; then
      echo "${green}Correct!${reset} Well done."
      break
    else
      echo "${red}Not quite.${reset} Expected: '${expected_output}', but got: '${actual_output:-error}'. Try again."
      [[ -n "$hint" ]] && echo "${yellow}Hint:${reset} $hint"
    fi
  done
}

# Lesson 1: Basics of Bash Commands
echo
echo "${bold}Lesson 1: Basics of Bash Commands${normal}"
echo "The 'echo' command prints text to the terminal. For example:"
echo "${yellow}echo 'Hello, World!'${reset}"
pause

echo
echo "Your turn! Use 'echo' to print '${bold}Hello, Bash!${normal}'"
validate_command "Hello, Bash!" "Enter your command: " "Use the 'echo' command with double or single quotes."
pause

# Lesson 2: Variables
echo
echo "${bold}Lesson 2: Variables${normal}"
echo "In Bash, you can store values in variables like this:"
echo "${yellow}name='John'${reset}"
echo "To use the variable, prefix it with a dollar sign (\$), like so:"
echo "${yellow}echo \"Hello, \$name!\"${reset}"
pause

# Step 1: Set a variable
while true; do
  echo
  echo "Your turn! Set a variable called 'my_name' to your name. Example:"
  echo "${yellow}my_name='Alice'${reset}"
  read -e -p "Set the variable: " user_input_var

  if [[ "$user_input_var" =~ ^my_name=.* ]]; then
    eval "$user_input_var" 2>/dev/null
    if [[ -n "$my_name" ]]; then
      echo "${green}Variable 'my_name' set successfully!${reset}"
      break
    else
      echo "${red}Error:${reset} Variable 'my_name' is empty. Try again."
    fi
  else
    echo "${red}Invalid input.${reset} Use the format: ${yellow}my_name='YourName'${reset}"
  fi
done

# Step 2: Use the variable
echo
echo "Now, use echo to greet yourself using the variable 'my_name'. Example:"
echo "${yellow}echo \"Hello, \$my_name!\"${reset}"
validate_command "Hello, $my_name" "Enter your command: " "Use double quotes (\") to expand the variable."
pause

# Lesson 3: Loops
echo
echo "${bold}Lesson 3: Loops${normal}"
echo "Loops allow you to repeat actions. For example, a 'for' loop can print numbers:"
echo "${yellow}for i in 1 2 3; do"
echo "  echo \"Number: \$i\""
echo "done${reset}"
pause

while true; do
  echo
  echo "Your turn! Write a loop to print numbers 1, 2, and 3."
  read -e -p "Enter your loop: " user_input_loop

  if [[ "$user_input_loop" == *"for"* && "$user_input_loop" == *"do"* && "$user_input_loop" == *"done"* ]]; then
    eval "$user_input_loop" 2>/dev/null
    if [[ $? -eq 0 ]]; then
      echo "${green}Well done!${reset} Your loop worked correctly."
      break
    else
      echo "${red}Error in execution.${reset} Check your syntax and try again."
    fi
  else
    echo "${red}Invalid loop.${reset} Remember the syntax:"
    echo "${yellow}for i in 1 2 3; do"
    echo "  echo \"Number: \$i\""
    echo "done${reset}"
  fi
done
pause

# Conclusion
echo
echo "${green}Congratulations!${reset} You've completed the basics of Bash scripting."
echo "You've learned how to use:"
echo "- The 'echo' command to print text."
echo "- Variables to store and use data."
echo "- Loops to repeat actions."
echo "Keep practicing to master more advanced concepts!"
echo "Happy scripting!"
