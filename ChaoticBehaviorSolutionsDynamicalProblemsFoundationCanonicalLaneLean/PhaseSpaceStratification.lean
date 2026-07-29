import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure PhaseSpaceStratificationPackage where
  compactInvariantSet : Prop
  horseshoeEmbedding : Prop
  transverseHomoclinic : Prop
  symbolicDynamics : Prop

structure PhaseSpaceStratificationEvidence (P : PhaseSpaceStratificationPackage) where
  compactInvariantSetClosed : P.compactInvariantSet
  horseshoeEmbeddingClosed : P.horseshoeEmbedding
  transverseHomoclinicClosed : P.transverseHomoclinic
  symbolicDynamicsClosed : P.symbolicDynamics

def PhaseSpaceStratificationClosed (P : PhaseSpaceStratificationPackage) : Prop :=
  P.compactInvariantSet ∧ P.horseshoeEmbedding ∧ P.transverseHomoclinic ∧ P.symbolicDynamics

theorem phase_space_stratification_closed_from_evidence (P : PhaseSpaceStratificationPackage) (E : PhaseSpaceStratificationEvidence P) : PhaseSpaceStratificationClosed P := by
  exact And.intro E.compactInvariantSetClosed (And.intro E.horseshoeEmbeddingClosed (And.intro E.transverseHomoclinicClosed E.symbolicDynamicsClosed))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse