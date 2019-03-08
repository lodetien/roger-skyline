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
    ssh lodetien@localhost -p 44 "/home/lodetien/var/www/html/update_server.sh"
    exit 0
fi
exit 1
