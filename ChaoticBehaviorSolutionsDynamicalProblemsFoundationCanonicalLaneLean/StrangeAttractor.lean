import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure StrangeAttractorPackage where
  phaseSpace : Type u
  dynamics : Type v
  attractorSet : Set phaseSpace
  fractalDimension : ℝ
  sensitiveDependence : Prop
  denseOrbits : Prop
  topologicalTransitivity : Prop

structure StrangeAttractorEvidence (S : StrangeAttractorPackage) where
  attractorInvariantClosed : S.attractorSet ∈ S.dynamics
  fractalDimensionPositiveClosed : S.fractalDimension > 0
  sensitiveDependenceClosed : S.sensitiveDependence
  denseOrbitsClosed : S.denseOrbits
  topologicalTransitivityClosed : S.topologicalTransitivity

def StrangeAttractorClosed (S : StrangeAttractorPackage) : Prop :=
  S.sensitiveDependence ∧ S.denseOrbits ∧ S.topologicalTransitivity ∧ S.fractalDimension > 0

theorem strange_attractor_closed_from_evidence
    (S : StrangeAttractorPackage) (E : StrangeAttractorEvidence S) :
    StrangeAttractorClosed S := by
  exact And.intro E.sensitiveDependenceClosed
    (And.intro E.denseOrbitsClosed
      (And.intro E.topologicalTransitivityClosed E.fractalDimensionPositiveClosed))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse
