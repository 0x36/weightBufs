clang -o exploit *.c *.m  -framework IOKit -framework CoreFoundation \
      -framework IOSurface -F /System/Library/PrivateFrameworks \
      -framework AppleNeuralEngine -framework CoreML \
      -framework Foundation -ObjC
