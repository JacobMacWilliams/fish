function quietbird
  thunderbird $argv &> /dev/null & disown
end
