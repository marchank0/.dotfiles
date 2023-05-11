#!/usr/bin/env zsh

kitty="/usr/local/bin/kitty"

cat - | while read MODE
do
    if [[ ${MODE} == "light" ]] 
    then
        eval "$kitty" +kitten themes --reload-in=all "dawnfox"
        #echo "set background=light" > ~/.vimcolor
        echo "colorscheme dawnfox" > ~/.vimcolor
    else
        eval "$kitty" +kitten themes --reload-in=all "duskfox"
        echo "colorscheme duskfox" > ~/.vimcolor
    fi

    echo "`date` - switched to ${MODE} mode"
done
