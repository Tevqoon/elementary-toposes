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

import ElementaryToposes.ChosenFiniteLimits
import ElementaryToposes.SubobjectClassifier

open CategoryTheory Sieve Limits Opposite Category

universe u u₁ u₂ v v₁ v₂

namespace CategoryTheory

noncomputable section

/-- A topos is a category with chosen finite limits which is cartesian closed with respect to the inherited product structure with a chosen subobject classifier. -/
class ElementaryTopos (C : Type u) extends Category.{v} C where
  chosenFiniteLimits : ChosenFiniteLimits C
  chosenFinProd : ChosenFiniteProducts C := ChosenFiniteProducts_From_ChosenFiniteLimits chosenFiniteLimits
  cartesian : CartesianClosed C

-- class Topos (C : Type u) [Category.{v} C] extends
--  ChosenFiniteLimits C,
--  CartesianClosed C,
--  ChosenSubobjectClassifier C
