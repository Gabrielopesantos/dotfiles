# current time with milliseconds
local current_time="%*"

# returns 👾 if there are errors, nothing otherwise
local return_status="%(?..👾)"

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[green]%}%~%{$reset_color%} $(ruby_prompt_info) $(git_prompt_info)%{$reset_color%}%B$%b '
#RPROMPT="${return_code}"
RPROMPT='${return_status}${return_code}[${current_time}]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"


ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"
