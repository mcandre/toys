(*
    An explicit proof of Peirce's Law
    Andrew Pennebaker
    2 Nov 2011

    Example:

    coqtop -l peirce.v
*)

Require Import Classical.

Lemma peirces_law : forall (p q : Prop), ((p -> q) -> p) -> p.

Proof.
intros.
apply imply_to_or in H.
elim H.
    intros.
    apply not_imply_elim in H0.
    assumption.

    intros.
    assumption.
Qed.
