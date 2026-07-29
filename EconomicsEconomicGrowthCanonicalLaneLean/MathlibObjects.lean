import EconomicsEconomicGrowthCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GrowthSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GrowthAdmittedObject where
  space : GrowthSpace
  completeMarket : Prop
  paretoOptimal : Prop
  equilibriumModel : Type
  equilibriumTopology : TopologicalSpace equilibriumModel
  equilibriumExists : Prop
  conclusion : equilibriumExists

structure GrowthEndgameState where
  object : GrowthAdmittedObject

def GrowthWitnessClosed (O : GrowthAdmittedObject) : Prop :=
  O.equilibriumExists

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse