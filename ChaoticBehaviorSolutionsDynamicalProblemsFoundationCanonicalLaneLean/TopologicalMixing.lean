import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure TopologicalMixingPackage where
  phaseSpace : Type u
  dynamics : Type v
  nonWanderingSet : Set phaseSpace
  topologicalMixingProperty : Prop
  chainRecurrence : Prop
  shadowingProperty : Prop

structure TopologicalMixingEvidence (M : TopologicalMixingPackage) where
  nonWanderingSetDenseClosed : Dense M.nonWanderingSet
  topologicalMixingPropertyClosed : M.topologicalMixingProperty
  chainRecurrenceClosed : M.chainRecurrence
  shadowingPropertyClosed : M.shadowingProperty

def TopologicalMixingClosed (M : TopologicalMixingPackage) : Prop :=
  M.topologicalMixingProperty ∧ M.chainRecurrence ∧ M.shadowingProperty

theorem topological_mixing_closed_from_evidence
    (M : TopologicalMixingPackage) (E : TopologicalMixingEvidence M) :
    TopologicalMixingClosed M := by
  exact And.intro E.topologicalMixingPropertyClosed
    (And.intro E.chainRecurrenceClosed E.shadowingPropertyClosed)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse
