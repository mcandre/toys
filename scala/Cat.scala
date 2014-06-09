#!/usr/bin/env scala

object Cat {
  class Cat(
    val name : String,
    val weight : Double,
    val owner : String
  ) {
    override def toString : String = "Cat(" + name + ", " + weight + ", " + owner + ")"
  }

  def catapult(c : Option[Cat]) : String = c match {
    case None => "Nothing happened."
    case _ => "Pull!\n" ++ c.get.name + " says 'Meow!'"
  }

  def main(args : Array[String]) : Unit = {
    val odie = None : Option[Cat]
    val c1 = new Cat("Whiskers", 8.0, "Prof. Boring")
    val c2 = new Cat("Garfield", 11.5, "Jon Arbuckle")
    val c3 = new Cat("Galeanthrope", 7.0, "Nero")

    println("Odie = " + odie)
    println("C1 = " + c1)
    println("C2 = " + c2)
    println("C3 = " + c3)

    println("Catapulting Odie...")
    println(catapult(odie))

    println("Catapulting " + c1.name + "...")
    println(catapult(Some(c1)))

    println("Catapulting " + c2.name + "...")
    println(catapult(Some(c2)))

    println("Catapulting " + c3.name + "...")
    println(catapult(Some(c3)))
  }
}
