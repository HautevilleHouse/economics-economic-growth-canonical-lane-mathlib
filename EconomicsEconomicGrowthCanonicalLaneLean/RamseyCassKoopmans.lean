import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure RamseyCassKoopmansPackage where
  utilityDiscountRate : ℝ
  intertemporalElasticity : ℝ
  capitalShare : ℝ
  eulerEquation : Prop
  saddlePathStability : Prop

structure RamseyCassKoopmansEvidence (R : RamseyCassKoopmansPackage) where
  eulerEquationClosed : R.eulerEquation
  saddlePathStabilityClosed : R.saddlePathStability

def RamseyCassKoopmansClosed (R : RamseyCassKoopmansPackage) : Prop :=
  R.eulerEquation ∧ R.saddlePathStability

theorem ramsey_cass_koopmans_closed_from_evidence (R : RamseyCassKoopmansPackage) (E : RamseyCassKoopmansEvidence R) :
    RamseyCassKoopmansClosed R := by
  exact And.intro E.eulerEquationClosed E.saddlePathStabilityClosed

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse