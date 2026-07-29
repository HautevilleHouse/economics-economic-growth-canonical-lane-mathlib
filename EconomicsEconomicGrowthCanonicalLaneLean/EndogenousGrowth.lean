import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure EndogenousGrowthPackage where
  humanCapitalAccumulation : Prop
  knowledgeSpillover : Prop
  researchProductivity : ℝ
  balancedGrowthConvergence : Prop

structure EndogenousGrowthEvidence (E : EndogenousGrowthPackage) where
  humanCapitalAccumulationClosed : E.humanCapitalAccumulation
  knowledgeSpilloverClosed : E.knowledgeSpillover
  balancedGrowthConvergenceClosed : E.balancedGrowthConvergence

def EndogenousGrowthClosed (E : EndogenousGrowthPackage) : Prop :=
  E.humanCapitalAccumulation ∧ E.knowledgeSpillover ∧ E.balancedGrowthConvergence

theorem endogenous_growth_closed_from_evidence (E : EndogenousGrowthPackage) (Ev : EndogenousGrowthEvidence E) :
    EndogenousGrowthClosed E := by
  exact And.intro Ev.humanCapitalAccumulationClosed
    (And.intro Ev.knowledgeSpilloverClosed Ev.balancedGrowthConvergenceClosed)

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse