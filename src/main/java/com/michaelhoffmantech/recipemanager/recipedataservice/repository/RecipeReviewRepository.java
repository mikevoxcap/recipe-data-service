package com.michaelhoffmantech.recipemanager.recipedataservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.michaelhoffmantech.recipemanager.recipedataservice.domain.RecipeReview;

public interface RecipeReviewRepository extends JpaRepository<RecipeReview, Integer> {

}
