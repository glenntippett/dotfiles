alias cl="clear"

alias my-prs="gh search prs --author=@me --state 'open'"
alias prs-to-review="gh search prs --review-requested=@me --state 'open'"
alias repov="gh repo view --web"
alias prv="gh pr view --web"

alias random-password='openssl rand -base64 256 | tr -d '\n' | cut -c 1-256'

# Search files in current directory and open in selected editor
alias fd="fd-find"

# Quickly serve the current directory as HTTP
alias serve='ruby -run -e httpd . -p 8000' # Or python -m SimpleHTTPServer

# Toggle darkmode on/off (Mac)
alias darkmode="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

# Slack
alias slack="export SLACK_DEVELOPER_MENU=true && open -a /Applications/Slack.app"

# Other
alias timestamp="date +%s"
alias starwars="telnet towel.blinkenlights.nl"
alias matrix="cmatrix"
