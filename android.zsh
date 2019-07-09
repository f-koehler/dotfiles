if [ -d $HOME/Android/Sdk ]; then
    export ANDROID_SDK_ROOT=$HOME/Android/Sdk
    if [ -d $ANDROID_SDK_ROOT/tools ]; then
        export PATH="$ANDROID_SDK_ROOT/tools:$PATH"
    fi
    if [ -d $ANDROID_SDK_ROOT/platform-tools ]; then
        export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
    fi
    if [ -d $ANDROID_SDK_ROOT/ndk-bundle ]; then
        export ANDROID_NDK="$ANDROID_SDK_ROOT/ndk-bundle"
        export NDK_ROOT="$ANDROID_SDK_ROOT/ndk-bundle"
    fi
fi
if [ -d $HOME/.android ]; then
    export ANDROID_EMULATOR_HOME=$HOME/.android
    export ANDROID_AVD_HOME=$ANDROID_EMULATOR_HOME/avd
fi

