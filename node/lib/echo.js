#!/usr/bin/env node

function main() {
  process.stdin.resume();
  process.stdin.setEncoding("UTF8");

  process.stdin.on("data", function(chunk) {
    process.stdout.write(chunk);
  });

  process.stdin.on("end", function() {});
}

if (!module.parent) { main(); }
