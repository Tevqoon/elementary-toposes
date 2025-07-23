import Mathlib.CategoryTheory.Limits.Cones
import Mathlib.CategoryTheory.Limits.IsLimit
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.CategoryTheory.FinCategory.AsType
import Mathlib.CategoryTheory.ChosenFiniteProducts

open CategoryTheory CategoryTheory.Category CategoryTheory.Functor Opposite

namespace CategoryTheory.Limits

universe v₁ u₁ v₂ u₂ v₃ u₃ v v' v'' u u' u''

variable {J : Type u₁} [Category.{v₁} J] -- {K : Type u₂} [Category.{v₂} K]
variable {C : Type u} [Category.{v, u} C]
-- variable {F : J ⥤ C}

section Limit

/-- `ChosenLimit F` represents the chosen existence of a limit for `F`. -/
class ChosenLimit (F : J ⥤ C) where
  /-- There is a limit cone for `F` -/
  chosen_limit : Inhabited (LimitCone F)

/-- A chosen limit for a given cone is also a limit. -/
instance hasLimit_From_chosenLimit {F : J ⥤ C} (d : ChosenLimit F) : HasLimit F := by
  constructor
  exact ⟨d.chosen_limit.default⟩

/-- `C` has chosen limits of shape `J` if for every functor `F : J ⥤ C` we have its chosen limit. -/
class ChosenLimitsOfShape (J : Type u₁) [Category.{v₁} J] (C : Type u) [Category.{v, u} C] where
  chosen_limits : ∀ F : J ⥤ C, ChosenLimit F

/-- A category `C` has all chosen finite limits if for every functor `J ⥤ C` with instance `FinCategory J` instance and `J : Type` we have its chosen limit. -/
class ChosenFiniteLimits (C : Type u) [Category.{v, u} C] where
  out (J : Type) [𝒥 : SmallCategory J] [@FinCategory J 𝒥] : @ChosenLimitsOfShape J 𝒥 C _

/-- An instance giving us chosen finite products from given chosen finite limits. -/
noncomputable instance ChosenFiniteProducts_From_ChosenFiniteLimits (d : ChosenFiniteLimits C) : ChosenFiniteProducts C := by
  constructor
  intro X Y
  case product =>
    have h1 : ChosenLimitsOfShape (Discrete WalkingPair) C := d.out (Discrete WalkingPair)
    have h2 := h1.chosen_limits (pair X Y)
    exact h2.chosen_limit.default
  case terminal =>
    have h1 : ChosenLimitsOfShape (Discrete PEmpty) C := d.out (Discrete PEmpty)
    have h2 : ChosenLimit (empty C) := h1.chosen_limits (empty C)
    exact h2.chosen_limit.default
