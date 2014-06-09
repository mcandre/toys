class Book(val title : String, val quantity : Int) {
  override def toString : String = title + " (" + quantity + "x)"
}
