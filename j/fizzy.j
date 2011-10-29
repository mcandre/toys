#!/usr/bin/env jconsole

div3 =: 0 = 3 & |

div5 =: 0 = 5 & |

div35 =: div3 *. div5

fizzy =: 3 : 0
if. 1 & = do. 'One!'
elseif. 2 & = do. 'Two!'
elseif. 3 & = do. 'Three!'
elseif. 1 do. '?'
end.
)

fizzy 1

NB. > 'd' (8!:0)/ 1 +/ i. 100

exit ''