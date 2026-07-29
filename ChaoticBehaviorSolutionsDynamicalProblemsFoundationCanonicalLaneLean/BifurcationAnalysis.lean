import ChaoticBehaviorSolutionsDynamicalProblemsFoundation.AttractorStrange

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundation

structure BifurcationPackage {P : PhaseSpacePackage} {L : LyapunovExponentPackage P}
    {S : StrangeAttractorPackage L} where
  parameterSpace : Type u
  bifurcationPoint : parameterSpace
  qualitativeChange : Prop
  attractorBirth : Prop
  attractorDeath : Prop
  bifurcationPointIdentified : bifurcationPoint
  qualitativeChangeClosed : qualitativeChange
  attractorBirthClosed : attractorBirth
  attractorDeathClosed : attractorDeath

def BifurcationClosed {P : PhaseSpacePackage} {L : LyapunovExponentPackage P}
    {S : StrangeAttractorPackage L} (B : BifurcationPackage S) : Prop :=
  B.qualitativeChange ∧ B.attractorBirth ∧ B.attractorDeath

structure BifurcationEvidence {P : PhaseSpacePackage} {L : LyapunovExponentPackage P}
    {S : StrangeAttractorPackage L} (B : BifurcationPackage S) where
  qualitativeChangeClosed : B.qualitativeChange
  attractorBirthClosed : B.attractorBirth
  attractorDeathClosed : B.attractorDeath

theorem bifurcation_closed_from_evidence
    {P : PhaseSpacePackage} {L : LyapunovExponentPackage P}
    {S : StrangeAttractorPackage L} (B : BifurcationPackage S) (E : BifurcationEvidence B) :
    BifurcationClosed B := by
  exact And.intro E.qualitativeChangeClosed
    (And.intro E.attractorBirthClosed E.attractorDeathClosed)

end ChaoticBehaviorSolutionsDynamicalProblemsFoundation
end HautevilleHouse