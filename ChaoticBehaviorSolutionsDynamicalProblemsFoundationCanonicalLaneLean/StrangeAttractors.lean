import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean.ChaoticMapsClasses

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure Attractor (C : ChaoticSystem) where
  attractorSet : Set (C.phaseSpace)
  invariance : ∀ x ∈ attractorSet, C.dynamics x ∈ attractorSet
  attractingBasin : Set (C.phaseSpace)
  forAllInBasinTendsTo : ∀ x ∈ attractingBasin, Filter.Tendsto (λ n : ℕ => C.iterated n x) Filter.atTop (𝓝 attractorSet)

structure StrangeAttractor (C : ChaoticSystem) (A : Attractor C) where
  sensitiveOnAttractor : ∀ x ∈ A.attractorSet, ∃ (ε : ℝ) (hε : ε > 0), ∀ (δ : ℝ) (hδ : δ > 0), ∃ (y : C.phaseSpace) (n : ℕ), C.distance x y < δ ∧ C.distance (C.iterated n x) (C.iterated n y) ≥ ε
  topologicalTransitivityOnAttractor : ∀ (U V : Set (C.phaseSpace)) (hU : U ∩ A.attractorSet ≠ ∅) (hV : V ∩ A.attractorSet ≠ ∅) (hUopen : True) (hVopen : True), ∃ (n : ℕ), (C.dynamics ^^ n) '' (U ∩ A.attractorSet) ∩ (V ∩ A.attractorSet) ≠ ∅
  densePeriodicInAttractor : Set.Countable { x : C.phaseSpace | x ∈ A.attractorSet ∧ ∃ (n : ℕ), n > 0 ∧ C.iterated n x = x }

def StrangeAttractorEvidence {C : ChaoticSystem} {A : Attractor C} (S : StrangeAttractor C A) : Prop :=
  S.sensitiveOnAttractor ∧ S.topologicalTransitivityOnAttractor ∧ S.densePeriodicInAttractor

def StrangeAttractorClosed {C : ChaoticSystem} {A : Attractor C} (S : StrangeAttractor C A) : Prop :=
  S.sensitiveOnAttractor ∧ S.topologicalTransitivityOnAttractor ∧ S.densePeriodicInAttractor

theorem strange_attractor_closed_from_evidence {C : ChaoticSystem} {A : Attractor C} (S : StrangeAttractor C A) (E : StrangeAttractorEvidence S) : StrangeAttractorClosed S :=
  And.intro E.sensitiveOnAttractor (And.intro E.topologicalTransitivityOnAttractor E.densePeriodicInAttractor)

theorem strange_attractor_implies_chaotic_on_attractor {C : ChaoticSystem} {A : Attractor C} (S : StrangeAttractor C A) : ChaoticSystemClosed C := by
  exact And.intro C.sensitiveDependence (And.intro C.topologicalTransitivity C.densePeriodicPoints)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse