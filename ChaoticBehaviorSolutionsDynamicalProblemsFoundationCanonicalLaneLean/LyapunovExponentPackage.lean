import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure LyapunovExponentPackage where
  determinantGrowthRate : Prop
  periodicOrbitStabilization : Prop
  sensitivityToInitialConditions : Prop
  topologicalTransitivity : Prop
  densePeriodicPoints : Prop

structure LyapunovExponentEvidence (L : LyapunovExponentPackage) where
  determinantGrowthRateClosed : L.determinantGrowthRate
  periodicOrbitStabilizationClosed : L.periodicOrbitStabilization
  sensitivityToInitialConditionsClosed : L.sensitivityToInitialConditions
  topologicalTransitivityClosed : L.topologicalTransitivity
  densePeriodicPointsClosed : L.densePeriodicPoints

def LyapunovExponentClosed (L : LyapunovExponentPackage) : Prop :=
  L.determinantGrowthRate ∧ L.periodicOrbitStabilization ∧
  L.sensitivityToInitialConditions ∧ L.topologicalTransitivity ∧
  L.densePeriodicPoints

theorem lyapunov_exponent_closed_from_evidence (L : LyapunovExponentPackage)
    (E : LyapunovExponentEvidence L) : LyapunovExponentClosed L := by
  exact And.intro E.determinantGrowthRateClosed
    (And.intro E.periodicOrbitStabilizationClosed
      (And.intro E.sensitivityToInitialConditionsClosed
        (And.intro E.topologicalTransitivityClosed
          E.densePeriodicPointsClosed)))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse