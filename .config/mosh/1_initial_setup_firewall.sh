#!/bin/bash

fw="/usr/libexec/ApplicationFirewall/socketfilterfw"
mosh_sym="$(which mosh-server)"

#need to get real path, not a symlink dynamically
mosh_abs="/usr/local/Cellar/mosh/HEAD-378dfa6_18/bin/mosh-server"

"$fw" --setglobalstate off
#"$fw" --add "$mosh_sym"
"$fw" --remove "$mosh_abs"
"$fw" --add "$mosh_abs"
"$fw" --unblockapp "$mosh_abs"
"$fw" --setglobalstate on
