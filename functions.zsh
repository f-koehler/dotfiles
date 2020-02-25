# copy terminfo to remote host
function copy-terminfo {
    infocmp $TERM | ssh "$@" "mkdir -p .terminfo && cat >/tmp/ti && tic /tmp/ti"
}


# Create a list of all commits since the last git tag.
# Useful to create release notes.
function commits-since-tag {
    git log $(git describe --tags --abbrev=0)..HEAD --oneline
}
