import Game.Metadata
import Game.Levels.SetTheory.L03_Subset



set_option tactic.hygienic false

World "SetTheory"
Level 4

Title "Teilmengen"

Introduction
"
Etwas weiter kommt ihr an einem kleinen Gemüsestand vorbei. Da ihr nicht so
richtig einen Plan habt, fragt ihr den Verkäufer.

**Verkäufer**: Hier ist was ganz wichtiges, was ihr noch oft brauchen werdet:
Ein zentrales Lemma ist `Subset.antisymm_iff` welches folgendes sagt:

```
lemma antisymm_iff {α : Type} {A B : Set α} : A = B ↔ A ⊆ B ∧ B ⊆ A
```

Fast immer wenn man Gleichheiten von Mengen zeigen muss, will man diese in zwei Ungleichungen
aufteilen.
"

open Set Subset

Statement Set.subset_empty_iff {A : Type _} (s : Set A) :
    s ⊆ ∅ ↔ s = ∅ := by
  Hint "**Du**: Ja, die einzige Teilmenge der leeren Menge ist die leere Menge.
  Das ist doch eine Tautologie?

  **Robo**: Ja schon, aber zuerst einmal explizit."
  Hint (hidden := true) "**Robo**: Fang doch einmal mit `constructor` an."
  constructor
  intro h
  Hint "**Robo**: Gleichheit zwischen Mengen kann man zum Beispiel zeigen,
  indem man `A ⊆ B` und `B ⊆ A` zeigt.

  Dieser Schritt ist `apply Subset.antisymm`"
  apply Subset.antisymm
  assumption
  Hint "**Robo**: Hier ist das Lemma `empty_subset` hilfreich."
  apply empty_subset
  intro h
  rw [h]

DisabledTactic tauto
NewTheorem Set.Subset.antisymm Set.Subset.antisymm_iff Set.empty_subset
LemmaTab "Set"
