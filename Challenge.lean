/-
Copyright (c) 2026 Dan Clemens Posch. All rights reserved.
Released under the Apache License, Version 2.0; see LICENSE.
Authors: Dan Clemens Posch
-/
import Mathlib

/-!
# Finite-field Kakeya sets (Dvir)

A Kakeya set in \(\mathbb{F}_q^n\) is a set containing a line in every
direction. Dvir proved that any such set has cardinality at least
\(C_n\cdot q^n\) for a positive constant \(C_n\) depending only on the
dimension \(n\).

This file is the Palomar statement surface. It imports only Mathlib.
The compared theorem is discharged in `Solution.lean` from
`KakeyaFiniteFields.kakeya_set_bound` in
[math-inc/KakeyaFiniteFields](https://github.com/math-inc/KakeyaFiniteFields)
(commit `3f514e300d49578bee607917e7214988bd8d71b4`), which formalizes
Dvir’s polynomial method.

* Zeev Dvir, *On the size of Kakeya sets in finite fields*,
  J. Amer. Math. Soc. 22 (2009), 1093–1097,
  [doi:10.1090/S0894-0347-08-00607-3](https://doi.org/10.1090/S0894-0347-08-00607-3),
  [arXiv:0803.2336](https://arxiv.org/abs/0803.2336).
-/

namespace Kakeya

/-- A set `K ⊆ Fⁿ` is a Kakeya set if it contains an affine line in every
direction: for every `d : Fin n → F` there is a basepoint `b` such that
`{ b + t • d | t : F } ⊆ K`.

When `d = 0` this only asks that `K` be nonempty. A set containing a line
in some nonzero direction is automatically nonempty, so over a field this
matches the usual “line in every direction” definition (nonzero directions,
equivalently projective directions). -/
def IsKakeyaSet {F : Type*} {n : ℕ} [Semiring F]
    (K : Set (Fin n → F)) : Prop :=
  ∀ d, ∃ b, { b + t • d | t : F } ⊆ K

/-- **Dvir’s finite-field Kakeya theorem.** For each dimension `n` there is a
positive constant `C` such that every Kakeya set `K ⊆ Fⁿ`, with `F` a finite
field of cardinality `q`, satisfies `|K| ≥ C * qⁿ`.

The constant may depend on `n` but not on `F`. The compared statement is
existential in `C`; the underlying proof supplies the explicit value
`C = 1 / n!` and the stronger binomial bound
`|K| ≥ Nat.choose (q + n - 1) n`. -/
theorem kakeya_set_bound (n : ℕ) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (F : Type*) [Field F] [Fintype F] (K : Set (Fin n → F)),
        IsKakeyaSet K → Nat.card K ≥ C * Fintype.card F ^ n := by
  sorry

end Kakeya
