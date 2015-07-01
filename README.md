# MWProtoBufferIMDemo

This is a ios client IM demo, it use the google protobuf as the protocol for networking trasition.

1. Version of Protobuf Lib : 2.2.0

2. Version of Protobuf Compile Tool: 2.2.0 (http://code.google.com/p/metasyntactic/downloads/list)

3. Build Protobuf cmd line steps:
   Download latest version of procbuffer. [http://code.google.com/p/metasyntactic/downloads/list].
          tar xfvj protobuf-2.2.0.tar.bz2 
   Configure the protobuf. 

          cd protobuf-2.2.0
          ./configure CC=clang CXX=clang++ CXXFLAGS='-std=c++11 -stdlib=libc++ -O3 -g' LDFLAGS='-stdlib=libc++'                   LIBS="-lc++ -lc++abi"
   Make the source 
          make -j 4 
          sudo make install
4. Error when compiling:
          You may encounter an error say something error in file ".../message.cc", just go to folder "../src/google/protobuf" to find out the file and add "#include \<istream\>".

5. After built the protobuf cmd tool
   Create a .proto file, this file is the bean model, then use proto cmd line to bulid the .proto to objective-c      file. (for the cmd line,please refer to the file "create.sh" under thie project folder              "../TCPClientManager/TCPAPI/PBTemp/")


