import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure SensitiveDependencePackage where
  lyapunovExponentPositive : Prop
  expansivity : Prop
  mixingProperty : Prop
  topologicalTransitivity : Prop

structure SensitiveDependenceEvidence (S : SensitiveDependencePackage) where
  lyapunovExponentPositiveClosed : S.lyapunovExponentPositive
  expansivityClosed : S.expansivity
  mixingPropertyClosed : S.mixingProperty
  topologicalTransitivityClosed : S.topologicalTransitivity

def SensitiveDependenceClosed (S : SensitiveDependencePackage) : Prop :=
  S.lyapunovExponentPositive ∧ S.expansivity ∧ S.mixingProperty ∧ S.topologicalTransitivity

theorem sensitive_dependence_closed_from_evidence (S : SensitiveDependencePackage) (E : SensitiveDependenceEvidence S) : SensitiveDependenceClosed S := by
  exact And.intro E.lyapunovExponentPositiveClosed (And.intro E.expansivityClosed (And.intro E.mixingPropertyClosed E.topologicalTransitivityClosed))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse