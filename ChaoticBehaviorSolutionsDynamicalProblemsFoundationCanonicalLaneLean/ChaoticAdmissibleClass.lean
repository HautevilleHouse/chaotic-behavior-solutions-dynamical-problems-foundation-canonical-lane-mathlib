import ChaoticBehaviorSolutionsDynamicalProblemsFoundation.MathlibObjects

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundation

structure AdmissibleClass where
  object : ChaoticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ChaoticWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundation
end HautevilleHouse