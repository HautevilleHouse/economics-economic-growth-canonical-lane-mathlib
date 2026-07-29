import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure BusinessCyclesPackage where
  realShocks : Type u
  nominalFrictions : Type u
  monetaryPolicyRule : Type u
  stickyPrices : Prop
  outputGapEquation : Prop
  phillipsCurve : Prop
  stickyPricesProof : stickyPrices
  outputGapEquationProof : outputGapEquation

structure BusinessCyclesEvidence (B : BusinessCyclesPackage) where
  stickyPricesClosed : B.stickyPrices
  outputGapEquationClosed : B.outputGapEquation
  phillipsCurveClosed : B.phillipsCurve

def BusinessCyclesClosed (B : BusinessCyclesPackage) : Prop :=
  B.stickyPrices ∧ B.outputGapEquation ∧ B.phillipsCurve

theorem business_cycles_closed_from_evidence (B : BusinessCyclesPackage) (E : BusinessCyclesEvidence B) :
    BusinessCyclesClosed B := by
  exact And.intro E.stickyPricesClosed (And.intro E.outputGapEquationClosed E.phillipsCurveClosed)

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse
