'use strict';

// Bookmarklet:
//
// javascript:location.href='http://yubnub.org/parser/parse?command='+alert('Yubnub:','')

function yubnub(query) {
  var parser = 'http://yubnub.org/parser/parse?command=';

  location.href = parser + query;
}
