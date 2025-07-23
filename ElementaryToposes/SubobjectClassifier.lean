import Mathlib.CategoryTheory.Category.Basic
import Mathlib.CategoryTheory.Closed.Cartesian
import Mathlib.CategoryTheory.Subobject.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.CategoryTheory.Limits.Shapes.Equalizers
import Mathlib.CategoryTheory.ChosenFiniteProducts
import ElementaryToposes.ChosenFiniteLimits

import Mathlib.Topology.Sheaves.Presheaf
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Spaces

open CategoryTheory Sieve Limits Opposite Category

universe u u₁ u₂ v v₁ v₂

class CategoryTheory.ChosenSubobjectClassifier (C : Type u) [Category.{v} C] [out : ChosenFiniteLimits C] where
  Ω : C

-- Functor.RepresentableBy
