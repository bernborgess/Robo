import Game.Metadata

import Game.Options.MathlibPart

set_option tactic.hygienic false

World "SetTheory"
Level 7

Title "Schnittmenge und Vereinigung"

Introduction
"
Die klassischen Mengenoperationen sind
Schnittmenge `∩` (`\\inter`), Vereinigung `∪` (`\\union`) und
Differenz `\\` (`\\\\`).

Die Taktik `simp` kann triviale Aussagen with Vereinigung mit der
leeren Menge vereinfachen.
"

open Set

/--  -/
Statement (A B : Set ℕ) : (A ∪ ∅) ∩ B = A ∩ (univ ∩ B) := by
  simp

NewTactic simp
LemmaTab "Set"
