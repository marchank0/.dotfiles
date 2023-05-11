#!/bin/bash

fw="/usr/libexec/ApplicationFirewall/socketfilterfw"
mosh_abs="/usr/local/Cellar/mosh/HEAD-aafe2f9/bin/mosh-server"

"$fw" --setglobalstate off

"$fw" --remove "$mosh_abs"
"$fw" --add "$mosh_abs"
"$fw" --unblockapp "$mosh_abs"

"$fw" --setglobalstate on
