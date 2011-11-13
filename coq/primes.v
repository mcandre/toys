Inductive nat : Set :=
| O : nat
| S : nat -> nat.

Fixpoint plus (n m : nat) : nat :=
match n with
| O => m
| S n' => S (plus n' m)
end.

Fixpoint mult (n m : nat) : nat :=
match n with
| O => O
| S n' => plus m (mult n' m)
end.

Definition zero : nat := O.
Definition one : nat := S zero.
Definition two : nat := S one.
Definition three : nat := S two.
Definition four : nat := S three.
Definition five : nat := S four.
Definition six : nat := S five.
Definition seven : nat := S six.
Definition eight : nat := S seven.
Definition nine : nat := S eight.
Definition ten : nat := S nine.

Definition divides (n m : nat) : Prop := exists q : nat, m = mult n q.

divides four two.

Fixpoint lte (n m : nat) : Prop :=
match n with
| O => True
| S n' => match m with
	| O => False
	| S m' => lte n' m'
	end
end.

Fixpoint gt (n m : nat) : Prop :=
match n with
| O => False
| S n' => match m with
	| O => True
	| S m' => gt n' m'
	end
end.

Definition prime (n : nat) : Prop := gt n one /\ (forall (q : nat), divides q n -> n = one \/ divides q n -> n = n).

Eval simpl in (prime O).

Fixpoint factorial (n : nat) : nat :=
match n with
| O => S O
| S O => S O
| S n' => mult n (factorial n')
end.

Fixpoint facprime (n : nat) : nat := S (factorial n).

(*
Use facprime to prove infinite primes
...
*)