function _rb_prompt
  # rbenv local > /dev/null 2>&1 && echo " ["(rbenv local | awk '{print $1}')"]"
  echo ''
end

function fish_right_prompt
  set -l normal (set_color normal)
  set -l cyan (set_color cyan)
  set -l grey (set_color 3C3836)
  set -l date (date "+%H:%M")
  set -l date "$grey$date$normal"

  set -l ruby_version $cyan(_rb_prompt)
  set -l ruby_version "$ruby_version$normal"

  echo -s $date$ruby_version
end
