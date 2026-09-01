# Finite-field Kakeya (Dvir)

Palomar thin wrapper around
[math-inc/KakeyaFiniteFields](https://github.com/math-inc/KakeyaFiniteFields),
a Lean 4 formalization of Dvir’s theorem that a Kakeya set
\(K\subseteq\mathbb{F}_q^n\) has size at least \(C_n\cdot q^n\).

The compared declaration is `Kakeya.kakeya_set_bound`. The proof is
discharged from `KakeyaFiniteFields.kakeya_set_bound` at commit
`3f514e300d49578bee607917e7214988bd8d71b4`.

This is a Palomar project. Submissions go to
<https://submit.palomar-registry.org/>.

## Statement

A set \(K\subseteq F^n\) is a Kakeya set if it contains an affine line in
every direction. Dvir (J. Amer. Math. Soc. 22 (2009), 1093–1097;
[arXiv:0803.2336](https://arxiv.org/abs/0803.2336)) proved that
\(|K|\ge C_n\cdot q^n\) with \(C_n>0\) depending only on \(n\).

## Repository map

- `Challenge.lean` — Mathlib-only statement surface (`IsKakeyaSet` and
  `kakeya_set_bound`, one `sorry`).
- `Solution.lean` — the same declarations, proved from
  `KakeyaFiniteFields`.
- `comparator.json`, `formalization.yaml` — Palomar metadata.
- Upstream: <https://github.com/math-inc/KakeyaFiniteFields>

## Verify

```sh
lake exe cache get
lake build Challenge Solution
```

Lean `v4.26.0-rc2`, matching the upstream toolchain. Mathlib and
`KakeyaFiniteFields` are pinned by full commit SHA in `lakefile.toml`.
Forbidden: `native_decide`, `Lean.ofReduceBool`. Permitted axioms:
`propext`, `Classical.choice`, `Quot.sound`.

## Credit

The substantive formalization is Math Inc’s, produced by the Gauss
autoformalization agent from a LaTeX blueprint. This wrapper only
exposes the headline theorem to Palomar Comparator.
