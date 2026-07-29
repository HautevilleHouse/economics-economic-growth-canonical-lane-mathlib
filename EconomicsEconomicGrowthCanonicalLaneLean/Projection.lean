import EconomicsEconomicGrowthCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def growthProjection : Projection GrowthEndgameState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem growth_projection_idempotent (x : GrowthEndgameState) :
    growthProjection.toFun (growthProjection.toFun x) = growthProjection.toFun x := by
  exact growthProjection.idempotent x

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse