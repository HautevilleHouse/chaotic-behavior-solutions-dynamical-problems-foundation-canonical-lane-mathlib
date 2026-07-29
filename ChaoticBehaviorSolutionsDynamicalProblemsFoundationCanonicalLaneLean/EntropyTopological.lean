import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean.ChaoticMapsClasses

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure TopologicalEntropy (C : ChaoticSystem) where
  entropyValue : ℝ
  nonnegative : entropyValue ≥ 0
  characterizesChaos : entropyValue > 0 ↔ ChaoticSystemClosed C

def TopologicalEntropyEvidence {C : ChaoticSystem} (H : TopologicalEntropy C) : Prop :=
  H.nonnegative ∧ (H.characterizesChaos.1 (by
    intro hpos
    exact H.characterizesChaos.2 hpos
  ))

def TopologicalEntropyClosed {C : ChaoticSystem} (H : TopologicalEntropy C) : Prop :=
  H.nonnegative ∧ (H.entropyValue > 0 ↔ ChaoticSystemClosed C)

theorem topological_entropy_closed_from_evidence {C : ChaoticSystem} (H : TopologicalEntropy C) (E : TopologicalEntropyEvidence H) : TopologicalEntropyClosed H :=
  And.intro H.nonnegative H.characterizesChaos

theorem positive_entropy_implies_chaos {C : ChaoticSystem} (H : TopologicalEntropy C) (hpos : H.entropyValue > 0) : ChaoticSystemClosed C :=
  (H.characterizesChaos.mp hpos)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse