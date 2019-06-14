import jsbind/emscripten

proc fact*(n: int32, acc: int32): int32 {.EMSCRIPTEN_KEEPALIVE.} =
  if n <= 1: acc else: fact(n - 1, n * acc)


proc add*(a: int32, b: int32): int32 {.EMSCRIPTEN_KEEPALIVE.} =
  a + b


proc id*(n: int32): int32 {.EMSCRIPTEN_KEEPALIVE.} = n
