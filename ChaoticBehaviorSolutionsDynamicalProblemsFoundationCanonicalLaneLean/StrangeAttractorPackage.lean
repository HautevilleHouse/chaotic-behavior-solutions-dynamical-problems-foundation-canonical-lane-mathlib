import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure StrangeAttractorPackage where
  attractorExists : Prop
  fractalDimension : Prop
  horseshoeEmbedding : Prop
  asymptoticStability : Prop
  basinOfAttraction : Prop

structure StrangeAttractorEvidence (S : StrangeAttractorPackage) where
  attractorExistsClosed : S.attractorExists
  fractalDimensionClosed : S.fractalDimension
  horseshoeEmbeddingClosed : S.horseshoeEmbedding
  asymptoticStabilityClosed : S.asymptoticStability
  basinOfAttractionClosed : S.basinOfAttraction

def StrangeAttractorClosed (S : StrangeAttractorPackage) : Prop :=
  S.attractorExists ∧ S.fractalDimension ∧
  S.horseshoeEmbedding ∧ S.asymptoticStability ∧
  S.basinOfAttraction

theorem strange_attractor_closed_from_evidence (S : StrangeAttractorPackage)
    (E : StrangeAttractorEvidence S) : StrangeAttractorClosed S := by
  exact And.intro E.attractorExistsClosed
    (And.intro E.fractalDimensionClosed
      (And.intro E.horseshoeEmbeddingClosed
        (And.intro E.asymptoticStabilityClosed
          E.basinOfAttractionClosed)))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse