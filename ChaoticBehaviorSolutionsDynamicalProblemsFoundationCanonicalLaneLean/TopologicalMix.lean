import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure TopologicalMixPackage where
  phaseSpace : Type u
  dynamics : phaseSpace → phaseSpace
  mixingProperty : Prop
  mixingPair : Set (phaseSpace × phaseSpace)
  pairIntersects : Prop
  iteratesMix : Prop
  topologicallyMixing : Prop

structure TopologicalMixEvidence (M : TopologicalMixPackage) where
  mixingPropertyClosed : M.mixingProperty
  pairIntersectsClosed : M.pairIntersects
  iteratesMixClosed : M.iteratesMix
  topologicallyMixingClosed : M.topologicallyMixing

def TopologicalMixClosed (M : TopologicalMixPackage) : Prop :=
  M.mixingProperty ∧ M.pairIntersects ∧ M.iteratesMix ∧ M.topologicallyMixing

theorem topological_mix_closed_from_evidence (M : TopologicalMixPackage)
    (E : TopologicalMixEvidence M) : TopologicalMixClosed M :=
  And.intro E.mixingPropertyClosed
    (And.intro E.pairIntersectsClosed
      (And.intro E.iteratesMixClosed E.topologicallyMixingClosed))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse