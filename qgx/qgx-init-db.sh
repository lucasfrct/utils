#!/bin/bash +x

gnome-terminal --tab --title="MYSQL" --command="bash -c 'cd ~/development/database; docker-compose down -v; docker-compose up; 
$SHELL'"