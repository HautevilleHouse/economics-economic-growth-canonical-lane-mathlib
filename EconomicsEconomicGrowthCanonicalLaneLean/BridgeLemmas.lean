import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EquilibriumWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse