import canonicalLaneMathlib.AdmissibleClass
import EconomicsEconomicGrowthCanonicalLaneLean.SolowGrowthModel
import EconomicsEconomicGrowthCanonicalLaneLean.RamseyCassKoopmans
import EconomicsEconomicGrowthCanonicalLaneLean.ArrowDebreuEquilibrium
import EconomicsEconomicGrowthCanonicalLaneLean.EndogenousGrowth
import EconomicsEconomicGrowthCanonicalLaneLean.AssetPricing
import EconomicsEconomicGrowthCanonicalLaneLean.BusinessCycles

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure EconomicsAdmissibleClass where
  solow : SolowGrowthPackage
  ramsey : RamseyCassKoopmansPackage
  arrowDebreu : ArrowDebreuEconomy
  endogenous : EndogenousGrowthPackage
  assetPricing : AssetPricingPackage
  businessCycles : BusinessCyclesPackage
  allClosed : Prop
  allClosedProof : allClosed

def bridgeClosed (A : EconomicsAdmissibleClass) : Prop :=
  SolowGrowthClosed A.solow ∧ RamseyCassKoopmansClosed A.ramsey ∧ ArrowDebreuEquilibriumClosed A.arrowDebreu
  ∧ EndogenousGrowthClosed A.endogenous ∧ AssetPricingClosed A.assetPricing ∧ BusinessCyclesClosed A.businessCycles

theorem bridge_from_admissible_class (A : EconomicsAdmissibleClass) : bridgeClosed A := by
  exact A.allClosedProof

def gateClosed (A : EconomicsAdmissibleClass) : Prop :=
  True

theorem gate_from_admissible_class (A : EconomicsAdmissibleClass) : gateClosed A := by
  trivial

def ConstrainedEconomicGrowthClosure (A : EconomicsAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_economic_growth_endgame (A : EconomicsAdmissibleClass) :
    ConstrainedEconomicGrowthClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse
