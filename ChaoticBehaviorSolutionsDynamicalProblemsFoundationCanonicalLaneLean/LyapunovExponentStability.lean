import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure LyapunovExponentStabilityPackage where
  phaseSpace : Type u
  dynamics : Type v
  lyapunovSpectrum : List ℝ
  contractiveDirections : Nat
  neutralDirections : Nat
  expansiveDirections : Nat
  exponentialConvergence : Prop
  exponentialDivergence : Prop

structure LyapunovExponentStabilityEvidence (L : LyapunovExponentStabilityPackage) where
  negativeLyapunovExponentsClosed : L.expansiveDirections = 0
  zeroLyapunovExponentsNeutralClosed : L.neutralDirections ≤ 1
  positiveLyapunovExponentsClosed : L.contractiveDirections = 0
  exponentialConvergenceClosed : L.exponentialConvergence
  exponentialDivergenceClosed : L.exponentialDivergence

def LyapunovExponentStabilityClosed (L : LyapunovExponentStabilityPackage) : Prop :=
  L.exponentialConvergence ∧ L.exponentialDivergence ∧ L.expansiveDirections = 0

theorem lyapunov_exponent_stability_closed_from_evidence
    (L : LyapunovExponentStabilityPackage) (E : LyapunovExponentStabilityEvidence L) :
    LyapunovExponentStabilityClosed L := by
  exact And.intro E.exponentialConvergenceClosed
    (And.intro E.exponentialDivergenceClosed E.negativeLyapunovExponentsClosed)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse
