package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.michaelhoffmantech.recipemanager.recipedataservice.domain.RecipeInstruction;

public interface RecipeInstructionRepository
      extends JpaRepository<RecipeInstruction, Integer> {

}
