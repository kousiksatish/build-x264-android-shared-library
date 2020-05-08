# Build x264 shared library for Android

## Steps to build

1. Clone or download code of latest x264 library from VLC https://www.videolan.org/developers/x264.html

```bash
git clone https://code.videolan.org/videolan/x264.git
```

2. Copy the script named x264_build_script.sh in this repository into the cloned/extracted x264 directory and change to that directory

```bash
cp x264_build_script.sh <DIRECTORY_CONTAINING_X264>/x264
cd <DIRECTORY_CONTAINING_X264>/x264
```
3. Run the x264_build_script.sh 

```
chmod a+x x264_build_script.sh
./x264_build_script.sh
```
4. Find the generated .so files at ~/android directory




