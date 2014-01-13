#!/usr/bin/env rdmd

import std.stdio;

void main(immutable string[] args) {
  for(int i = 0; i < args.length; i++) {
    writeln("Arg: ", args[i]);
  }
}
