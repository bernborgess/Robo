import Game.Metadata


World "Function2"
Level 26

Title "Diagonal"

Introduction
"
In this level, you will prove that the the diagonal function is injective.
"

open Function Nat

Statement diag_injective {A : Type*} (n : ℕ) :
    let diag : A → Fin (n + 1) → A := fun a _ ↦ a
    Injective (diag) := by
  Branch
    apply HasLeftInverse.injective
    let p : (Fin (n + 1) → A) → A := fun v ↦ v (Fin.last n)
    use p
    tauto
  intro a₁ a₂ h
  apply congr_fun h 0
