#!/bin/bash

# Enable color output for feedback
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

# Welcome message
echo "${bold}Welcome to Cybersecurity Automation with Bash!${normal}"
echo "This script covers automation techniques for common cybersecurity tasks."
echo "You'll practice log analysis, scanning, and monitoring."
echo "Let's dive in!"

pause() {
  read -p "Press [Enter] to continue..."
}

# Lesson 1: Log File Analysis
echo
echo "${bold}Lesson 1: Log File Analysis${normal}"
echo "Log file analysis is critical for detecting anomalies and potential breaches."
echo "For example, you can use 'grep' to find failed login attempts:"
echo "${yellow}grep 'Failed password' /var/log/auth.log${reset}"
pause

# Task: Find failed login attempts
echo "${yellow}Task 1:${reset} Analyze the sample log file 'auth.log' to find failed login attempts."
echo "The log file contains entries similar to those in '/var/log/auth.log'."
echo "Look for lines containing the word '${bold}Failed password${normal}'."
echo
echo -e "Failed password for invalid user root\nSuccessful login for user alice\nFailed password for user admin" > auth.log
cat auth.log
while true; do
  read -e -p "Enter your grep command: " user_input_grep
  result=$(eval "$user_input_grep" 2>/dev/null)
  if [[ "$result" == *"Failed password"* ]]; then
    echo "${green}Correct!${reset} You found the failed login attempts."
    rm auth.log
    break
  else
    echo "${red}Not quite.${reset} Use 'grep' with the pattern 'Failed password'."
  fi
done
pause

# Lesson 2: Network Scanning with nmap
echo
echo "${bold}Lesson 2: Network Scanning with nmap${normal}"
echo "Network scanning helps identify open ports and services. For example:"
echo "${yellow}nmap -p 22,80 192.168.1.1${reset} scans ports 22 and 80 on a host."
pause

# Task: Scan for open ports
echo "${yellow}Task 2:${reset} Use 'nmap' to scan for open ports on a sample host."
echo "Simulate a scan on the IP address '192.168.1.10' to find open ports 22 and 80."
while true; do
  read -e -p "Enter your nmap command: " user_input_nmap
  if [[ "$user_input_nmap" == *"nmap"* && "$user_input_nmap" == *"192.168.1.10"* ]]; then
    echo "Starting Nmap scan on 192.168.1.10..."
    echo -e "PORT\tSTATE\tSERVICE\n22/tcp\topen\tssh\n80/tcp\topen\thttp"
    echo "${green}Correct!${reset} You found the open ports."
    break
  else
    echo "${red}Not quite.${reset} Use 'nmap -p 22,80 192.168.1.10' to scan."
  fi
done
pause

# Lesson 3: File Integrity Monitoring
echo
echo "${bold}Lesson 3: File Integrity Monitoring${normal}"
echo "File integrity monitoring detects unauthorized changes. Use 'md5sum' to verify file integrity."
echo "Example:"
echo "${yellow}md5sum file.txt${reset}"
pause

# Task: Verify file integrity
echo "${yellow}Task 3:${reset} Generate an MD5 hash for a file and verify its integrity after modification."
echo "A sample file 'important.txt' has been created. Calculate its hash."
echo "Later, modify the file and compare the hashes."
echo "Creating 'important.txt' with initial content..."
echo "Confidential data" > important.txt
cat important.txt
while true; do
  read -e -p "Generate the hash: " user_input_md5
  hash_original=$(md5sum important.txt | awk '{print $1}')
  result=$(eval "$user_input_md5" 2>/dev/null)
  if [[ "$result" == "$hash_original "* ]]; then
    echo "${green}Correct!${reset} Original hash: $hash_original"
    echo "Now modify 'important.txt' and generate the new hash."
    echo "Appending data to 'important.txt'..."
    echo "Additional data" >> important.txt
    break
  else
    echo "${red}Not quite.${reset} Use 'md5sum important.txt' to calculate the hash."
  fi
done

while true; do
  read -e -p "Generate the new hash: " user_input_md5_new
  hash_new=$(md5sum important.txt | awk '{print $1}')
  result=$(eval "$user_input_md5_new" 2>/dev/null)
  if [[ "$result" == "$hash_new "* ]]; then
    echo "${green}Correct!${reset} New hash: $hash_new"
    if [[ "$hash_original" != "$hash_new" ]]; then
      echo "${yellow}Warning:${reset} The file has been modified!"
    fi
    rm important.txt
    break
  else
    echo "${red}Not quite.${reset} Use 'md5sum important.txt' to calculate the hash."
  fi
done
pause

# Lesson 4: Intrusion Detection
echo
echo "${bold}Lesson 4: Automating Intrusion Detection${normal}"
echo "Use Bash scripts to automate intrusion detection tasks."
echo "For example, monitor failed SSH login attempts:"
echo "${yellow}grep 'Failed password' /var/log/auth.log | awk '{print \$11}' | sort | uniq -c${reset}"
pause

# Task: Detect failed SSH login attempts
echo "${yellow}Task 4:${reset} Create a script to count failed SSH login attempts from the sample log."
echo "The sample log 'auth.log' has been recreated for this task."
echo -e "Failed password for invalid user root\nFailed password for user admin\nFailed password for user admin" > auth.log
cat auth.log
while true; do
  echo "Write a command to count failed attempts per user:"
  read -e -p "Your command: " user_input_intrusion
  result=$(eval "$user_input_intrusion" 2>/dev/null)
  if [[ "$result" == *"2 admin"* && "$result" == *"1 root"* ]]; then
    echo "${green}Correct!${reset} You successfully detected failed attempts."
    rm auth.log
    break
  else
    echo "${red}Not quite.${reset} Use 'grep' and 'awk' to extract and count user names."
    echo "Hint: Try piping 'grep' output to 'awk' and then to 'uniq -c'."
  fi
done
pause

# Conclusion
echo
echo "${green}Congratulations!${reset} You've completed the Bash Cybersecurity Automation tutorial."
echo "You learned how to:"
echo "- Analyze log files for anomalies"
echo "- Perform network scans with nmap"
echo "- Monitor file integrity with hashing"
echo "- Automate intrusion detection with grep and awk"
echo "Keep exploring and building your Bash skills for cybersecurity!"
