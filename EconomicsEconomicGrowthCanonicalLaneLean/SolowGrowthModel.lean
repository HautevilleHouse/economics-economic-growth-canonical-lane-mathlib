import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure SolowGrowthPackage where
  capitalStock : Type u
  laborForce : Type u
  technology : Type u
  output : Type u
  productionFunction : capitalStock → laborForce → technology → output
  capitalAccumulationLaw : Prop
  laborGrowthRate : Prop
  technologicalProgressRate : Prop
  steadyStateExists : Prop
  steadyStateExistsProof : steadyStateExists

structure SolowGrowthEvidence (S : SolowGrowthPackage) where
  capitalAccumulationLawClosed : S.capitalAccumulationLaw
  laborGrowthRateClosed : S.laborGrowthRate
  technologicalProgressRateClosed : S.technologicalProgressRate
  steadyStateExistsClosed : S.steadyStateExists

def SolowGrowthClosed (S : SolowGrowthPackage) : Prop :=
  S.capitalAccumulationLaw ∧ S.laborGrowthRate ∧ S.technologicalProgressRate ∧ S.steadyStateExists

theorem solow_growth_closed_from_evidence (S : SolowGrowthPackage) (E : SolowGrowthEvidence S) :
    SolowGrowthClosed S := by
  exact And.intro E.capitalAccumulationLawClosed
    (And.intro E.laborGrowthRateClosed
      (And.intro E.technologicalProgressRateClosed E.steadyStateExistsClosed))

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse
