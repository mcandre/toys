package us.yellosoft.cat

object Cat {
  case class Cat(name : String, weight : Double, owner : String)

  def catapult(c : Option[Cat]) : String = c match {
    case None => "Nothing happened."
    case option => s"Pull!\n${option.get.name} says 'Meow!'"
  }

  def main(args : Array[String]) : Unit = {
    val odie = None : Option[Cat]
    val c1 = Cat("Whiskers", 8.0, "Prof. Boring")
    val c2 = Cat("Garfield", 11.5, "Jon Arbuckle")
    val c3 = Cat("Galeanthrope", 7.0, "Nero")

    println(s"Odie = $odie")
    println(s"C1 = $c1")
    println(s"C2 = $c2")
    println(s"C3 = $c3")

    println("Catapulting Odie...")
    println(catapult(odie))

    println(s"Catapulting ${c1.name}...")
    println(catapult(Some(c1)))

    println(s"Catapulting ${c2.name}...")
    println(catapult(Some(c2)))

    println(s"Catapulting ${c3.name}...")
    println(catapult(Some(c3)))
  }
}
