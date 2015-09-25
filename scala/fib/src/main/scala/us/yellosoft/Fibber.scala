package us.yellosoft.fib

object Fibber {
  def fib(n : Int) : Int = n match {
    case 1 => 1
    case 2 => 1
    case _ => fib(n - 1) + fib(n - 2)
  }

  def main(args : Array[String]) : Unit = (1 to 20).par.map(fib).seq.foreach(println)
}
