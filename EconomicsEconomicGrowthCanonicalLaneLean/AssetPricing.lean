import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure StochasticDiscountFactor where
  statePrices : Type u
  discountFactor : ℝ
  kernel : ℝ → ℝ

structure Asset (S : StochasticDiscountFactor) where
  payoff : ℝ
  price : ℝ
  fundamentalEquation : Prop
  noArbitrage : Prop

structure AssetPricingPackage (S : StochasticDiscountFactor) where
  assets : List (Asset S)
  discountFactorModel : S
  pricingKernel : S.kernel → ℝ
  lawOfOnePrice : Prop
  noArbitrageCondition : Prop

structure AssetPricingEvidence {S : StochasticDiscountFactor} (A : AssetPricingPackage S) where
  lawOfOnePriceClosed : A.lawOfOnePrice
  noArbitrageConditionClosed : A.noArbitrageCondition

def AssetPricingClosed {S : StochasticDiscountFactor} (A : AssetPricingPackage S) : Prop :=
  A.lawOfOnePrice ∧ A.noArbitrageCondition

theorem asset_pricing_closed_from_evidence {S : StochasticDiscountFactor} (A : AssetPricingPackage S) (Ev : AssetPricingEvidence A) : AssetPricingClosed A := by
  exact And.intro Ev.lawOfOnePriceClosed Ev.noArbitrageConditionClosed

structure ConsumptionCAPM (S : StochasticDiscountFactor) where
  consumptionGrowth : ℝ → ℝ
  riskAversion : ℝ
  discountFactor : ℝ
  consumptionBasedPricing : Prop
  equityPremiumPuzzle : Prop

structure ConsumptionCAPMEvidence {S : StochasticDiscountFactor} (C : ConsumptionCAPM S) where
  consumptionBasedPricingClosed : C.consumptionBasedPricing
  equityPremiumPuzzleClosed : C.equityPremiumPuzzle

def ConsumptionCAPMClosed {S : StochasticDiscountFactor} (C : ConsumptionCAPM S) : Prop :=
  C.consumptionBasedPricing ∧ C.equityPremiumPuzzle

theorem consumption_capm_closed_from_evidence {S : StochasticDiscountFactor} (C : ConsumptionCAPM S) (Ev : ConsumptionCAPMEvidence C) : ConsumptionCAPMClosed C := by
  exact And.intro Ev.consumptionBasedPricingClosed Ev.equityPremiumPuzzleClosed

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse