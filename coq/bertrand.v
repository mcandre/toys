(*
	Bertrand Russel's conjecture
	Andrew Pennebaker
	2 Nov 2011

	Example:

	coqtop -l bertrand.v
*)

Inductive nat : Set :=
| O : nat
| S : nat -> nat.

Fixpoint plus (n m : nat) : nat :=
match n with
| O => m
| S n' => S (plus n' m)
end.

Definition one : nat := S O.
Definition two : nat := S (S O).

Lemma bertrand : plus one one = two.

(* From this proposition it will follow,
when arithmetical addition has been defined,
that 1+1=2. *)

Proof.
intros.
reflexivity.
Qed.

(* The above proposition is occasionally useful. *)
