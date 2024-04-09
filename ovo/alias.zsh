#!/bin/bash

alias stash-for-later="git stash save -u 'WIP: Stashed for later'"

# AWS
alias aws-login-uat="aws sso login --profile ovoenergy-terraformer-uat"

# OVO Repositories

# Update local repos
alias update-payment-service="cd ~/dev/ovo/payment-service && stash-for-later && gco main && git pull && cd ~/dev/ovo/payment-service/api && yarn install"
alias update-promotions-service="cd ~/dev/ovo/promotions-service && stash-for-later && gco main && git pull && cd ~/dev/ovo/promotions-service/node && yarn install"
alias update-myovo="cd ~/dev/ovo/myovo && stash-for-later && gco main && git pull && ~/dev/ovo/myovo/projects/api/server && yarn install && ~/dev/ovo/myovo/projects/ui && yarn install && yarn build:mobile"
# Update all
alias update-repos-for-local-dev="update-payment-service && update-promotions-service && update-myovo && cd ~"

# Start local environments
alias start-payment-service="cd ~/dev/ovo/payment-service/api && yarn start:dev"
alias start-promotions-service="cd ~/dev/ovo/promotions-service && cd node && yarn start:dev"
alias start-myovo-api="cd ~/dev/ovo/myovo/projects/api/server && yarn start:dev"
alias start-myovo-ui="cd ~/dev/ovo/myovo/projects/ui && yarn start:local"
alias start-ios="cd ~/dev/ovo/myovo/projects/ui && yarn start:ios"
# Start all
alias start-local-dev="aws-login-uat && ttab start-payment-service && ttab start-promotions-service && ttab start-myovo-api && ttab start-ios"
# Update and start all
alias update-and-start-local-dev="update-repos-for-local-dev && start-local-dev"

# Releases
alias bump-version="sh ~/dev/ovo/au-admin-scripts/scripts/release/bump_version_pr.sh"
alias release-project="sh ~/dev/ovo/au-admin-scripts/scripts/release/release_project.sh"

# Day-to-days
alias play="code -n ~/dev/testing/typescript-playground"
alias pomodoro="sh ~/code/my-stuff/pomodoro/pomodoro.sh"
alias start-day="slack && brew update && brew upgrade && update-repos-for-local-dev"

# Kaluza API
alias apollo-prod="cd ~/dev/ovo/ && open graphql-sandbox-prod.html -a 'Google Chrome.app'"
alias apollo-uat="cd ~/dev/ovo/ && open graphql-sandbox.html -a 'Google Chrome.app'"
