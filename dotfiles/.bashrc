
#this is my tmux configuration

# Set prefix key to Ctrl-a
unbind-key C-b
set-option -g prefix C-a

# alternatively, use better mnemonics for horizontal/vertical splits
bind-key - split-window -v
bind-key _ split-window -v
bind-key | split-window -h

# alt arrow navigation
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# activity monitoring
setw -g monitor-activity on
set -g visual-activity on

# new binds
bind ^A select-pane -t :.+

bind -n C-n new-window
bind -n C-PageUp next-window
bind -n C-PageDown last-window
bind -n C-w confirm kill-window
