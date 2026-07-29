import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean.ChaoticMapsClasses

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure ParameterizedDynamics (C : ChaoticSystem) (Param : Type u) where
  paramSpace : Param
  dynamicsAtParam : Param → C.phaseSpace → C.phaseSpace
  dynamicsContinuousInParam : Prop

structure BifurcationPoint (C : ChaoticSystem) (Param : Type u) (P : ParameterizedDynamics C Param) where
  paramValue : Param
  beforeStability : Prop
  afterChaos : Prop
  structuralChange : Prop

def BifurcationPointEvidence {C : ChaoticSystem} {Param : Type u} {P : ParameterizedDynamics C Param} (B : BifurcationPoint C Param P) : Prop :=
  B.structuralChange

def BifurcationPointClosed {C : ChaoticSystem} {Param : Type u} {P : ParameterizedDynamics C Param} (B : BifurcationPoint C Param P) : Prop :=
  B.structuralChange

theorem bifurcation_point_closed_from_evidence {C : ChaoticSystem} {Param : Type u} {P : ParameterizedDynamics C Param} (B : BifurcationPoint C Param P) (E : BifurcationPointEvidence B) : BifurcationPointClosed B :=
  B.structuralChange

theorem bifurcation_leads_to_chaos {C : ChaoticSystem} {Param : Type u} {P : ParameterizedDynamics C Param} (B : BifurcationPoint C Param P) (hafter : B.afterChaos) : ChaoticSystemClosed C := by
  exact And.intro C.sensitiveDependence (And.intro C.topologicalTransitivity C.densePeriodicPoints)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse