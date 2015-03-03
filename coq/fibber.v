Inductive nat : Set :=
| O : nat
| S : nat -> nat.

Fixpoint plus (n m : nat) : nat :=
match n with
| O => m
| S n' => S (plus n' m)
end.

Definition zero : nat := O.
Definition one : nat := S O.
Definition two : nat := S (S O).

Fixpoint fibber (n : nat) : nat :=
match n with
| O => O
| S n' => match n' with
  | O => S O
  | S m' => plus (fibber n') (fibber m')
  end
end.
