import ChaoticBehaviorSolutionsDynamicalProblemsFoundation.LyapunovExponents

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundation

structure TopologicalEntropyPackage {P : PhaseSpacePackage} where
  openCoverEntropy : P.Point → ℝ
  entropyDefined : Prop
  entropyPositive : Prop
  variationalPrinciple : Prop
  entropyDefinedClosed : entropyDefined
  entropyPositiveClosed : entropyPositive
  variationalPrincipleClosed : variationalPrinciple

def TopologicalEntropyClosed {P : PhaseSpacePackage} (E : TopologicalEntropyPackage P) : Prop :=
  E.entropyDefined ∧ E.entropyPositive ∧ E.variationalPrinciple

structure TopologicalEntropyEvidence {P : PhaseSpacePackage} (E : TopologicalEntropyPackage P) where
  entropyDefinedClosed : E.entropyDefined
  entropyPositiveClosed : E.entropyPositive
  variationalPrincipleClosed : E.variationalPrinciple

theorem topological_entropy_closed_from_evidence
    {P : PhaseSpacePackage} (E : TopologicalEntropyPackage P) (Ev : TopologicalEntropyEvidence E) :
    TopologicalEntropyClosed E := by
  exact And.intro Ev.entropyDefinedClosed (And.intro Ev.entropyPositiveClosed Ev.variationalPrincipleClosed)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundation
end HautevilleHouse