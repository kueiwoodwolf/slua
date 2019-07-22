# if [ -z "$NDKPATH" ]; then
#     echo "Android NDK not detected'"
#     exit 1
# fi

COMMON_FLAGS="-DANDROID_PLATFORM=android-16 \
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=. \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_NDK=/Users/hjs/Library/Android/sdk/ndk-bundle \
-DCMAKE_CXX_FLAGS= \
-DCMAKE_SYSTEM_NAME=Android \
-DCMAKE_SYSTEM_VERSION=16 \
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
-DCMAKE_ANDROID_NDK=/Users/hjs/Library/Android/sdk/ndk-bundle \
-DCMAKE_TOOLCHAIN_FILE=/Users/hjs/Library/Android/sdk/ndk-bundle/build/cmake/android.toolchain.cmake \
-G Ninja \
-DCMAKE_MAKE_PROGRAM=/Users/hjs/Library/Android/sdk/cmake/3.10.2.4988404/bin/ninja"


# build armv7a
mkdir -p build_android_v7a && cd build_android_v7a
cmake -DANDROID_ABI=armeabi-v7a -DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a $COMMON_FLAGS ..
cd ..
cmake --build build_android_v7a --config Release
cp build_android_v7a/libslua.so ../Assets/Plugins/Android/libs/armeabi-v7a/libslua.so

# build arm64
mkdir -p build_android_arm64 && cd build_android_arm64
cmake -DANDROID_ABI=arm64-v8a -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a $COMMON_FLAGS ..
cd ..
cmake --build build_android_arm64 --config Release
cp build_android_arm64/libslua.so ../Assets/Plugins/Android/libs/armeabi-arm64/libslua.so

# build x86
mkdir -p build_android_x86 && cd build_android_x86
cmake -DANDROID_ABI=x86 -DCMAKE_ANDROID_ARCH_ABI=x86 $COMMON_FLAGS ..
cd ..
cmake --build build_android_x86 --config Release
cp build_android_x86/libslua.so ../Assets/Plugins/Android/libs/x86/libslua.so

# build x86_64
mkdir -p build_android_x86_64 && cd build_android_x86_64
cmake -DANDROID_ABI=x86_64 -DCMAKE_ANDROID_ARCH_ABI=x86_64 $COMMON_FLAGS ..
cd ..
cmake --build build_android_x86_64 --config Release
cp build_android_x86/libslua.so ../Assets/Plugins/Android/libs/x86_64/libslua.so
