import Mathlib.CategoryTheory.Category.Basic
import Mathlib.CategoryTheory.Closed.Cartesian
import Mathlib.CategoryTheory.Subobject.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.CategoryTheory.Limits.Shapes.Equalizers
import Mathlib.CategoryTheory.ChosenFiniteProducts
import Mathlib.Topology.Sheaves.Presheaf
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Spaces

open CategoryTheory Sieve Limits Opposite Category

universe u u₁ u₂ v v₁ v₂

noncomputable section

class Topos (C : Type u) extends Category.{v} C where
  finiteLimits : Limits.HasFiniteLimits C
  finProd : Limits.HasFiniteProducts C := inferInstance
  chosenFinProd : ChosenFiniteProducts C := ChosenFiniteProducts.ofFiniteProducts C
  cartesian : CartesianClosed C

variable {C : Type u₁} [Category.{v₁} C]
variable (J : GrothendieckTopology C)
variable (A : Type u₂) [Category.{v₂} A]

#check (Sheaf J A)

-- Define chosen limits
-- Get chosen finite products
-- RepresentableBy instead of IsRepresentable for subobject classifier
-- ChosenSubobjectClassifier
-- Elementary Topos
-- class Topos (C : Type u) extends ChosenFiniteLimits, CartesianClosed, ChosenSubobjectClassifier
-- Stretch goal: (chosen) Natural numbers
-- Examples:
-- Finite sets
-- Type u
-- Presheaves
-- Sheaves (maybe)
