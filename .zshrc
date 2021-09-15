# Title: .zshrc 
# Author: Nick Fabrizio
# Date: 2021-09-14



# Shell variables
   export ZSH="/home/robanks/.oh-my-zsh"       # Path to your oh-my-zsh installation.
   export EDITOR=vim                           # Set default text editor
   export WORDCHARS=''                         # This is the oh-my-zsh default, I think I'd like it to be a bit different 
   export PAGER=less                           # Set default pager
   export LESS="-R"                            # Set the default options for less 
   export LANG="en_US.UTF-8"                   # I'm not sure who looks at this, but I know it's good to set in general
   export PASSWORD_STORE_DIR=".pass"           # Set the location of the encrypted password store for 'pass'
   export PASSWORD_STORE_CLIP_TIME=30          # Set how long a password clipped to the clipboard with 'pass' lasts
   export LESSHISTFILE="/dev/null"                    # Prevent the less hist file from being made, I don't want it
   
# Misc
   setopt ZLE                                  # Enable the ZLE line editor, which is default behavior, but to be sure
   declare -U path                             # prevent duplicate entries in path
   umask 002                                   # Default permissions for new files, subract from 777 to understand
   setopt NO_BEEP                              # Disable beeps
   setopt AUTO_CD                              # Sends cd commands without the need for 'cd'
   setopt MULTI_OS                             # Can pipe to mulitple outputs
   unsetopt NO_HUP                             # Kill all child processes when we exit, don't leave them running
   setopt INTERACTIVE_COMMENTS                 # Allows comments in interactive shell.
   setopt RC_EXPAND_PARAM                      # Abc{$cool}efg where $cool is an array surrounds all array    
   unsetopt FLOW_CONTROL                       # Ctrl+S and Ctrl+Q usually disable/enable tty input. This disables those inputs
   setopt LONG_LIST_JOBS                       # List jobs in the long format by default. (I don't know what this does but it sounds good)
   setopt vi                                   # Make the shell act like vi if i hit escape
   source $ZSH/oh-my-zsh.sh                    # Source oh-my-zsh

# ZSH History 
   alias history='fc -fl 1'
   HISTFILE=$ZSH_CACHE/history                 # Keep our home directory neat by keeping the histfile somewhere else
   SAVEHIST=10000                              # Big history
   HISTSIZE=10000                              # Big history
   setopt EXTENDED_HISTORY                     # Include more information about when the command was executed, etc
   setopt APPEND_HISTORY                       # Allow multiple terminal sessions to all append to one zsh command history
   setopt HIST_FIND_NO_DUPS                    # When searching history don't display results already cycled through twice
   setopt HIST_EXPIRE_DUPS_FIRST               # When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE 
   setopt HIST_IGNORE_SPACE                    # Don't enter commands into history if they start with a space
   setopt HIST_VERIFY                          # makes history substitution commands a bit nicer. I don't fully understand
   setopt SHARE_HISTORY                        # Shares history across multiple zsh sessions, in real time
   setopt HIST_IGNORE_DUPS                     # Do not write events to history that are duplicates of the immediately previous event
   setopt INC_APPEND_HISTORY                   # Add commands to history as they are typed, don't wait until shell exit
   setopt HIST_REDUCE_BLANKS                   # Remove extra blanks from each command line being added to history

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
fi
