@file:JvmName("Fizzy")

package us.yellosoft.fizzy

fun fizzbuzz(i: Int): String {
    val m: Boolean = i % 3 == 0
    val n: Boolean = i % 5 == 0

    if (m && n) {
        return "FizzBuzz"
    }

    if (m) {
        return "Fizz"
    }

    if (n) {
        return "Buzz"
    }

    return i.toString()
}

fun main() {
    for (n in 1..100) {
        println(fizzbuzz(n))
    }
}
