#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage:"
    echo " ./roger-deploy \"Message de Commit"\"
    exit 1
fi
if [ $# -eq 1 ]; then
    git add .
    git commit -m "$1"
    git push
    echo "Git repository updated. Now running update on server."
    ssh lodetien@192.168.56.3 -p 44 "cd /var/www/html" "sh update_server.sh"
    exit 0
fi
exit 1
