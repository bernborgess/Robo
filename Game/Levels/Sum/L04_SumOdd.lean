import Game.Metadata

import Game.ToBePorted
import Game.Options.MathlibPart

import Game.Levels.Sum.L03_ArithSum

World "Sum"
Level 4

Title "Summe aller ungeraden Zahlen"

Introduction
"
**Du**: Haben eigentlich alle Türme hier so kryptische Beschreibungen am Eingang?

Du gehst zu einem etwas kleineren Nachbarsturm.
"
set_option tactic.hygienic false

open Fin

open BigOperators

/-- $\\sum_{i = 0}^n (2n + 1) = n ^ 2$. -/
Statement (n : ℕ) : (∑ i : Fin n, (2 * (i : ℕ) + 1)) = n ^ 2 := by
  Hint "**Robo**: Das funktioniert genau gleich wie zuvor, viel Glück."
  induction n
  simp
  Hint (hidden := true) "Den Induktionschritt mit Summen willst du
  eigentlich immer mit `rw [sum_univ_castSuccEmb]` beginnen."
  rw [sum_univ_castSuccEmb]
  simp
  rw [n_ih]
  --rw [Nat.succ_eq_add_one]
  ring

LemmaTab "Sum"
