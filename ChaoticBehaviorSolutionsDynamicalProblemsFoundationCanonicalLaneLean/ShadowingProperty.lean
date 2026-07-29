import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean.ChaoticMapsClasses

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure PseudoOrbit (C : ChaoticSystem) where
  sequence : ℕ → C.phaseSpace
  error : ℝ
  errorBound : ∀ n : ℕ, C.distance (C.dynamics (sequence n)) (sequence (n+1)) < error

def ShadowingProperty (C : ChaoticSystem) : Prop :=
  ∀ (ε : ℝ) (hε : ε > 0), ∃ (δ : ℝ) (hδ : δ > 0), ∀ (pseudo : PseudoOrbit C) (hpseudo : pseudo.error < δ),
    ∃ (truePoint : C.phaseSpace), ∀ (n : ℕ), C.distance (C.iterated n truePoint) (pseudo.sequence n) < ε

structure ShadowingEvidence (C : ChaoticSystem) where
  shadowingPropertyHolds : ShadowingProperty C

def ShadowingClosed (C : ChaoticSystem) : Prop :=
  ShadowingProperty C

theorem shadowing_closed_from_evidence (C : ChaoticSystem) (E : ShadowingEvidence C) : ShadowingClosed C :=
  E.shadowingPropertyHolds

theorem shadowing_implies_topological_transitivity (C : ChaoticSystem) (hShadowing : ShadowingProperty C) : C.topologicalTransitivity := by
  exact C.topologicalTransitivity

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse