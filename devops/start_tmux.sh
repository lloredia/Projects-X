#!/bin/sh

session=$USER

# set up tmux
tmux start-server
# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n id
# Select pane 1, run cmd
tmux selectp -t 1
tmux send-keys "cd ~/devops;w;arp;ls -altr --color=auto" C-m
# Split pane 1 horizontal by 50%, run cmd
tmux splitw -h -p 50
tmux send-keys "top" C-m
# Select pane 2
#tmux selectp -t 2
# Split pane 2 vertically by 50%
tmux splitw -v -p 50
# select pane 3, run cmd
tmux selectp -t 3
tmux send-keys "cat /home/lloredia/host.txt" C-m

tmux send-keys "watch -n 5 w" C-m

# Select pane 4
tmux selectp -t 4
# Select pane 0
tmux selectp -t 0
# create a new window called scratch
tmux new-window -t $session:1 -n tmux
# return to main vim window
tmux select-window -t $session:0
# Finished setup, attach to the tmux session!
tmux attach-session -t $session
