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

Definition one : nat := S O.
Definition two : nat := S(S O).

Fixpoint minus (n m : nat) : nat :=
match n, m with
| O, _ => O
| S _, O => n
| S n', S m' => minus n' m'
end.

Fixpoint fib (n : nat) : nat :=
match n with
| O => O
| one => one
| _ => plus (fib (minus n one)) (fib (minus n two))
end.