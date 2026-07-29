import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure PreferenceRelation (X : Type u) where
  atLeastAsGood : X → X → Prop
  completeness : ∀ x y : X, atLeastAsGood x y ∨ atLeastAsGood y x
  transitivity : ∀ x y z : X, atLeastAsGood x y → atLeastAsGood y z → atLeastAsGood x z

structure UtilityFunction (X : Type u) where
  u : X → ℝ
  represents : PreferenceRelation X → Prop
  continuous : Prop
  strictlyIncreasing : Prop

structure UtilityRepresentationPackage (X : Type u) where
  preferences : PreferenceRelation X
  utility : UtilityFunction X
  representationProof : Prop
  continuityProof : Prop
  monotonicityProof : Prop

structure UtilityRepresentationEvidence {X : Type u} (U : UtilityRepresentationPackage X) where
  representationProofClosed : U.representationProof
  continuityProofClosed : U.continuityProof
  monotonicityProofClosed : U.monotonicityProof

def UtilityRepresentationClosed {X : Type u} (U : UtilityRepresentationPackage X) : Prop :=
  U.representationProof ∧ U.continuityProof ∧ U.monotonicityProof

theorem utility_representation_closed_from_evidence {X : Type u} (U : UtilityRepresentationPackage X) (Ev : UtilityRepresentationEvidence U) : UtilityRepresentationClosed U := by
  exact And.intro Ev.representationProofClosed (And.intro Ev.continuityProofClosed Ev.monotonicityProofClosed)

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse