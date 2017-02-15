package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.michaelhoffmantech.recipemanager.recipedataservice.domain.RecipeIngredient;

public interface RecipeIngredientRepository
      extends JpaRepository<RecipeIngredient, Integer> {

}
