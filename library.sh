function df_install_file() {
    if [[ ! -f $1 ]]; then
        return
    fi
    mkdir -p "$(dirname $2)"
    cp -f $1 $2
}

function df_install_folder_content() {
    if [[ ! -d $1 ]]; then
        return
    fi
    if [[ ! -d $2 ]]; then
        mkdir -p $2
    else
        rm -rf $2/* $2/.* 2> /dev/null
    fi
    cp -rf $1/* $2 2> /dev/null
}
