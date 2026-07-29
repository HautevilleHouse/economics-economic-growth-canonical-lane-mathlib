import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure RealBusinessCyclePreferences where
  representativeHousehold : Type
  laborSupplyElasticity : ℝ
  riskAversion : ℝ
  separableUtility : Prop

structure RealBusinessCyclePackage (Pref : RealBusinessCyclePreferences) where
  productivityShock : Prop
  capitalAdjustmentCost : Prop
  equilibriumDynamics : Prop
  impulseResponseIdentified : Prop

structure RealBusinessCycleEvidence {Pref : RealBusinessCyclePreferences}
    (B : RealBusinessCyclePackage Pref) where
  productivityShockClosed : B.productivityShock
  capitalAdjustmentCostClosed : B.capitalAdjustmentCost
  equilibriumDynamicsClosed : B.equilibriumDynamics
  impulseResponseIdentifiedClosed : B.impulseResponseIdentified

def RealBusinessCycleClosed {Pref : RealBusinessCyclePreferences}
    (B : RealBusinessCyclePackage Pref) : Prop :=
  B.productivityShock ∧ B.capitalAdjustmentCost ∧ B.equilibriumDynamics ∧ B.impulseResponseIdentified

theorem real_business_cycle_closed_from_evidence
    {Pref : RealBusinessCyclePreferences} (B : RealBusinessCyclePackage Pref)
    (E : RealBusinessCycleEvidence B) : RealBusinessCycleClosed B := by
  exact And.intro E.productivityShockClosed
    (And.intro E.capitalAdjustmentCostClosed
      (And.intro E.equilibriumDynamicsClosed E.impulseResponseIdentifiedClosed))

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse