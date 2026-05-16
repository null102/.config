ranger-cd() {
  tmpfile=$(mktemp)

  ranger --choosedir="$tmpfile" "${1:-.}"

  if [[ -f "$tmpfile" ]]; then
    dir=$(cat "$tmpfile")
    rm -f "$tmpfile"

    [[ -d "$dir" ]] && cd "$dir"
  fi
}
