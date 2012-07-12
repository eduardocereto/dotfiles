export CLICOLOR=1
export EDITOR="vim"
export MANPAGER="less -X"

source /Users/dudus/scripts/git-completion.bash

# Create a new directory and enter it
md() {
      mkdir -p "$@" && cd "$@"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
httpcompression() {
      encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# All the dig info
digga() {
      dig +nocmd "$1" any +multiline +noall +answer
}
