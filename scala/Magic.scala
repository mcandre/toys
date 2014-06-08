#!/usr/bin/env scala

object Magic {
  val NUMBERS = List(
    0xbd, 0x88, 0x56, 0x63,
    0xc5, 0x56, 0x41, 0xd8,
    0x5b, 0xe3, 0x74, 0x9d,
    0x02, 0x11, 0xf9, 0x09
  )

  def magic : String = {
    def magicN(n : Int) : String = n match {
      case 3 => " " * 17 + "[ redacted ]"
      case _ => {
        var pieces = ""

        ((NUMBERS.head + n) :: NUMBERS.tail).reverse.map((byte : Int) => String.format("%02x", new Integer(byte))).foreach { piece => pieces += piece + " " }

        pieces
      }
    }

    var lines = ""

    (0 to 6).map(magicN).foreach { line => lines += line + "\n" }

    lines
  }

  def main(args : Array[String]) : Unit = printf(magic)
}
