#!/usr/bin/env gst

[
	Transcript show: 'Throwing yawp'; cr.
	self error: 'Yawp!'.
] on: Error do: [ :e |
	Transcript show: 'Caught yawp'; cr.
].