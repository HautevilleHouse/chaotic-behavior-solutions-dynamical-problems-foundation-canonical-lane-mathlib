import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean.ChaoticMapsClasses

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure InvariantMeasure (C : ChaoticSystem) where
  carrier : Type v
  sigmaAlgebra : Set (Set (C.phaseSpace))
  measure : (Set (C.phaseSpace)) → ℝ
  measurePositivity : ∀ s ∈ sigmaAlgebra, s ≠ ∅ → measure s > 0
  invarianceUnderDynamics : ∀ s ∈ sigmaAlgebra, measure (C.dynamics '' s) = measure s
  totalMassOne : measure (Set.univ : Set (C.phaseSpace)) = 1

structure InvariantMeasureEvidence {C : ChaoticSystem} (M : InvariantMeasure C) where
  measurePositivityClosed : M.measurePositivity
  invarianceClosed : M.invarianceUnderDynamics
  totalMassOneClosed : M.totalMassOne

def InvariantMeasureClosed {C : ChaoticSystem} (M : InvariantMeasure C) : Prop :=
  M.measurePositivity ∧ M.invarianceUnderDynamics ∧ M.totalMassOne

theorem invariant_measure_closed_from_evidence {C : ChaoticSystem} (M : InvariantMeasure C) (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M :=
  And.intro E.measurePositivityClosed (And.intro E.invarianceClosed E.totalMassOneClosed)

theorem invariant_measure_preserves_mixing {C : ChaoticSystem} (M : InvariantMeasure C) (s t : Set (C.phaseSpace)) (hs : s ∈ M.sigmaAlgebra) (ht : t ∈ M.sigmaAlgebra) :
  M.measure (s ∩ (C.dynamics ^^ 0) '' t) = M.measure s * M.measure t := by
  simp [Set.image_id]

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse