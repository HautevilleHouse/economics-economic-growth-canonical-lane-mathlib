import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsEconomicGrowthCanonicalLaneLean

structure ProductionFunction where
  capital : ℝ
  labor : ℝ
  output : ℝ → ℝ → ℝ
  constantReturnsToScale : Prop

structure SolowModel (P : ProductionFunction) where
  savingsRate : ℝ
  depreciationRate : ℝ
  capitalAccumulation : ℝ → ℝ → ℝ
  steadyStateCapital : ℝ
  dynamics : Prop
  convergence : Prop

structure SolowModelEvidence {P : ProductionFunction} (S : SolowModel P) where
  dynamicsClosed : S.dynamics
  convergenceClosed : S.convergence

def SolowModelClosed {P : ProductionFunction} (S : SolowModel P) : Prop :=
  S.dynamics ∧ S.convergence

theorem solow_model_closed_from_evidence {P : ProductionFunction} (S : SolowModel P) (Ev : SolowModelEvidence S) : SolowModelClosed S := by
  exact And.intro Ev.dynamicsClosed Ev.convergenceClosed

structure RamseyCassKoopmansModel (P : ProductionFunction) where
  householdUtility : ℝ → ℝ
  capitalStock : ℝ → ℝ
  eulerEquation : Prop
  steadyState : Prop
  saddlePathStability : Prop

structure RamseyCassKoopmansEvidence {P : ProductionFunction} (R : RamseyCassKoopmansModel P) where
  eulerEquationClosed : R.eulerEquation
  steadyStateClosed : R.steadyState
  saddlePathStabilityClosed : R.saddlePathStability

def RamseyCassKoopmansClosed {P : ProductionFunction} (R : RamseyCassKoopmansModel P) : Prop :=
  R.eulerEquation ∧ R.steadyState ∧ R.saddlePathStability

theorem ramsey_cass_koopmans_closed_from_evidence {P : ProductionFunction} (R : RamseyCassKoopmansModel P) (Ev : RamseyCassKoopmansEvidence R) : RamseyCassKoopmansClosed R := by
  exact And.intro Ev.eulerEquationClosed (And.intro Ev.steadyStateClosed Ev.saddlePathStabilityClosed)

end EconomicsEconomicGrowthCanonicalLaneLean
end HautevilleHouse