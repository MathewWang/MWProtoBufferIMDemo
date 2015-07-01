#!/bin/sh
SRC_DIR=./
DST_DIR=./gen

#Objc
mkdir -p $DST_DIR/objc
protoc --proto_path=. --objc_out=$DST_DIR/objc $SRC_DIR/*.proto

#C++
#mkdir -p $DST_DIR/objc
#protoc -I=. --cpp_out=$DST_DIR/objc $SRC_DIR/*.proto
