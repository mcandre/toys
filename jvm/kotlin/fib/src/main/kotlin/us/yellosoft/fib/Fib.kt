@file:JvmName("Fib")

package us.yellosoft.fib

import java.util.Optional

fun fib(n: Int): Optional<Int> {
    if (n < 0) {
        return Optional.empty()
    }

    if (n < 2) {
        return Optional.of(n)
    }

    var a: Int = 0
    var b: Int = 1
    val m: Int = n - 1

    for (i in 1..m) {
        val c: Int = a;
        a = b;
        b = c + b;
    }

    return Optional.of(b)
}

fun main() {
    println(fib(10))
}
