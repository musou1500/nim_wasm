# Package

version       = "0.1.0"
author        = "musou1500"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin = @["nim_wasm"]


# Dependencies

requires "nim >= 0.20.0, jsbind >= 0.1"

task buildwasm, "build nim_wasm.nim":
  exec "nim c -d:release -d:emscripten -o:resources/nim_wasm.js src/nim_wasm.nim"

