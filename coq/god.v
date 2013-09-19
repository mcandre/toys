(*
	Epicurus - Problem of Evil
	Andrew Pennebaker
	30 Jan 2012

	Example:

	coqtop -l god.v
*)



Variables God Omniscience Omnipotence Omnibenevolence Evil : Prop.

Hypothesis ideology : God -> (Omniscience \/ Omnipotence \/ Omnibenevolence).

Hypothesis reality : Evil.

Hypothesis impotence : (Evil /\ Omniscience /\ Omnibenevolence) -> ~Omnipotence.

Hypothesis ignorance : (Evil /\ Omnipotence /\ Omnibenevolence) -> ~Omniscience.

Hypothesis wickedness : (Evil /\ Omniscience /\ Omnipotence) -> ~Omnibenevolence.

Lemma godless : ~God.

Proof.
intros.
NNPP.