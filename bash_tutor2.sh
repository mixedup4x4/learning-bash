#!/bin/bash

# Enable color output for better feedback
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

# Welcome message
echo "${bold}Welcome to Bash Scripting 201!${normal}"
echo "This advanced script will teach you about conditionals, functions, arrays, and file handling."
echo "Let's level up your Bash scripting skills!"

# Pause function
pause() {
  read -p "Press [Enter] to continue..."
}

# Lesson 1: Conditionals
echo
echo "${bold}Lesson 1: Conditionals${normal}"
echo "Conditionals allow your script to make decisions. For example:"
echo "${yellow}if [ \$age -ge 18 ]; then"
echo "  echo 'You are an adult.'"
echo "else"
echo "  echo 'You are a minor.'"
echo "fi${reset}"
pause

while true; do
  echo "Your turn! Write a conditional to check if a number is even or odd."
  echo "Hint: Use modulo operator (%). For example, \$((number % 2))"
  read -e -p "Enter your script (end it with 'fi'): " user_input_conditional

  # Validate the input and execute it
  eval "$user_input_conditional" 2>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} Your conditional worked."
    break
  else
    echo "${red}Not quite.${reset} Remember the syntax for conditionals."
    echo "Hint: ${yellow}if [ \$((number % 2)) -eq 0 ]; then ... fi${reset}"
  fi
done
pause

# Lesson 2: Functions
echo
echo "${bold}Lesson 2: Functions${normal}"
echo "Functions allow you to organize reusable code. For example:"
echo "${yellow}greet() {"
echo "  echo \"Hello, \$1!\""
echo "}"
echo "greet Alice${reset}"
pause

while true; do
  echo "Your turn! Write a function called 'square' that takes a number and prints its square."
  echo "Example: square 4 should print 16."
  read -e -p "Enter your function and call it: " user_input_function

  # Validate the input and execute it
  eval "$user_input_function" 2>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} Your function worked as expected."
    break
  else
    echo "${red}Not quite.${reset} Remember the syntax for functions."
    echo "Hint: ${yellow}square() { echo \$((\$1 * \$1)); }${reset}"
  fi
done
pause

# Lesson 3: Arrays
echo
echo "${bold}Lesson 3: Arrays${normal}"
echo "Arrays let you store multiple values in a single variable. For example:"
echo "${yellow}fruits=('apple' 'banana' 'cherry')"
echo "echo \"First fruit: \${fruits[0]}\""
echo "for fruit in \"\${fruits[@]}\"; do"
echo "  echo \$fruit"
echo "done${reset}"
pause

while true; do
  echo "Your turn! Create an array of three colors and print each color using a loop."
  read -e -p "Enter your script: " user_input_array

  # Validate the input and execute it
  eval "$user_input_array" 2>/dev/null
  if [[ $? -eq 0 ]]; then
    echo "${green}Correct!${reset} Your array and loop worked as expected."
    break
  else
    echo "${red}Not quite.${reset} Check your array and loop syntax."
    echo "Hint: ${yellow}colors=('red' 'green' 'blue')${reset}"
    echo "Use a loop: ${yellow}for color in \"\${colors[@]}\"; do ... done${reset}"
  fi
done
pause

# Lesson 4: File Manipulation
echo
echo "${bold}Lesson 4: File Manipulation${normal}"
echo "Bash can be used to create, read, and write files. For example:"
echo "${yellow}echo 'Hello, World!' > file.txt"
echo "cat file.txt"
echo "rm file.txt${reset}"
pause

while true; do
  echo "Your turn! Create a file named 'greetings.txt', write 'Hello, Bash!' to it, then read its contents."
  read -e -p "Enter your commands: " user_input_file

  # Validate the input and execute it
  eval "$user_input_file" 2>/dev/null
  if [[ -f greetings.txt && "$(cat greetings.txt)" == "Hello, Bash!" ]]; then
    echo "${green}Correct!${reset} You successfully created, wrote to, and read from the file."
    rm greetings.txt
    break
  else
    echo "${red}Not quite.${reset} Ensure you follow the instructions."
    echo "Hint: Use ${yellow}echo 'Hello, Bash!' > greetings.txt${reset} and ${yellow}cat greetings.txt${reset}"
  fi
done
pause

# Conclusion
echo
echo "${green}Congratulations!${reset} You've completed Bash Scripting 201."
echo "You've learned:"
echo "- Conditionals to make decisions."
echo "- Functions to organize reusable code."
echo "- Arrays to store multiple values."
echo "- File manipulation for creating, reading, and writing files."
echo "Keep practicing and exploring advanced topics like process management, error handling, and regular expressions."
echo "Happy scripting!"
