ANDROID_NDK=/home/kousik/Downloads/android-ndk-r14b/android-ndk-r14b
SDK_VERSION=21

build() {
ARCH=$1

if [ "$ARCH" = "arm64" ]; then
    PLATFORM_PREFIX="aarch64-linux-android-"
    HOST="aarch64-linux"
    PLATFORM_VERSION=4.9
elif [ "$ARCH" = "arm" ]; then
    PLATFORM_PREFIX="arm-linux-androideabi-"
    HOST="arm-linux"
    PLATFORM_VERSION=4.9
elif [ "$ARCH" = "x86" ]; then
    PLATFORM_PREFIX="i686-linux-android-"
    HOST="i686-linux"
    PLATFORM_VERSION=4.9
elif [ "$ARCH" = "x86_64" ]; then
    PLATFORM_PREFIX="x86_64-linux-android-"
    HOST="x86_64-linux"
    PLATFORM_VERSION=4.9
else
    echo "unsupport ARCH:$ARCH."
    exit
fi

PREFIX=~/android/${ARCH}
SYSROOT=$ANDROID_NDK/platforms/android-${SDK_VERSION}/arch-${ARCH}
TOOLCHAIN=$ANDROID_NDK/toolchains/${ARCH}-${PLATFORM_VERSION}/prebuilt/linux-x86_64
CC=$TOOLCHAIN/bin/${PLATFORM_PREFIX}gcc
CXX=$TOOLCHAIN/bin/${PLATFORM_PREFIX}c++
CROSS_PREFIX=$TOOLCHAIN/bin/${PLATFORM_PREFIX}
NM=$TOOLCHAIN/bin/${PLATFORM_PREFIX}nm

./configure \
    --prefix=$PREFIX \
    --cross-prefix=$CROSS_PREFIX \
    --sysroot=$SYSROOT \
    --host=$HOST \
    --prefix=$PREFIX \
    --enable-shared \
    --disable-asm \
    --enable-pic \
    --disable-cli \

make clean
make -j4
make install
}

build arm
build arm64
build x86
build x86_64