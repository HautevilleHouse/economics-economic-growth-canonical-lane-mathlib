import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure CommoditySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicAdmittedObject where
  space : CommoditySpace
  preferenceRelation : Prop
  endowmentVector : Prop
  priceSystem : Type
  equilibriumAllocation : Prop
  conclusion : equilibriumAllocation

structure ArrowDebreuEquilibriumPackage where
  commoditySpace : CommoditySpace
  prices : Type
  allocations : Type
  convexPreferences : Prop
  continuousPreferences : Prop
  profitMaximization : Prop
  marketClearing : Prop
  welfareTheorems : Prop

structure ArrowDebreuEquilibriumEvidence (P : ArrowDebreuEquilibriumPackage) where
  convexPreferencesClosed : P.convexPreferences
  continuousPreferencesClosed : P.continuousPreferences
  profitMaximizationClosed : P.profitMaximization
  marketClearingClosed : P.marketClearing
  welfareTheoremsClosed : P.welfareTheorems

def ArrowDebreuEquilibriumClosed (P : ArrowDebreuEquilibriumPackage) : Prop :=
  P.convexPreferences ∧ P.continuousPreferences ∧ P.profitMaximization ∧ P.marketClearing ∧ P.welfareTheorems

theorem arrow_debreu_equilibrium_closed_from_evidence
    (P : ArrowDebreuEquilibriumPackage) (E : ArrowDebreuEquilibriumEvidence P) :
    ArrowDebreuEquilibriumClosed P := by
  exact And.intro E.convexPreferencesClosed
    (And.intro E.continuousPreferencesClosed
      (And.intro E.profitMaximizationClosed
        (And.intro E.marketClearingClosed E.welfareTheoremsClosed)))

def EquilibriumWitnessClosed (O : EconomicAdmittedObject) : Prop :=
  O.equilibriumAllocation

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse