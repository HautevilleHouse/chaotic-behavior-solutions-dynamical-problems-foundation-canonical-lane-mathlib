import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure BifurcationPackage where
  parameterFamily : Prop
  bifurcationPointExists : Prop
  stabilityChange : Prop
  periodicOrbitCreation : Prop
  chaosTransition : Prop

structure BifurcationEvidence (B : BifurcationPackage) where
  parameterFamilyClosed : B.parameterFamily
  bifurcationPointExistsClosed : B.bifurcationPointExists
  stabilityChangeClosed : B.stabilityChange
  periodicOrbitCreationClosed : B.periodicOrbitCreation
  chaosTransitionClosed : B.chaosTransition

def BifurcationClosed (B : BifurcationPackage) : Prop :=
  B.parameterFamily ∧ B.bifurcationPointExists ∧
  B.stabilityChange ∧ B.periodicOrbitCreation ∧
  B.chaosTransition

theorem bifurcation_closed_from_evidence (B : BifurcationPackage)
    (E : BifurcationEvidence B) : BifurcationClosed B := by
  exact And.intro E.parameterFamilyClosed
    (And.intro E.bifurcationPointExistsClosed
      (And.intro E.stabilityChangeClosed
        (And.intro E.periodicOrbitCreationClosed
          E.chaosTransitionClosed)))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse