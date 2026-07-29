import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure ChaoticSystem where
  phaseSpace : Type u
  dynamics : phaseSpace → phaseSpace
  iterated : ℕ → phaseSpace → phaseSpace
  sensitiveDependence : Prop
  topologicalTransitivity : Prop
  densePeriodicPoints : Prop
  chaotic : Prop

structure ChaoticSystemEvidence (C : ChaoticSystem) where
  sensitiveDependenceClosed : C.sensitiveDependence
  topologicalTransitivityClosed : C.topologicalTransitivity
  densePeriodicPointsClosed : C.densePeriodicPoints
  chaoticClosed : C.chaotic

def ChaoticSystemClosed (C : ChaoticSystem) : Prop :=
  C.sensitiveDependence ∧ C.topologicalTransitivity ∧ C.densePeriodicPoints ∧ C.chaotic

theorem chaotic_system_closed_from_evidence (C : ChaoticSystem) (E : ChaoticSystemEvidence C) : ChaoticSystemClosed C :=
  And.intro E.sensitiveDependenceClosed
    (And.intro E.topologicalTransitivityClosed
      (And.intro E.densePeriodicPointsClosed E.chaoticClosed))

def orbit (C : ChaoticSystem) (x : C.phaseSpace) : Set (C.phaseSpace) :=
  Set.range (C.iterated · x)

theorem orbit_nonempty (C : ChaoticSystem) (x : C.phaseSpace) : orbit C x ≠ ∅ := by
  intro h
  apply Set.not_nonempty_iff_eq_empty.mp h
  exact ⟨C.iterated 0 x, by simp [orbit]⟩

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse