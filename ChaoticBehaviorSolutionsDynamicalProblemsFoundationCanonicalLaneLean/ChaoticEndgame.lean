import ChaoticBehaviorSolutionsDynamicalProblemsFoundation.BifurcationAnalysis

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChaoticWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedChaoticClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_chaotic_endgame (A : AdmissibleClass) :
    ConstrainedChaoticClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundation
end HautevilleHouse