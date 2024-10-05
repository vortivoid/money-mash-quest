#!/bin/sh
echo -ne '\033c\033]0;Money Mash Quest\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/MoneyMashQuest-1.5.1.x86_64" "$@"
