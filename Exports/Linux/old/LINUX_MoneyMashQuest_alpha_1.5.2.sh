#!/bin/sh
echo -ne '\033c\033]0;Money Mash Quest\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/LINUX_MoneyMashQuest_alpha_1.5.2.x86_64" "$@"
