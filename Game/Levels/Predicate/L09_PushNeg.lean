import Game.Metadata
import Game.Options.MathlibPart


import Game.ToBePorted

World "Predicate"
Level 9

Title "PushNeg"

Introduction
"
Nach langem Hin und Her einigen sie sich schließlich auf folgende Frage:
"

-- Zum Schluss, immer wenn man irgendwo eine Verneinung `¬∃` oder `¬∀` sieht (`\\not`), kann man
-- mit `push_neg` das `¬` durch den Quantor hindurchschieben.

-- Das braucht intern die Lemmas

-- - `not_exists (A : Prop) : ¬ (∃ x, A) ↔ ∀x, (¬A)`
-- - `not_forall (A : Prop) : ¬ (∀ x, A) ↔ ∃x, (¬A)`

-- (welche man auch mit `rw` explizit benutzen könnte.)

open Nat

Statement : ¬ ∃ (n : ℕ), ∀ (k : ℕ) , Odd (n + k) := by
  Hint "**Du**: Ich würde gern diese Negation `¬` am Quantor vorbeischieben.

  **Robo**: `push_neg` macht genau das!  Oder du könntest `rw` mit den folgenden Lemmas verwenden:

  ```
  not_exists (A : Prop) : ¬ (∃ x, A) ↔ ∀x, (¬A)
  not_forall (A : Prop) : ¬ (∀ x, A) ↔ ∃x, (¬A)
  ```
  "
  Branch
    unfold Odd
    push_neg
    Hint "**Robo**: Dieser Lösungsweg scheint mir etwas zu schwierig.
    Ich würde nochmal zurückgehen und schauen,
    dass du irgendwie `¬Odd` erhältst.
    Das kannst du dann mit `rw [←even_iff_not_odd]`
    zu `Even` umwandeln."
  push_neg
  intro n
  Hint "**Robo**: Jetzt brauchst du eine Zahl mit `use`, und danach vermutlich das Lemma `←even_iff_not_odd` brauchen.

  **Du**: Könnte ich jetzt schon `rw [←even_iff_not_odd]` anwenden?

  **Robo**: Nee, `rw` kann nicht innerhalb von Quantoren umschreiben.

  **Du**: Aber wie würde ich das machen?

  **Robo**: Zeig ich dir später, nicht hier vor großem Publikum.
  Ich würde jetzt lieber mit `use` eine richtige Zahl angeben, und danach umschreiben."
  Branch
    use n + 2
    Hint "**Robo**: Gute Wahl! Jetzt kannst du `←even_iff_not_odd` verwenden."
  Branch
    use n + 4
    Hint "**Robo**: Gute Wahl! Jetzt kannst du `←even_iff_not_odd` verwenden."
  use n
  Hint "**Robo**: Gute Wahl! Jetzt kannst du `←even_iff_not_odd` verwenden."
  rw [←even_iff_not_odd]
  -- TODO: if I write `tauto` here, I get a weird error
  unfold Even
  use n
  --ring

NewTactic push_neg
NewLemma Nat.even_iff_not_odd Nat.odd_iff_not_even not_exists not_forall

Conclusion "Die Formalosophinnen sind ganz begeistert.
Nachdem sich der Beifall gelegt hat, hast du auch einmal eine Frage.

**Du**: Kann uns hier irgendjemand vielleicht ein bisschen Orientierung im Formaloversum geben?

**Alle**:  Ja, ja.

**Du**:  Wer denn?

Die Frage war wieder zu konkret.  Betretenes Schweigen.

"
