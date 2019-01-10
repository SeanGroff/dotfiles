# zsh
ZSH_THEME=""
plugins=(git zsh-autosuggestions)
export ZSH=/Users/sgroff/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit

prompt pure

# Custom Aliases
alias vim="nvim"
alias hack="subl"

# AWS Aliases
alias dyno-run="java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb"
alias dyno-list-tables="aws dynamodb list-tables --endpoint-url http://localhost:8000"

# NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/sgroff/.nvm/versions/node/v11.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/sgroff/.nvm/versions/node/v11.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/sgroff/.nvm/versions/node/v11.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/sgroff/.nvm/versions/node/v11.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
