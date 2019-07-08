if [ -d $HOME/code/cocos2d-x ]; then
    export COCOS_ROOT=$HOME/code/cocos2d-x
    export COCOS_X_ROOT="$HOME/code/"
    export PATH="$COCOS_X_ROOT:$PATH"

    if [ -d $COCOS_ROOT/tools/cocos2d-console/bin ]; then
        export COCOS_CONSOLE_ROOT="$COCOS_ROOT/tools/cocos2d-console/bin"
        export PATH="$COCOS_CONSOLE_ROOT:$PATH"
    fi

    if [ -d $COCOS_ROOT/templates ]; then
        export COCOS_TEMPLATES_ROOT="$COCOS_ROOT/templates"
        export PATH="$COCOS_TEMPLATES_ROOT:$PATH"
    fi
fi
