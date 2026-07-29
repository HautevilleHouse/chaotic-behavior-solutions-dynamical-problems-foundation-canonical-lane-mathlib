import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure LyapunovExponentPackage where
  system : Type u → Type v
  orbit : ℕ → Point
  tangentMap : Point → LinearMap
  lyapunovExponent : ℝ
  positiveExponent : lyapunovExponent > 0
  orbitSeparation : Prop
  exponentialDivergence : Prop
  consistentDefinition : Prop

structure LyapunovExponentEvidence (L : LyapunovExponentPackage) where
  positiveExponentClosed : L.positiveExponent
  orbitSeparationClosed : L.orbitSeparation
  exponentialDivergenceClosed : L.exponentialDivergence
  consistentDefinitionClosed : L.consistentDefinition

def LyapunovExponentClosed (L : LyapunovExponentPackage) : Prop :=
  L.positiveExponent ∧ L.orbitSeparation ∧ L.exponentialDivergence ∧ L.consistentDefinition

theorem lyapunov_exponent_closed_from_evidence (L : LyapunovExponentPackage)
    (E : LyapunovExponentEvidence L) : LyapunovExponentClosed L :=
  And.intro E.positiveExponentClosed
    (And.intro E.orbitSeparationClosed
      (And.intro E.exponentialDivergenceClosed E.consistentDefinitionClosed))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse