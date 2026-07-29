import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure SolowSwanPackage where
  capitalOutputElasticity : ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  populationGrowthRate : ℝ
  steadyStateCapital : Prop
  balancedGrowthPath : Prop

structure SolowSwanEvidence (S : SolowSwanPackage) where
  steadyStateCapitalClosed : S.steadyStateCapital
  balancedGrowthPathClosed : S.balancedGrowthPath

def SolowSwanClosed (S : SolowSwanPackage) : Prop :=
  S.steadyStateCapital ∧ S.balancedGrowthPath

theorem solow_swan_closed_from_evidence (S : SolowSwanPackage) (E : SolowSwanEvidence S) :
    SolowSwanClosed S := by
  exact And.intro E.steadyStateCapitalClosed E.balancedGrowthPathClosed

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse