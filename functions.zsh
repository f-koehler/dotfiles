# copy terminfo to remote host
function copy-terminfo {
    infocmp $TERM | ssh "$@" "mkdir -p .terminfo && cat >/tmp/ti && tic /tmp/ti"
}


# Create a list of all commits since the last git tag.
# Useful to create release notes.
function commits-since-tag {
    git log $(git describe --tags --abbrev=0)..HEAD --oneline
}

function print-colors256 {
    for i in {0..255}; do
        print -Pn "%K{$i} %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+$'\n'};
    done
}

# get SSL certificate fingerprint
function fingerprint-ssl {
    echo -n | openssl s_client -connect $1:443 | openssl x509 -noout -fingerprint
}
