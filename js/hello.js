'use strict';

var body = document.getElementsByTagName('body')[0];
var paragraph = document.createElement('p');
var textNode = document.createTextNode('Hello World!');
paragraph.appendChild(textNode);
body.appendChild(paragraph);
