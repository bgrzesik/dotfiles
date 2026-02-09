if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"
DISABLE_AUTO_UPDATE="true"

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    echo "git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    echo "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

plugins=(git z fzf zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

function android_lunch_prompt() {
    if [[ -z "$ANDROID_BUILD_TOP" ]]; then
        return 0
    fi

    local LUNCH="lunch: $TARGET_PRODUCT-$TARGET_BUILD_VARIANT"

    echo -n "%{$fg[red]%}"
    echo -n "$LUNCH"
    echo -n "%{$reset_color%} "
}

function adb_prompt() {
    if [[ -z "$ANDROID_SERIAL" ]]; then
        return 0
    fi

    local ADB_DEVICE=`adb devices -l | grep $ANDROID_SERIAL`
    local ADB_SUFFIX=""

    if [[ -z "$ADB_DEVICE" ]]; then
        ADB_SUFFIX="(disconnected)"
    elif [[ ! -z `echo $ADB_DEVICE | grep offline` ]]; then
        ADB_SUFFIX="(offline)"
    else
        ADB_SUFFIX=`echo $ADB_DEVICE | grep -Eoh 'product:(\w+)'`
    fi

    local ADB="adb: $ANDROID_SERIAL $ADB_SUFFIX"

    echo -n "%{$fg[green]%}"
    echo -n "$ADB"
    echo -n "%{$reset_color%} "
}

function prompt_static_string() {
    if [[ -z "$BGRZESIK_STATIC_PROMPT" ]]; then
        return 0
    fi

    echo -n "$BGRZESIK_STATIC_PROMPT "
}

function custom_prompt() {
    prompt_static_string
    android_lunch_prompt
    adb_prompt
}

# I don't use Merculiar
function hg_prompt_info() {
    custom_prompt
}

if [[ -f ~/.profile ]]; then
    . ~/.profile
fi

alias vim=nvim
export EDITOR=nvim