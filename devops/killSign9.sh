
#!/bin/bash
PID=(your_process_name)

#kill any process running
ps -ef | grep (your_process_name) | grep -v grep | awk '{print $2}' | xargs kill
   sleep 2
echo -e "  $PID was TERMINATED    "
