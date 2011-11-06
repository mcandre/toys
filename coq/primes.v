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