// Bookmarklet:
//
// javascript:location.href="http://yubnub.org/parser/parse?command="+prompt("Yubnub:","")

function yubnub(command) {
  var parser = "http://yubnub.org/parser/parse?command=";

  var query = prompt("Yubnub:", "");

  location.href = parser + query;
}
