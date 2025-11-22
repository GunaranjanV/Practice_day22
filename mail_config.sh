#!/bin/bash

# Detect package manager
 if command -v apt >/dev/null 2>&1; then
     echo "Detected Debian/Ubuntu system"
         sudo apt update
             sudo apt install -y mailutils ca-certificates
             elif command -v dnf >/dev/null 2>&1; then
                 echo "Detected Amazon Linux 2023 / Fedora / RHEL system"
                     sudo dnf update -y
                         sudo dnf install -y mailx ca-certificates
                         elif command -v yum >/dev/null 2>&1; then
                             echo "Detected RHEL/CentOS system"
                                 sudo yum update -y
                                     sudo yum install -y mailx ca-certificates
                                     else
                                         echo "Unsupported distribution. Please install mailx manually."
                                             exit 1
                                             fi

                                             # Configure mailx for Gmail
                                             cat << EOF > ~/.mailrc
                                             set smtp=smtp://smtp.gmail.com:587
                                             set smtp-auth=login
                                             set smtp-auth-user=gunaachar003@gmail.com
                                             set smtp-auth-password=zqfuanzrbjmcieaz
                                             set smtp-use-starttls
                                             set ssl-verify=ignore
EOF
					     chmod 600 ~/.mailrc

                                             echo "✅ mailx configuration completed. You can now send email using Gmail SMTP."
                                             echo "Example: echo 'Hello World' | mail -s 'Test Subject' recipient@example.com"
