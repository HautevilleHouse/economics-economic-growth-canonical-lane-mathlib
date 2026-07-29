import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure ArrowDebreuCommoditySpace where
  commodityTypes : Type
  priceSystem : commodityTypes → ℝ
  endowments : commodityTypes → ℝ
  preferencesRepresentable : Prop
  marketClearingCondition : Prop

structure ArrowDebreuEquilibriumPackage where
  commoditySpace : ArrowDebreuCommoditySpace
  equilibriumPrice : ArrowDebreuCommoditySpace.commodityTypes → ℝ
  allocation : ArrowDebreuCommoditySpace.commodityTypes → ℝ
  budgetConstraintsSatisfied : Prop
  utilityMaximization : Prop
  profitMaximization : Prop
  marketClears : Prop

structure ArrowDebreuEvidence (A : ArrowDebreuEquilibriumPackage) where
  budgetConstraintsSatisfiedClosed : A.budgetConstraintsSatisfied
  utilityMaximizationClosed : A.utilityMaximization
  profitMaximizationClosed : A.profitMaximization
  marketClearsClosed : A.marketClears

def ArrowDebreuEquilibriumClosed (A : ArrowDebreuEquilibriumPackage) : Prop :=
  A.budgetConstraintsSatisfied ∧ A.utilityMaximization ∧ A.profitMaximization ∧ A.marketClears

theorem arrow_debreu_equilibrium_closed_from_evidence
    (A : ArrowDebreuEquilibriumPackage) (E : ArrowDebreuEvidence A) :
    ArrowDebreuEquilibriumClosed A := by
  exact And.intro E.budgetConstraintsSatisfiedClosed
    (And.intro E.utilityMaximizationClosed
      (And.intro E.profitMaximizationClosed E.marketClearsClosed))

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse