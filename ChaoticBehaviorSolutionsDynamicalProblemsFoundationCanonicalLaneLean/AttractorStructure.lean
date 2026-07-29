import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean

structure AttractorStructurePackage where
  phaseSpace : Type u
  dynamics : phaseSpace → phaseSpace
  attractorSet : Set phaseSpace
  attractorBasin : Set phaseSpace
  topologicallyTransitive : Prop
  sensitiveDependence : Prop
  densePeriodicOrbits : Prop
  attractorExists : Prop
  basinOfAttraction : Prop

structure AttractorStructureEvidence (A : AttractorStructurePackage) where
  topologicallyTransitiveClosed : A.topologicallyTransitive
  sensitiveDependenceClosed : A.sensitiveDependence
  densePeriodicOrbitsClosed : A.densePeriodicOrbits
  attractorExistsClosed : A.attractorExists
  basinOfAttractionClosed : A.basinOfAttraction

def AttractorStructureClosed (A : AttractorStructurePackage) : Prop :=
  A.topologicallyTransitive ∧ A.sensitiveDependence ∧ A.densePeriodicOrbits ∧
  A.attractorExists ∧ A.basinOfAttraction

theorem attractor_structure_closed_from_evidence (A : AttractorStructurePackage)
    (E : AttractorStructureEvidence A) : AttractorStructureClosed A :=
  And.intro E.topologicallyTransitiveClosed
    (And.intro E.sensitiveDependenceClosed
      (And.intro E.densePeriodicOrbitsClosed
        (And.intro E.attractorExistsClosed E.basinOfAttractionClosed)))

end ChaoticBehaviorSolutionsDynamicalProblemsFoundationCanonicalLaneLean
end HautevilleHouse