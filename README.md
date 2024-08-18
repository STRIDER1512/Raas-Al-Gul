# Raas-Al-Gul, A Drive-By-Download Ransomware Attack Simulator

This script automates the process of exploiting the EternalBlue vulnerability (MS17-010) on a Windows 7 machine and performing a drive-by download attack to deliver a malicious file, resulting in system access and potential ransomware execution.

## Prerequisites

- *Attacker Machine*: Kali Linux
- *Target Machine*: Windows 7 with security and firewall disabled

### Tools Required

1. *Metasploit Framework*: Pre-installed on Kali Linux.
2. *Apache Web Server*: Used to host the malicious file.
3. **Joy Launcher Executable (joy_launcher.exe): The malicious file that will be downloaded and executed on the target machine. [Zip password : 1234]

## Setup

1. *Install Apache Server* on Kali Linux:
    ```
    sudo apt-get update
    sudo apt-get install apache2
    ```
    

2. **Copy joy_launcher.exe** to the Apache server's root directory:
    ```
    sudo cp /path/to/joy_launcher.exe /var/www/html/
    ```
    

## Usage

1. *Run the Script*:
    - Execute the script in your terminal:
      ```
      bash rag.sh
      ```
      

2. *Input the Required Details*:
    - Target IP address (RHOSTS)
    - Local IP address (LHOST)
    - Port number (LPORT) (we used 4444)
    - URL of the file to download (e.g., http://your_local_ip/joy_launcher.exe)

3. *Exploit Execution*:
    - The script will create a malicious web page hosted on your Apache server.
    - It will then use Metasploit to exploit the EternalBlue vulnerability on the target machine, establishing a reverse TCP connection to your Kali machine.

4. *Victim Interaction*:
    - The victim must visit the malicious webpage. The file will be automatically downloaded.
    - Once the victim runs the downloaded file, the ransomware will execute, and system access will be granted to the attacker.

## Expected Outcome

- Successful exploitation will give the attacker system-level access to the target machine.
- Ransomware will execute upon running the downloaded file by the victim.

## Disclaimer

This script is for educational purposes only. Unauthorized use of this script in real-world scenarios is illegal and unethical. Always ensure that you have explicit permission to test systems using this exploit.
