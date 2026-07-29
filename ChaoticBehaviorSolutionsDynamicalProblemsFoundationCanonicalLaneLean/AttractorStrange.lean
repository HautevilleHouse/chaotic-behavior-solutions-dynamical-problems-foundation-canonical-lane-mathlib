import ChaoticBehaviorSolutionsDynamicalProblemsFoundation.LyapunovExponents

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundation

structure StrangeAttractorPackage {P : PhaseSpacePackage} (L : LyapunovExponentPackage P) where
  attractorSet : Set P.Point
  invarianceUnderFlow : Prop
  sensitiveDependence : Prop
  topologicalTransitivity : Prop
  attractorSetClosed : attractorSet
  invarianceUnderFlowClosed : invarianceUnderFlow
  sensitiveDependenceClosed : sensitiveDependence
  topologicalTransitivityClosed : topologicalTransitivity

def StrangeAttractorClosed {P : PhaseSpacePackage} {L : LyapunovExponentPackage P} (S : StrangeAttractorPackage L) : Prop :=
  S.invarianceUnderFlow ∧ S.sensitiveDependence ∧ S.topologicalTransitivity

structure StrangeAttractorEvidence {P : PhaseSpacePackage} {L : LyapunovExponentPackage P} (S : StrangeAttractorPackage L) where
  invarianceUnderFlowClosed : S.invarianceUnderFlow
  sensitiveDependenceClosed : S.sensitiveDependence
  topologicalTransitivityClosed : S.topologicalTransitivity

theorem strange_attractor_closed_from_evidence
    {P : PhaseSpacePackage} {L : LyapunovExponentPackage P}
    (S : StrangeAttractorPackage L) (E : StrangeAttractorEvidence S) :
    StrangeAttractorClosed S := by
  exact And.intro E.invarianceUnderFlowClosed
    (And.intro E.sensitiveDependenceClosed E.topologicalTransitivityClosed)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundation
end HautevilleHouse