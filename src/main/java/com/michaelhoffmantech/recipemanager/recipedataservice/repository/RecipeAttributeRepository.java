package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.michaelhoffmantech.recipemanager.recipedataservice.domain.RecipeAttribute;

public interface RecipeAttributeRepository
      extends JpaRepository<RecipeAttribute, Integer> {

}
