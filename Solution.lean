/-
Copyright (c) 2026 Dan Clemens Posch. All rights reserved.
Released under the Apache License, Version 2.0; see LICENSE.
Authors: Dan Clemens Posch
-/
import KakeyaFiniteFields

/-!
# Proved solution

Comparator matches the identically named declarations in `Challenge.lean`.
`IsKakeyaSet` is repeated verbatim from the Challenge (and from
`KakeyaFiniteFields.IsKakeyaSet`). The bound is Dvir’s theorem as proved in
`math-inc/KakeyaFiniteFields`.
-/

namespace Kakeya

def IsKakeyaSet {F : Type*} {n : ℕ} [Semiring F]
    (K : Set (Fin n → F)) : Prop :=
  ∀ d, ∃ b, { b + t • d | t : F } ⊆ K

theorem kakeya_set_bound (n : ℕ) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (F : Type*) [Field F] [Fintype F] (K : Set (Fin n → F)),
        IsKakeyaSet K → Nat.card K ≥ C * Fintype.card F ^ n := by
  simpa [IsKakeyaSet, KakeyaFiniteFields.IsKakeyaSet] using
    KakeyaFiniteFields.kakeya_set_bound n

end Kakeya
