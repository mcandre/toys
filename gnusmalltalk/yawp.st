"exec" "gst" "-f" "$0" "$0" "$@"

[
    Transcript show: 'Throwing yawp'; cr.
    self error: 'Yawp!'.
] on: Error do: [ :e |
    Transcript show: 'Caught yawp'; cr.
].
