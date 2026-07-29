import ChaoticBehaviorSolutionsDynamicalProblemsFoundation.PhaseSpace

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundation

structure LyapunovExponentPackage (P : PhaseSpacePackage) where
  trajectory : P.Point → ℝ → P.Point
  linearization : P.Point → ℝ → (P.Tangent → P.Tangent)
  exponentDefined : Prop
  exponentPositive : Prop

def LyapunovExponentClosed {P : PhaseSpacePackage} (L : LyapunovExponentPackage P) : Prop :=
  L.exponentDefined ∧ L.exponentPositive

structure LyapunovExponentEvidence {P : PhaseSpacePackage} (L : LyapunovExponentPackage P) where
  exponentDefinedClosed : L.exponentDefined
  exponentPositiveClosed : L.exponentPositive

theorem lyapunov_exponent_closed_from_evidence
    {P : PhaseSpacePackage} (L : LyapunovExponentPackage P) (E : LyapunovExponentEvidence L) :
    LyapunovExponentClosed L := by
  exact And.intro E.exponentDefinedClosed E.exponentPositiveClosed

end ChaoticBehaviorSolutionsDynamicalProblemsFoundation
end HautevilleHouse