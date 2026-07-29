import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure BifurcationRoutesPackage where
  periodDoublingCascade : Prop
  torusBreakdown : Prop
  intermittencyRoute : Prop
  crisisRoute : Prop

structure BifurcationRoutesEvidence (B : BifurcationRoutesPackage) where
  periodDoublingCascadeClosed : B.periodDoublingCascade
  torusBreakdownClosed : B.torusBreakdown
  intermittencyRouteClosed : B.intermittencyRoute
  crisisRouteClosed : B.crisisRoute

def BifurcationRoutesClosed (B : BifurcationRoutesPackage) : Prop :=
  B.periodDoublingCascade ∧ B.torusBreakdown ∧ B.intermittencyRoute ∧ B.crisisRoute

theorem bifurcation_routes_closed_from_evidence (B : BifurcationRoutesPackage) (E : BifurcationRoutesEvidence B) : BifurcationRoutesClosed B := by
  exact And.intro E.periodDoublingCascadeClosed (And.intro E.torusBreakdownClosed (And.intro E.intermittencyRouteClosed E.crisisRouteClosed))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse